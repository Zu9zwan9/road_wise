import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../dashboard/gamification/utils/gamification_manager.dart';
import '../bloc/quiz_bloc.dart';

class QuizScreen extends StatefulWidget {
  final String quizId;

  const QuizScreen({super.key, required this.quizId});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  final GamificationManager _gamificationManager = GamificationManager();
  late AnimationController _animationController;
  int? _selectedOptionIndex;
  bool _showExplanation = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuizBloc>(context).add(LoadQuiz(quizId: widget.quizId));
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            if (state is QuizLoaded) {
              return Text(state.quiz.title);
            }
            return const Text('Quiz');
          },
        ),
        backgroundColor: AppColors.canadianBlue,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              _showQuitConfirmation(context);
            },
          ),
        ],
      ),
      body: BlocConsumer<QuizBloc, QuizState>(
        listener: (context, state) {
          if (state is QuizCompleted) {
            Future.delayed(const Duration(milliseconds: 500), () {
              Navigator.of(context).pushReplacementNamed(
                '/quiz-results',
                arguments: {
                  'quizId': widget.quizId,
                  'score': state.score,
                  'correctAnswers': state.correctAnswersCount,
                  'totalQuestions': state.questions.length,
                  'isPassed': state.isPassed,
                  'earnedXp': state.earnedXp,
                },
              );

              _gamificationManager.showXpGain(
                context,
                state.earnedXp,
                'quiz_completed',
              );

              _gamificationManager.checkBadgeEligibility(
                context,
                'quiz_completed',
                {'score': state.score.round()},
              );
            });
          }
        },
        builder: (context, state) {
          if (state is QuizLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is QuizLoaded && !state.isCompleted) {
            return _buildQuizContent(state);
          } else if (state is QuizError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.errorRed,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${state.message}',
                    style: const TextStyle(color: AppColors.errorRed),
                  ),
                  const SizedBox(height: 16),
                  AppWidgets.secondaryButton(
                    text: 'Try Again',
                    onPressed: () {
                      BlocProvider.of<QuizBloc>(
                        context,
                      ).add(LoadQuiz(quizId: widget.quizId));
                    },
                    isFullWidth: false,
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Loading quiz...'));
          }
        },
      ),
    );
  }

  Widget _buildQuizContent(QuizLoaded state) {
    final currentQuestion = state.currentQuestion;
    final isAnswered = state.userAnswers.containsKey(currentQuestion.id);
    final userAnswer = isAnswered
        ? state.userAnswers[currentQuestion.id]
        : null;
    final isCorrect =
        isAnswered && userAnswer == currentQuestion.correctOptionIndex;

    return Column(
      children: [
        LinearProgressIndicator(
          value: (state.currentQuestionIndex + 1) / state.questions.length,
          backgroundColor: AppColors.lightGray,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.mapleRed),
          minHeight: 6,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Question ${state.currentQuestionIndex + 1}/${state.questions.length}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isAnswered)
                Icon(
                  isCorrect ? Icons.check_circle : Icons.cancel,
                  color: isCorrect
                      ? AppColors.successGreen
                      : AppColors.errorRed,
                ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (currentQuestion.imageAsset != null)
                  Container(
                    height: 200,
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(currentQuestion.imageAsset!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                Text(
                  currentQuestion.text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                ...List.generate(
                  currentQuestion.options.length,
                  (index) => _buildOptionItem(
                    context,
                    index,
                    currentQuestion.options[index],
                    isSelected: _selectedOptionIndex == index,
                    isCorrect:
                        isAnswered &&
                        index == currentQuestion.correctOptionIndex,
                    isIncorrect:
                        isAnswered &&
                        userAnswer == index &&
                        index != currentQuestion.correctOptionIndex,
                    isDisabled: isAnswered,
                    onTap: isAnswered
                        ? null
                        : () => _selectOption(context, state, index),
                  ),
                ),
                if (_showExplanation)
                  AnimatedOpacity(
                    opacity: _showExplanation ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      margin: const EdgeInsets.only(top: 24),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isCorrect
                            ? AppColors.successGreen.withOpacity(0.1)
                            : AppColors.errorRed.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isCorrect
                              ? AppColors.successGreen
                              : AppColors.errorRed,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                isCorrect ? Icons.check_circle : Icons.info,
                                color: isCorrect
                                    ? AppColors.successGreen
                                    : AppColors.errorRed,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                isCorrect ? 'Correct!' : 'Explanation',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isCorrect
                                      ? AppColors.successGreen
                                      : AppColors.errorRed,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            currentQuestion.explanation,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: isAnswered
              ? Row(
                  children: [
                    if (!_showExplanation)
                      Expanded(
                        child: AppWidgets.secondaryButton(
                          text: 'Show Explanation',
                          onPressed: () {
                            setState(() {
                              _showExplanation = true;
                            });
                          },
                        ),
                      ),
                    if (!_showExplanation) const SizedBox(width: 16),
                    Expanded(
                      child: AppWidgets.primaryButton(
                        text: state.isLastQuestion
                            ? 'Finish Quiz'
                            : 'Next Question',
                        onPressed: () {
                          setState(() {
                            _selectedOptionIndex = null;
                            _showExplanation = false;
                          });

                          if (state.isLastQuestion) {
                            BlocProvider.of<QuizBloc>(
                              context,
                            ).add(SubmitQuiz());
                          }
                        },
                      ),
                    ),
                  ],
                )
              : AppWidgets.primaryButton(
                  text: 'Submit Answer',
                  onPressed: () {
                    if (_selectedOptionIndex != null) {
                      BlocProvider.of<QuizBloc>(context).add(
                        AnswerQuestion(
                          questionId: currentQuestion.id,
                          selectedOptionIndex: _selectedOptionIndex!,
                        ),
                      );
                    }
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildOptionItem(
    BuildContext context,
    int index,
    String optionText, {
    required bool isSelected,
    required bool isCorrect,
    required bool isIncorrect,
    required bool isDisabled,
    VoidCallback? onTap,
  }) {
    Color backgroundColor;
    Color borderColor;
    Color textColor;

    if (isCorrect) {
      backgroundColor = AppColors.successGreen.withOpacity(0.1);
      borderColor = AppColors.successGreen;
      textColor = AppColors.successGreen;
    } else if (isIncorrect) {
      backgroundColor = AppColors.errorRed.withOpacity(0.1);
      borderColor = AppColors.errorRed;
      textColor = AppColors.errorRed;
    } else if (isSelected) {
      backgroundColor = AppColors.mapleRed.withOpacity(0.1);
      borderColor = AppColors.mapleRed;
      textColor = AppColors.mapleRed;
    } else {
      backgroundColor = Colors.white;
      borderColor = AppColors.lightGray;
      textColor = AppColors.nearBlack;
    }

    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor,
            width: isSelected || isCorrect || isIncorrect ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.mapleRed.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isSelected || isCorrect || isIncorrect
                    ? borderColor
                    : AppColors.lightGray,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: isCorrect
                    ? const Icon(Icons.check, color: Colors.white, size: 16)
                    : isIncorrect
                    ? const Icon(Icons.close, color: Colors.white, size: 16)
                    : Text(
                        String.fromCharCode(65 + index),
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.darkGray,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                optionText,
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: isSelected || isCorrect || isIncorrect
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _selectOption(BuildContext context, QuizLoaded state, int index) {
    _animationController.reset();
    _animationController.forward();

    setState(() {
      _selectedOptionIndex = index;
    });
  }

  void _showQuitConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Quit Quiz?'),
        content: const Text(
          'Your progress will be lost. Are you sure you want to quit?',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Quit'),
          ),
        ],
      ),
    );
  }
}
