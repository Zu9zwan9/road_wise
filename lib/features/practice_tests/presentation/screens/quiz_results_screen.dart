import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_widgets.dart';
import '../bloc/quiz_bloc.dart';

class QuizResultsScreen extends StatelessWidget {
  final String quizId;
  final double score;
  final int correctAnswers;
  final int totalQuestions;
  final bool isPassed;
  final int earnedXp;

  const QuizResultsScreen({
    super.key,
    required this.quizId,
    required this.score,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.isPassed,
    required this.earnedXp,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              backgroundColor: isPassed
                  ? AppColors.successGreen
                  : AppColors.errorRed,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  isPassed ? 'Quiz Passed!' : 'Quiz Failed',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            isPassed
                                ? AppColors.successGreen
                                : AppColors.errorRed,
                            isPassed
                                ? AppColors.successGreen.withGreen(
                                    (AppColors.successGreen.green - 30).clamp(
                                      0,
                                      255,
                                    ),
                                  )
                                : AppColors.errorRed.withRed(
                                    (AppColors.errorRed.red - 30).clamp(0, 255),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isPassed ? Icons.check_circle : Icons.cancel,
                            color: Colors.white,
                            size: 64,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Score Summary
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(24),
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
                    // Score percentage
                    Text(
                      '${score.toInt()}%',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: isPassed
                            ? AppColors.successGreen
                            : AppColors.errorRed,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isPassed
                          ? 'Congratulations! You passed the quiz.'
                          : 'You didn\'t pass this time. Keep practicing!',
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.darkGray,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Score details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildScoreDetail(
                          icon: Icons.check,
                          value: correctAnswers.toString(),
                          label: 'Correct',
                          color: AppColors.successGreen,
                        ),
                        _buildScoreDetail(
                          icon: Icons.close,
                          value: (totalQuestions - correctAnswers).toString(),
                          label: 'Incorrect',
                          color: AppColors.errorRed,
                        ),
                        _buildScoreDetail(
                          icon: Icons.star,
                          value: '+$earnedXp',
                          label: 'XP Earned',
                          color: AppColors.mapleRed,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Performance Analysis
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(24),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Performance Analysis',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildPerformanceItem(
                      title: 'Accuracy',
                      percentage: (correctAnswers / totalQuestions) * 100,
                      color: _getPerformanceColor(
                        (correctAnswers / totalQuestions) * 100,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // In a real app, we would show more detailed performance metrics
                    // For now, just show a placeholder
                    const Text(
                      'Areas to Focus On:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildFocusAreaItem(
                      title: 'Road Signs',
                      description: 'Review regulatory and warning signs',
                    ),
                    _buildFocusAreaItem(
                      title: 'Right of Way',
                      description: 'Practice scenarios involving intersections',
                    ),
                  ],
                ),
              ),
            ),

            // Action Buttons
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    AppWidgets.primaryButton(
                      text: isPassed ? 'Continue Learning' : 'Try Again',
                      onPressed: () {
                        if (isPassed) {
                          // Navigate back to learning modules
                          Navigator.of(
                            context,
                          ).popUntil((route) => route.isFirst);
                        } else {
                          // Restart the quiz
                          Navigator.of(context).pop();
                          BlocProvider.of<QuizBloc>(
                            context,
                          ).add(LoadQuiz(quizId: quizId));
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    AppWidgets.secondaryButton(
                      text: 'Review Answers',
                      onPressed: () {
                        // In a real app, navigate to a review screen
                        // For now, just go back to the dashboard
                        Navigator.of(
                          context,
                        ).popUntil((route) => route.isFirst);
                      },
                    ),
                    const SizedBox(height: 16),
                    AppWidgets.textButton(
                      text: 'Share Results',
                      onPressed: () {
                        // Show share options
                        _showShareOptions(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreDetail({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: AppColors.darkGray),
        ),
      ],
    );
  }

  Widget _buildPerformanceItem({
    required String title,
    required double percentage,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              '${percentage.toInt()}%',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: AppColors.lightGray,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
          ),
        ),
      ],
    );
  }

  Widget _buildFocusAreaItem({
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.arrow_right,
            color: AppColors.canadianBlue,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.darkGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getPerformanceColor(double percentage) {
    if (percentage >= 80) {
      return AppColors.successGreen;
    } else if (percentage >= 60) {
      return AppColors.warningYellow;
    } else {
      return AppColors.errorRed;
    }
  }

  void _showShareOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Share Your Results',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildShareOption(
                  context,
                  icon: Icons.facebook,
                  label: 'Facebook',
                  color: const Color(0xFF1877F2),
                  onTap: () {
                    Navigator.of(context).pop();
                    // In a real app, share to Facebook
                    AppWidgets.showToast(
                      context: context,
                      message: 'Sharing to Facebook...',
                      icon: Icons.share,
                    );
                  },
                ),
                _buildShareOption(
                  context,
                  icon: Icons.chat_bubble,
                  label: 'Twitter',
                  color: const Color(0xFF1DA1F2),
                  onTap: () {
                    Navigator.of(context).pop();
                    // In a real app, share to Twitter
                    AppWidgets.showToast(
                      context: context,
                      message: 'Sharing to Twitter...',
                      icon: Icons.share,
                    );
                  },
                ),
                _buildShareOption(
                  context,
                  icon: Icons.link,
                  label: 'Copy Link',
                  color: AppColors.darkGray,
                  onTap: () {
                    Navigator.of(context).pop();
                    // In a real app, copy link to clipboard
                    AppWidgets.showToast(
                      context: context,
                      message: 'Link copied to clipboard',
                      icon: Icons.copy,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShareOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 30),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
