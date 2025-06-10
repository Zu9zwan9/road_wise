import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../user_profile/presentation/bloc/user_progress_bloc.dart';
import '../../gamification/data/models/badge_model.dart';
import '../../gamification/utils/gamification_manager.dart';
import '../../learning_modules/presentation/bloc/learning_module_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GamificationManager _gamificationManager = GamificationManager();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Load user progress
    final userId = 'current_user_id'; // In a real app, get this from auth state
    BlocProvider.of<UserProgressBloc>(
      context,
    ).add(LoadUserProgress(userId: userId));

    // Load modules for the selected province
    final provinceId = 'on'; // In a real app, get this from auth state
    BlocProvider.of<LearningModuleBloc>(
      context,
    ).add(LoadModules(provinceId: provinceId));

    // Update streak when user opens the app
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _gamificationManager.updateStreak(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            _buildHomeTab(),
            _buildLearnTab(),
            _buildPracticeTab(),
            _buildProgressTab(),
            _buildProfileTab(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.mapleRed,
        unselectedItemColor: AppColors.darkGray,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Learn'),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Practice'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildHomeTab() {
    return BlocListener<UserProgressBloc, UserProgressState>(
      listener: (context, state) {
        if (state is StreakUpdated) {
          if (state.streakMaintained && state.progress.currentStreak > 1) {
            // Show streak milestone for specific milestones
            final streak = state.progress.currentStreak;
            if (streak == 5 ||
                streak == 7 ||
                streak == 14 ||
                streak == 30 ||
                streak == 60 ||
                streak == 100) {
              _gamificationManager.showStreakMilestone(context, streak);
            }
          }

          if (state.newStreakRecord) {
            AppWidgets.showToast(
              context: context,
              message:
                  'New streak record: ${state.progress.longestStreak} days!',
              icon: Icons.emoji_events,
            );
          }
        } else if (state is XpAdded) {
          if (state.leveledUp) {
            _gamificationManager.showLevelUp(context, state.newLevel);
          }
        } else if (state is BadgeUnlocked) {
          _gamificationManager.showBadgeEarned(context, state.badge);
        }
      },
      child: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            backgroundColor: AppColors.canadianBlue,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                AppConstants.appName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/dashboard_header.jpg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColors.canadianBlue.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // Show notifications
                },
              ),
            ],
          ),

          // User Progress Summary
          SliverToBoxAdapter(
            child: BlocBuilder<UserProgressBloc, UserProgressState>(
              builder: (context, state) {
                if (state is UserProgressLoaded) {
                  return _buildProgressSummary(state);
                } else {
                  return const SizedBox(
                    height: 120,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          ),

          // Continue Learning Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Continue Learning',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<LearningModuleBloc, LearningModuleState>(
                    builder: (context, state) {
                      if (state is ModulesLoaded) {
                        return _buildContinueLearningSection(state.modules);
                      } else if (state is LearningModuleLoading) {
                        return const SizedBox(
                          height: 200,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else {
                        return const SizedBox(
                          height: 200,
                          child: Center(child: Text('No modules available')),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),

          // Daily Challenge
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _buildDailyChallenge(),
            ),
          ),

          // Recent Achievements
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recent Achievements',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<UserProgressBloc, UserProgressState>(
                    builder: (context, state) {
                      if (state is UserProgressLoaded) {
                        return _buildRecentAchievements(state);
                      } else {
                        return const SizedBox(
                          height: 120,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSummary(UserProgressLoaded state) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Level and XP
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Level ${state.progress.level}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: state.progress.levelProgress(),
                        backgroundColor: AppColors.lightGray,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.mapleRed,
                        ),
                        minHeight: 8,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${state.progress.totalXp} XP',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.darkGray,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Streak
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    AppWidgets.streakCounter(
                      days: state.progress.currentStreak,
                      size: 60,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Current Streak',
                      style: TextStyle(fontSize: 12, color: AppColors.darkGray),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(
                icon: Icons.menu_book,
                value: state.progress.completedModules.length.toString(),
                label: 'Modules',
              ),
              _buildStatItem(
                icon: Icons.quiz,
                value: state.progress.completedTests.length.toString(),
                label: 'Quizzes',
              ),
              _buildStatItem(
                icon: Icons.emoji_events,
                value: state.progress.earnedBadges.length.toString(),
                label: 'Badges',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.skyBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, color: AppColors.skyBlue, size: 20),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: AppColors.darkGray),
        ),
      ],
    );
  }

  Widget _buildContinueLearningSection(List<dynamic> modules) {
    // In a real app, we would show modules that the user has started but not completed
    // For now, just show the first module
    if (modules.isEmpty) {
      return const Center(child: Text('No modules available'));
    }

    final module = modules.first;

    return AppWidgets.moduleCard(
      title: module.title,
      description: module.description,
      progress:
          0.3, // In a real app, this would be calculated from user progress
      onTap: () {
        BlocProvider.of<LearningModuleBloc>(
          context,
        ).add(LoadModuleDetails(moduleId: module.id));
        // Navigate to module details screen
      },
      iconPath: module.iconAsset,
      categoryColor: AppColors.skyBlue,
      isLocked: module.isLocked,
    );
  }

  Widget _buildDailyChallenge() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.mapleRed, Color(0xFFFF6B6B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.mapleRed.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.flash_on,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Daily Challenge',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.mapleRed, size: 16),
                    const SizedBox(width: 4),
                    const Text(
                      '+20 XP',
                      style: TextStyle(
                        color: AppColors.mapleRed,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Complete a 5-question quiz on road signs without making any mistakes',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 16),
          AppWidgets.primaryButton(
            text: 'Start Challenge',
            onPressed: () {
              // Navigate to daily challenge
            },
            isFullWidth: false,
          ),
        ],
      ),
    );
  }

  Widget _buildRecentAchievements(UserProgressLoaded state) {
    if (state.earnedBadges.isEmpty) {
      return AppWidgets.emptyState(
        title: 'No Achievements Yet',
        message:
            'Complete modules and quizzes to earn badges and achievements.',
        imagePath: 'assets/images/empty_achievements.png',
      );
    }

    // Show the first 3 badges
    final badges = state.earnedBadges.take(3).toList();

    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: badges.length,
        itemBuilder: (context, index) {
          final badge = badges[index];
          return Container(
            width: 200,
            margin: const EdgeInsets.only(right: 16),
            child: AppWidgets.achievementCard(
              title: badge.title,
              description: badge.description,
              badgeAsset: badge.iconAsset,
              gradientStart: _getBadgeTierColor(badge.tier).withOpacity(0.7),
              gradientEnd: _getBadgeTierColor(badge.tier),
            ),
          );
        },
      ),
    );
  }

  Color _getBadgeTierColor(BadgeTier tier) {
    switch (tier) {
      case BadgeTier.bronze:
        return AppColors.bronze;
      case BadgeTier.silver:
        return AppColors.silver;
      case BadgeTier.gold:
        return AppColors.gold;
      case BadgeTier.platinum:
        return AppColors.platinum;
    }
  }

  // Placeholder methods for other tabs
  Widget _buildLearnTab() {
    return const Center(child: Text('Learn Tab'));
  }

  Widget _buildPracticeTab() {
    return const Center(child: Text('Practice Tab'));
  }

  Widget _buildProgressTab() {
    return const Center(child: Text('Progress Tab'));
  }

  Widget _buildProfileTab() {
    return const Center(child: Text('Profile Tab'));
  }
}
