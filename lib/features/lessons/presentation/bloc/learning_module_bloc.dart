import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/base_bloc.dart';

// Events
abstract class LearningModuleEvent extends BaseEvent {
  const LearningModuleEvent();
}

class LoadModules extends LearningModuleEvent {
  const LoadModules();
}

class LoadModuleDetails extends LearningModuleEvent {
  final String moduleId;

  const LoadModuleDetails({required this.moduleId});

  @override
  List<Object> get props => [moduleId];
}

class CompleteLesson extends LearningModuleEvent {
  final String lessonId;

  const CompleteLesson({required this.lessonId});

  @override
  List<Object> get props => [lessonId];
}

// States
abstract class LearningModuleState extends BaseState {
  const LearningModuleState();
}

class LearningModuleInitial extends LearningModuleState {
  const LearningModuleInitial();
}

class LearningModuleLoading extends LearningModuleState {
  const LearningModuleLoading();
}

class LearningModulesLoaded extends LearningModuleState {
  final List<Map<String, dynamic>> modules;

  const LearningModulesLoaded({required this.modules});

  @override
  List<Object> get props => [modules];
}

class LearningModuleDetailLoaded extends LearningModuleState {
  final Map<String, dynamic> moduleDetails;
  final List<Map<String, dynamic>> lessons;

  const LearningModuleDetailLoaded({
    required this.moduleDetails,
    required this.lessons,
  });

  @override
  List<Object> get props => [moduleDetails, lessons];
}

class LearningModuleError extends LearningModuleState {
  final String message;

  const LearningModuleError({required this.message});

  @override
  List<Object> get props => [message];
}

// BLoC
class LearningModuleBloc
    extends BaseBloc<LearningModuleEvent, LearningModuleState> {
  // Mock data
  final List<Map<String, dynamic>> _mockModules = [
    {
      'id': 'module1',
      'title': 'Road Signs Basics',
      'description':
          'Learn the fundamental road signs that every driver should know.',
      'imageUrl': 'assets/images/road_signs_basics.png',
      'lessonsCount': 5,
      'estimatedHours': 2,
      'progress': 0.0,
    },
    {
      'id': 'module2',
      'title': 'Regulatory Signs',
      'description':
          'Master regulatory signs that control traffic and enforce road laws.',
      'imageUrl': 'assets/images/regulatory_signs.png',
      'lessonsCount': 8,
      'estimatedHours': 3,
      'progress': 0.0,
    },
    {
      'id': 'module3',
      'title': 'Warning Signs',
      'description':
          'Learn about warning signs that alert drivers to potential hazards.',
      'imageUrl': 'assets/images/warning_signs.png',
      'lessonsCount': 6,
      'estimatedHours': 2.5,
      'progress': 0.0,
    },
    {
      'id': 'module4',
      'title': 'Guide Signs',
      'description':
          'Understand guide signs that provide directional and navigational information.',
      'imageUrl': 'assets/images/guide_signs.png',
      'lessonsCount': 4,
      'estimatedHours': 1.5,
      'progress': 0.0,
    },
  ];

  // Mock lesson data
  final Map<String, List<Map<String, dynamic>>> _mockModuleLessons = {
    'module1': [
      {
        'id': 'lesson1_1',
        'title': 'Introduction to Road Signs',
        'description':
            'Learn about the importance and categories of road signs.',
        'duration': 20,
        'isCompleted': false,
      },
      {
        'id': 'lesson1_2',
        'title': 'Colors and Shapes',
        'description':
            'Understand how colors and shapes convey different meanings in road signs.',
        'duration': 25,
        'isCompleted': false,
      },
      {
        'id': 'lesson1_3',
        'title': 'Regulatory Signs Overview',
        'description':
            'Get introduced to signs that regulate traffic flow and enforce laws.',
        'duration': 30,
        'isCompleted': false,
      },
      {
        'id': 'lesson1_4',
        'title': 'Warning Signs Overview',
        'description':
            'Learn about signs that warn drivers of potential hazards ahead.',
        'duration': 25,
        'isCompleted': false,
      },
      {
        'id': 'lesson1_5',
        'title': 'Guide Signs Overview',
        'description':
            'Understand signs that provide directional and navigational information.',
        'duration': 20,
        'isCompleted': false,
      },
    ],
    // Other modules' lessons would be added here
  };

  LearningModuleBloc() : super(const LearningModuleInitial()) {
    on<LoadModules>(_onLoadModules);
    on<LoadModuleDetails>(_onLoadModuleDetails);
    on<CompleteLesson>(_onCompleteLesson);
  }

  void _onLoadModules(
    LoadModules event,
    Emitter<LearningModuleState> emit,
  ) async {
    emit(const LearningModuleLoading());
    try {
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 800));
      emit(LearningModulesLoaded(modules: _mockModules));
    } catch (e) {
      emit(LearningModuleError(message: e.toString()));
    }
  }

  void _onLoadModuleDetails(
    LoadModuleDetails event,
    Emitter<LearningModuleState> emit,
  ) async {
    emit(const LearningModuleLoading());
    try {
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 500));

      final moduleId = event.moduleId;
      final moduleDetails = _mockModules.firstWhere(
        (module) => module['id'] == moduleId,
        orElse: () => throw Exception('Module not found'),
      );

      final lessons = _mockModuleLessons[moduleId] ?? [];

      emit(
        LearningModuleDetailLoaded(
          moduleDetails: moduleDetails,
          lessons: lessons,
        ),
      );
    } catch (e) {
      emit(LearningModuleError(message: e.toString()));
    }
  }

  void _onCompleteLesson(
    CompleteLesson event,
    Emitter<LearningModuleState> emit,
  ) {
    final currentState = state;
    if (currentState is LearningModuleDetailLoaded) {
      final updatedLessons = currentState.lessons.map((lesson) {
        if (lesson['id'] == event.lessonId) {
          return {...lesson, 'isCompleted': true};
        }
        return lesson;
      }).toList();

      // Calculate new progress
      final completedCount = updatedLessons
          .where((l) => l['isCompleted'] == true)
          .length;
      final progress = completedCount / updatedLessons.length;

      // Update module details with new progress
      final updatedModuleDetails = {
        ...currentState.moduleDetails,
        'progress': progress,
      };

      emit(
        LearningModuleDetailLoaded(
          moduleDetails: updatedModuleDetails,
          lessons: updatedLessons,
        ),
      );
    }
  }
}
