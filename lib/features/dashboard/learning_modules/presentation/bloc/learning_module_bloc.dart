import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/base_bloc.dart';
import '../../../../user_profile/data/models/topic_model.dart';
import '../../data/models/learning_module_model.dart';

// Learning Module Events
abstract class LearningModuleEvent extends BaseEvent {}

class LoadModules extends LearningModuleEvent {
  final String provinceId;

  LoadModules({required this.provinceId});

  @override
  List<Object> get props => [provinceId];
}

class LoadModuleDetails extends LearningModuleEvent {
  final String moduleId;

  LoadModuleDetails({required this.moduleId});

  @override
  List<Object> get props => [moduleId];
}

class LoadTopicContent extends LearningModuleEvent {
  final String topicId;

  LoadTopicContent({required this.topicId});

  @override
  List<Object> get props => [topicId];
}

class CompleteModule extends LearningModuleEvent {
  final String moduleId;
  final int score;

  CompleteModule({required this.moduleId, required this.score});

  @override
  List<Object> get props => [moduleId, score];
}

class CompleteTopic extends LearningModuleEvent {
  final String topicId;

  CompleteTopic({required this.topicId});

  @override
  List<Object> get props => [topicId];
}

// Learning Module States
abstract class LearningModuleState extends BaseState {}

class LearningModuleInitial extends LearningModuleState {}

class LearningModuleLoading extends LearningModuleState {}

class ModulesLoaded extends LearningModuleState {
  final List<LearningModuleModel> modules;

  ModulesLoaded({required this.modules});

  @override
  List<Object> get props => [modules];
}

class ModuleDetailsLoaded extends LearningModuleState {
  final LearningModuleModel module;
  final List<TopicModel> topics;

  ModuleDetailsLoaded({required this.module, required this.topics});

  @override
  List<Object> get props => [module, topics];
}

class TopicContentLoaded extends LearningModuleState {
  final TopicModel topic;

  TopicContentLoaded({required this.topic});

  @override
  List<Object> get props => [topic];
}

class ModuleCompleted extends LearningModuleState {
  final LearningModuleModel module;
  final int earnedXp;

  ModuleCompleted({required this.module, required this.earnedXp});

  @override
  List<Object> get props => [module, earnedXp];
}

class TopicCompleted extends LearningModuleState {
  final TopicModel topic;
  final int earnedXp;

  TopicCompleted({required this.topic, required this.earnedXp});

  @override
  List<Object> get props => [topic, earnedXp];
}

class LearningModuleError extends LearningModuleState {
  final String message;

  LearningModuleError({required this.message});

  @override
  List<Object> get props => [message];
}

// Learning Module BLoC
class LearningModuleBloc
    extends BaseBloc<LearningModuleEvent, LearningModuleState> {
  // In a real app, these would be injected
  // final LearningModuleRepository moduleRepository;
  // final UserProgressRepository progressRepository;

  LearningModuleBloc() : super(LearningModuleInitial()) {
    on<LoadModules>(_onLoadModules);
    on<LoadModuleDetails>(_onLoadModuleDetails);
    on<LoadTopicContent>(_onLoadTopicContent);
    on<CompleteModule>(_onCompleteModule);
    on<CompleteTopic>(_onCompleteTopic);
  }

  Future<void> _onLoadModules(
    LoadModules event,
    Emitter<LearningModuleState> emit,
  ) async {
    emit(LearningModuleLoading());
    try {
      // In a real app, fetch modules from repository
      // final modules = await moduleRepository.getModulesByProvince(event.provinceId);

      // Mock implementation for now
      await Future.delayed(const Duration(seconds: 1));

      // Create some mock modules
      final modules = [
        LearningModuleModel(
          id: 'module1',
          title: 'Road Signs and Signals',
          description:
              'Learn about common road signs and traffic signals in Canada.',
          provinceId: event.provinceId,
          difficulty: 1,
          iconAsset: 'assets/images/icons/road_signs.png',
          xpReward: 100,
          estimatedMinutes: 30,
          topicIds: ['topic1', 'topic2', 'topic3'],
        ),
        LearningModuleModel(
          id: 'module2',
          title: 'Rules of the Road',
          description:
              'Understand the basic rules and regulations for driving in Canada.',
          provinceId: event.provinceId,
          difficulty: 2,
          iconAsset: 'assets/images/icons/rules.png',
          xpReward: 150,
          estimatedMinutes: 45,
          topicIds: ['topic4', 'topic5', 'topic6'],
        ),
        LearningModuleModel(
          id: 'module3',
          title: 'Safe Driving Practices',
          description: 'Learn techniques for safe and defensive driving.',
          provinceId: event.provinceId,
          difficulty: 2,
          iconAsset: 'assets/images/icons/safe_driving.png',
          xpReward: 150,
          estimatedMinutes: 40,
          topicIds: ['topic7', 'topic8', 'topic9'],
        ),
        LearningModuleModel(
          id: 'module4',
          title: 'Parking and Stopping',
          description:
              'Understand the rules for parking and stopping your vehicle.',
          provinceId: event.provinceId,
          difficulty: 1,
          iconAsset: 'assets/images/icons/parking.png',
          xpReward: 100,
          estimatedMinutes: 25,
          topicIds: ['topic10', 'topic11'],
        ),
        LearningModuleModel(
          id: 'module5',
          title: 'Advanced Driving Skills',
          description:
              'Master advanced techniques for challenging driving conditions.',
          provinceId: event.provinceId,
          difficulty: 3,
          iconAsset: 'assets/images/icons/advanced.png',
          xpReward: 200,
          isLocked: true,
          unlockCriteria: 'Complete all basic modules first',
          estimatedMinutes: 60,
          topicIds: ['topic12', 'topic13', 'topic14', 'topic15'],
        ),
      ];

      emit(ModulesLoaded(modules: modules));
    } catch (e) {
      emit(LearningModuleError(message: e.toString()));
    }
  }

  Future<void> _onLoadModuleDetails(
    LoadModuleDetails event,
    Emitter<LearningModuleState> emit,
  ) async {
    emit(LearningModuleLoading());
    try {
      // In a real app, fetch module details and topics from repository
      // final module = await moduleRepository.getModuleById(event.moduleId);
      // final topics = await moduleRepository.getTopicsByModuleId(event.moduleId);

      // Mock implementation for now
      await Future.delayed(const Duration(seconds: 1));

      // Create a mock module and topics
      final module = LearningModuleModel(
        id: event.moduleId,
        title: 'Road Signs and Signals',
        description:
            'Learn about common road signs and traffic signals in Canada.',
        provinceId: 'on',
        difficulty: 1,
        iconAsset: 'assets/images/icons/road_signs.png',
        xpReward: 100,
        estimatedMinutes: 30,
        topicIds: ['topic1', 'topic2', 'topic3'],
      );

      final topics = [
        TopicModel(
          id: 'topic1',
          moduleId: event.moduleId,
          title: 'Regulatory Signs',
          content:
              'Regulatory signs indicate a traffic regulation that applies at a specific place or time. They must be obeyed.',
          imageAsset: 'assets/images/topics/regulatory_signs.png',
          estimatedMinutes: 10,
          xpReward: 30,
          quizIds: ['quiz1'],
        ),
        TopicModel(
          id: 'topic2',
          moduleId: event.moduleId,
          title: 'Warning Signs',
          content:
              'Warning signs alert drivers to potential hazards ahead. They are usually yellow with black symbols or text.',
          imageAsset: 'assets/images/topics/warning_signs.png',
          estimatedMinutes: 10,
          xpReward: 30,
          quizIds: ['quiz2'],
        ),
        TopicModel(
          id: 'topic3',
          moduleId: event.moduleId,
          title: 'Traffic Signals',
          content:
              'Traffic signals control the flow of traffic at intersections. Understanding them is essential for safe driving.',
          imageAsset: 'assets/images/topics/traffic_signals.png',
          estimatedMinutes: 10,
          xpReward: 40,
          quizIds: ['quiz3'],
        ),
      ];

      emit(ModuleDetailsLoaded(module: module, topics: topics));
    } catch (e) {
      emit(LearningModuleError(message: e.toString()));
    }
  }

  Future<void> _onLoadTopicContent(
    LoadTopicContent event,
    Emitter<LearningModuleState> emit,
  ) async {
    emit(LearningModuleLoading());
    try {
      // In a real app, fetch topic content from repository
      // final topic = await moduleRepository.getTopicById(event.topicId);

      // Mock implementation for now
      await Future.delayed(const Duration(seconds: 1));

      // Create a mock topic with detailed content
      final topic = TopicModel(
        id: event.topicId,
        moduleId: 'module1',
        title: 'Regulatory Signs',
        content: '''
# Regulatory Signs

Regulatory signs indicate a traffic regulation that applies at a specific place or time. They must be obeyed.

## Stop Signs

The stop sign is octagonal with a red background and white border. When you come to a stop sign, you must bring your vehicle to a complete stop at the stop line, if there is one, or before entering the intersection. You must yield the right-of-way to any vehicles or pedestrians in or approaching the intersection.

## Yield Signs

The yield sign is triangular with a red border and white interior. When you see a yield sign, you must slow down and yield the right-of-way to traffic on the through road. If necessary, stop before entering the intersection.

## Speed Limit Signs

Speed limit signs indicate the maximum legal speed when conditions are favorable. The speed shown is the maximum speed permitted, not the recommended speed. You must adjust your speed according to road, weather, and traffic conditions.

## No Parking and No Stopping Signs

These signs indicate areas where parking or stopping is prohibited. No parking signs mean you can stop temporarily to load or unload passengers, but you cannot leave your vehicle unattended. No stopping signs mean you cannot stop your vehicle for any reason, except when necessary to avoid a collision or to comply with another traffic regulation.

## One-Way and Do Not Enter Signs

One-way signs indicate streets or roadways on which traffic is allowed to travel in only one direction. Do not enter signs prohibit entry into a roadway or area from the direction you are traveling.

Remember, regulatory signs are not suggestions—they are legal requirements that must be followed at all times.
''',
        imageAsset: 'assets/images/topics/regulatory_signs.png',
        estimatedMinutes: 10,
        xpReward: 30,
        quizIds: ['quiz1'],
      );

      emit(TopicContentLoaded(topic: topic));
    } catch (e) {
      emit(LearningModuleError(message: e.toString()));
    }
  }

  Future<void> _onCompleteModule(
    CompleteModule event,
    Emitter<LearningModuleState> emit,
  ) async {
    try {
      // In a real app, mark module as completed in repository
      // await progressRepository.completeModule(event.moduleId, event.score);
      // final module = await moduleRepository.getModuleById(event.moduleId);

      // Mock implementation for now
      await Future.delayed(const Duration(seconds: 1));

      // Create a mock module
      final module = LearningModuleModel(
        id: event.moduleId,
        title: 'Road Signs and Signals',
        description:
            'Learn about common road signs and traffic signals in Canada.',
        provinceId: 'on',
        difficulty: 1,
        iconAsset: 'assets/images/icons/road_signs.png',
        xpReward: 100,
        estimatedMinutes: 30,
        topicIds: ['topic1', 'topic2', 'topic3'],
      );

      // Calculate earned XP based on score
      final earnedXp = (module.xpReward * (event.score / 100)).round();

      emit(ModuleCompleted(module: module, earnedXp: earnedXp));
    } catch (e) {
      emit(LearningModuleError(message: e.toString()));
    }
  }

  Future<void> _onCompleteTopic(
    CompleteTopic event,
    Emitter<LearningModuleState> emit,
  ) async {
    try {
      // In a real app, mark topic as completed in repository
      // await progressRepository.completeTopic(event.topicId);
      // final topic = await moduleRepository.getTopicById(event.topicId);

      // Mock implementation for now
      await Future.delayed(const Duration(seconds: 1));

      // Create a mock topic
      final topic = TopicModel(
        id: event.topicId,
        moduleId: 'module1',
        title: 'Regulatory Signs',
        content:
            'Regulatory signs indicate a traffic regulation that applies at a specific place or time. They must be obeyed.',
        imageAsset: 'assets/images/topics/regulatory_signs.png',
        estimatedMinutes: 10,
        xpReward: 30,
        quizIds: ['quiz1'],
      );

      emit(TopicCompleted(topic: topic, earnedXp: topic.xpReward));
    } catch (e) {
      emit(LearningModuleError(message: e.toString()));
    }
  }
}
