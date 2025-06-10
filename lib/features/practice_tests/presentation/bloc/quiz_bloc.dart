import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/base_bloc.dart';
import '../../data/models/question_model.dart';
import '../../data/models/quiz_model.dart';

// Quiz Events
abstract class QuizEvent extends BaseEvent {}

class LoadQuiz extends QuizEvent {
  final String quizId;

  LoadQuiz({required this.quizId});

  @override
  List<Object> get props => [quizId];
}

class AnswerQuestion extends QuizEvent {
  final String questionId;
  final int selectedOptionIndex;

  AnswerQuestion({required this.questionId, required this.selectedOptionIndex});

  @override
  List<Object> get props => [questionId, selectedOptionIndex];
}

class SubmitQuiz extends QuizEvent {}

// Quiz States
abstract class QuizState extends BaseState {}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final QuizModel quiz;
  final List<QuestionModel> questions;
  final int currentQuestionIndex;
  final Map<String, int> userAnswers; // questionId -> selectedOptionIndex
  final bool isCompleted;

  QuizLoaded({
    required this.quiz,
    required this.questions,
    this.currentQuestionIndex = 0,
    this.userAnswers = const {},
    this.isCompleted = false,
  });

  QuestionModel get currentQuestion => questions[currentQuestionIndex];

  bool get isLastQuestion => currentQuestionIndex == questions.length - 1;

  int get correctAnswersCount {
    int count = 0;
    userAnswers.forEach((questionId, selectedIndex) {
      final question = questions.firstWhere((q) => q.id == questionId);
      if (question.correctOptionIndex == selectedIndex) {
        count++;
      }
    });
    return count;
  }

  double get score {
    if (questions.isEmpty) return 0;
    return (correctAnswersCount / questions.length) * 100;
  }

  bool get isPassed => score >= quiz.passingScore;

  int get earnedXp {
    if (!isCompleted) return 0;
    return (quiz.xpReward * (score / 100)).round();
  }

  @override
  List<Object> get props => [
    quiz,
    questions,
    currentQuestionIndex,
    userAnswers,
    isCompleted,
  ];
}

class QuizCompleted extends QuizState {
  final QuizModel quiz;
  final List<QuestionModel> questions;
  final Map<String, int> userAnswers;
  final int correctAnswersCount;
  final double score;
  final bool isPassed;
  final int earnedXp;

  QuizCompleted({
    required this.quiz,
    required this.questions,
    required this.userAnswers,
    required this.correctAnswersCount,
    required this.score,
    required this.isPassed,
    required this.earnedXp,
  });

  @override
  List<Object> get props => [
    quiz,
    questions,
    userAnswers,
    correctAnswersCount,
    score,
    isPassed,
    earnedXp,
  ];
}

class QuizError extends QuizState {
  final String message;

  QuizError({required this.message});

  @override
  List<Object> get props => [message];
}

// Quiz BLoC
class QuizBloc extends BaseBloc<QuizEvent, QuizState> {
  // In a real app, these would be injected
  // final QuizRepository quizRepository;
  // final UserProgressRepository progressRepository;

  QuizBloc() : super(QuizInitial()) {
    on<LoadQuiz>(_onLoadQuiz);
    on<AnswerQuestion>(_onAnswerQuestion);
    on<SubmitQuiz>(_onSubmitQuiz);
  }

  Future<void> _onLoadQuiz(LoadQuiz event, Emitter<QuizState> emit) async {
    emit(QuizLoading());
    try {
      // In a real app, fetch quiz and questions from repository
      // final quiz = await quizRepository.getQuizById(event.quizId);
      // final questions = await quizRepository.getQuestionsByQuizId(event.quizId);

      // Mock implementation for now
      await Future.delayed(const Duration(seconds: 1));

      // Create a mock quiz and questions
      final quiz = QuizModel(
        id: event.quizId,
        topicId: 'topic1',
        title: 'Regulatory Signs Quiz',
        description: 'Test your knowledge of regulatory signs in Canada.',
        passingScore: 80,
        xpReward: 50,
        questionIds: ['q1', 'q2', 'q3', 'q4', 'q5'],
      );

      final questions = [
        QuestionModel(
          id: 'q1',
          quizId: event.quizId,
          text: 'What shape is a standard stop sign?',
          options: ['Circle', 'Triangle', 'Octagon', 'Rectangle'],
          correctOptionIndex: 2,
          explanation:
              'Stop signs are octagonal (8-sided) with a red background and white border.',
          imageAsset: 'assets/images/questions/stop_sign.png',
        ),
        QuestionModel(
          id: 'q2',
          quizId: event.quizId,
          text: 'What does a yield sign indicate?',
          options: [
            'Come to a complete stop',
            'Slow down and give right-of-way if necessary',
            'Maintain your current speed',
            'Increase your speed to merge',
          ],
          correctOptionIndex: 1,
          explanation:
              'A yield sign means you must slow down and yield the right-of-way to traffic on the through road.',
          imageAsset: 'assets/images/questions/yield_sign.png',
        ),
        QuestionModel(
          id: 'q3',
          quizId: event.quizId,
          text: 'What does a "Do Not Enter" sign indicate?',
          options: [
            'No parking allowed',
            'Road closed for construction',
            'Do not enter the roadway from this direction',
            'No left turn allowed',
          ],
          correctOptionIndex: 2,
          explanation:
              'A "Do Not Enter" sign prohibits entry into a roadway or area from the direction you are traveling.',
          imageAsset: 'assets/images/questions/do_not_enter.png',
        ),
        QuestionModel(
          id: 'q4',
          quizId: event.quizId,
          text: 'What does a speed limit sign of 50 mean?',
          options: [
            'Minimum speed is 50 km/h',
            'Maximum speed is 50 km/h when conditions are favorable',
            'Recommended speed is 50 km/h',
            'Average speed is 50 km/h',
          ],
          correctOptionIndex: 1,
          explanation:
              'A speed limit sign indicates the maximum legal speed when conditions are favorable.',
          imageAsset: 'assets/images/questions/speed_limit.png',
        ),
        QuestionModel(
          id: 'q5',
          quizId: event.quizId,
          text: 'What does a "No Stopping" sign mean?',
          options: [
            'You can stop temporarily to load or unload passengers',
            'You cannot park but can stop briefly',
            'You cannot stop your vehicle for any reason except to avoid a collision',
            'You can stop only during certain hours',
          ],
          correctOptionIndex: 2,
          explanation:
              'A "No Stopping" sign means you cannot stop your vehicle for any reason, except when necessary to avoid a collision or to comply with another traffic regulation.',
          imageAsset: 'assets/images/questions/no_stopping.png',
        ),
      ];

      emit(QuizLoaded(quiz: quiz, questions: questions));
    } catch (e) {
      emit(QuizError(message: e.toString()));
    }
  }

  void _onAnswerQuestion(AnswerQuestion event, Emitter<QuizState> emit) {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;

      // Update user answers
      final updatedAnswers = Map<String, int>.from(currentState.userAnswers);
      updatedAnswers[event.questionId] = event.selectedOptionIndex;

      // Move to next question if not the last one
      int nextQuestionIndex = currentState.currentQuestionIndex;
      if (!currentState.isLastQuestion) {
        nextQuestionIndex++;
      }

      emit(
        QuizLoaded(
          quiz: currentState.quiz,
          questions: currentState.questions,
          currentQuestionIndex: nextQuestionIndex,
          userAnswers: updatedAnswers,
          isCompleted: false,
        ),
      );
    }
  }

  Future<void> _onSubmitQuiz(SubmitQuiz event, Emitter<QuizState> emit) async {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;

      // Mark quiz as completed
      emit(
        QuizLoaded(
          quiz: currentState.quiz,
          questions: currentState.questions,
          currentQuestionIndex: currentState.currentQuestionIndex,
          userAnswers: currentState.userAnswers,
          isCompleted: true,
        ),
      );

      try {
        // In a real app, save quiz results to repository
        // await progressRepository.saveQuizResult(
        //   currentState.quiz.id,
        //   currentState.score,
        //   currentState.correctAnswersCount,
        //   currentState.userAnswers,
        // );

        // Mock implementation for now
        await Future.delayed(const Duration(seconds: 1));

        emit(
          QuizCompleted(
            quiz: currentState.quiz,
            questions: currentState.questions,
            userAnswers: currentState.userAnswers,
            correctAnswersCount: currentState.correctAnswersCount,
            score: currentState.score,
            isPassed: currentState.isPassed,
            earnedXp: currentState.earnedXp,
          ),
        );
      } catch (e) {
        emit(QuizError(message: e.toString()));
      }
    }
  }
}
