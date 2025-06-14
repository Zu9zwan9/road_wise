import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/base_bloc.dart';

// Events
abstract class QuizEvent extends BaseEvent {
  const QuizEvent();
}

class LoadQuiz extends QuizEvent {
  final String quizId;

  const LoadQuiz({required this.quizId});

  List<Object> get props => [quizId];
}

class AnswerQuestion extends QuizEvent {
  final String questionId;
  final String answer;

  const AnswerQuestion({required this.questionId, required this.answer});

  @override
  List<Object> get props => [questionId, answer];
}

class SubmitQuiz extends QuizEvent {
  const SubmitQuiz();
}

// States
abstract class QuizState extends BaseState {
  const QuizState();
}

class QuizInitial extends QuizState {
  const QuizInitial();
}

class QuizLoading extends QuizState {
  const QuizLoading();
}

class QuizLoaded extends QuizState {
  final String quizId;
  final List<Map<String, dynamic>> questions;
  final int currentQuestionIndex;
  final Map<String, String> answers;

  const QuizLoaded({
    required this.quizId,
    required this.questions,
    this.currentQuestionIndex = 0,
    this.answers = const {},
  });

  List<Object> get props => [quizId, questions, currentQuestionIndex, answers];

  QuizLoaded copyWith({
    String? quizId,
    List<Map<String, dynamic>>? questions,
    int? currentQuestionIndex,
    Map<String, String>? answers,
  }) {
    return QuizLoaded(
      quizId: quizId ?? this.quizId,
      questions: questions ?? this.questions,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      answers: answers ?? this.answers,
    );
  }
}

class QuizError extends QuizState {
  final String message;

  const QuizError({required this.message});

  @override
  List<Object> get props => [message];
}

class QuizSubmitted extends QuizState {
  final String quizId;
  final int score;
  final int totalQuestions;
  final Map<String, String> answers;

  const QuizSubmitted({
    required this.quizId,
    required this.score,
    required this.totalQuestions,
    required this.answers,
  });

  @override
  List<Object> get props => [quizId, score, totalQuestions, answers];
}

// BLoC
class QuizBloc extends BaseBloc<QuizEvent, QuizState> {
  // Mock quiz data
  final Map<String, List<Map<String, dynamic>>> _mockQuizzes = {
    'quiz1': [
      {
        'id': 'q1',
        'question': 'What does a red octagonal sign indicate?',
        'options': [
          'Yield to traffic',
          'Stop completely',
          'Slow down',
          'No entry',
        ],
        'correctAnswer': 'Stop completely',
      },
      {
        'id': 'q2',
        'question': 'What does a yellow diamond-shaped sign indicate?',
        'options': [
          'School zone ahead',
          'Construction zone',
          'Warning or caution',
          'Temporary detour',
        ],
        'correctAnswer': 'Warning or caution',
      },
      // More questions would be added here
    ],
  };

  QuizBloc() : super(const QuizInitial()) {
    on<LoadQuiz>(_onLoadQuiz);
    on<AnswerQuestion>(_onAnswerQuestion);
    on<SubmitQuiz>(_onSubmitQuiz);
  }

  void _onLoadQuiz(LoadQuiz event, Emitter<QuizState> emit) async {
    emit(const QuizLoading());
    try {
      // In a real app, you would fetch quiz data from a repository
      await Future.delayed(const Duration(milliseconds: 500));

      final quizId = event.quizId;
      final questions = _mockQuizzes[quizId] ?? [];

      if (questions.isEmpty) {
        emit(const QuizError(message: 'Quiz not found'));
        return;
      }

      emit(QuizLoaded(quizId: quizId, questions: questions));
    } catch (e) {
      emit(QuizError(message: e.toString()));
    }
  }

  void _onAnswerQuestion(AnswerQuestion event, Emitter<QuizState> emit) {
    final currentState = state;
    if (currentState is QuizLoaded) {
      // Add or update the answer
      final updatedAnswers = Map<String, String>.from(currentState.answers);
      updatedAnswers[event.questionId] = event.answer;

      // Move to the next question if not at the end
      int nextQuestionIndex = currentState.currentQuestionIndex;
      if (nextQuestionIndex < currentState.questions.length - 1) {
        nextQuestionIndex++;
      }

      emit(
        currentState.copyWith(
          answers: updatedAnswers,
          currentQuestionIndex: nextQuestionIndex,
        ),
      );
    }
  }

  void _onSubmitQuiz(SubmitQuiz event, Emitter<QuizState> emit) {
    final currentState = state;
    if (currentState is QuizLoaded) {
      int score = 0;

      // Calculate score
      for (final question in currentState.questions) {
        final questionId = question['id'] as String;
        final userAnswer = currentState.answers[questionId];
        final correctAnswer = question['correctAnswer'] as String;

        if (userAnswer == correctAnswer) {
          score++;
        }
      }

      emit(
        QuizSubmitted(
          quizId: currentState.quizId,
          score: score,
          totalQuestions: currentState.questions.length,
          answers: currentState.answers,
        ),
      );
    }
  }
}
