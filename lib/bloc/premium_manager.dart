import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_wise/bloc/premium_bloc.dart';

import '../features/core/theme/app_colors.dart';
import '../features/core/widgets/app_widgets.dart';

/// PremiumManager is a utility class that handles the integration of
/// premium features throughout the app
class PremiumManager {
  // Singleton instance
  static final PremiumManager _instance = PremiumManager._internal();

  factory PremiumManager() => _instance;

  PremiumManager._internal();

  /// Checks if user has premium access
  bool isPremium(BuildContext context) {
    final premiumState = BlocProvider.of<PremiumBloc>(context).state;
    if (premiumState is PremiumStatusChecked) {
      return premiumState.isPremium;
    }
    return false;
  }

  /// Shows premium feature locked dialog
  Future<void> showPremiumLockedFeature(
    BuildContext context, {
    required String featureName,
    required String featureDescription,
  }) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.mapleRed, AppColors.canadianBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  const Icon(Icons.lock, color: Colors.white, size: 48),
                  const SizedBox(height: 8),
                  Text(
                    '$featureName Locked',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    featureDescription,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.darkGray,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  AppWidgets.primaryButton(
                    text: 'Upgrade to Premium',
                    onPressed: () {
                      Navigator.of(context).pop();
                      showPremiumPlans(context);
                    },
                  ),
                  const SizedBox(height: 12),
                  AppWidgets.textButton(
                    text: 'Maybe Later',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Shows premium plans screen
  void showPremiumPlans(BuildContext context) {
    // Check premium status first
    final userId = 'current_user_id'; // In a real app, get this from auth state
    BlocProvider.of<PremiumBloc>(
      context,
    ).add(CheckPremiumStatus(userId: userId));

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
              Expanded(
                child: BlocBuilder<PremiumBloc, PremiumState>(
                  builder: (context, state) {
                    if (state is PremiumLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is PremiumStatusChecked) {
                      return _buildPremiumPlansContent(
                        context,
                        state,
                        scrollController,
                      );
                    } else if (state is PremiumError) {
                      return Center(child: Text('Error: ${state.message}'));
                    } else {
                      return const Center(
                        child: Text('Loading premium plans...'),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds premium plans content
  Widget _buildPremiumPlansContent(
    BuildContext context,
    PremiumStatusChecked state,
    ScrollController scrollController,
  ) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Upgrade to RoadWise Premium',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Unlock all features and enhance your learning experience',
                  style: TextStyle(fontSize: 16, color: AppColors.darkGray),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Premium Benefits',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildBenefitItem(
                  icon: Icons.block,
                  title: 'Ad-Free Experience',
                  description: 'Learn without interruptions',
                ),
                _buildBenefitItem(
                  icon: Icons.quiz,
                  title: 'Unlimited Practice Tests',
                  description: 'Take as many tests as you need',
                ),
                _buildBenefitItem(
                  icon: Icons.download,
                  title: 'Offline Access',
                  description: 'Learn anytime, anywhere',
                ),
                _buildBenefitItem(
                  icon: Icons.analytics,
                  title: 'Detailed Analytics',
                  description: 'Track your progress with advanced insights',
                ),
                _buildBenefitItem(
                  icon: Icons.support_agent,
                  title: 'Priority Support',
                  description: 'Get help when you need it',
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: const Text(
              'Choose Your Plan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final plan = state.availablePlans[index];
              return _buildPlanCard(context, plan);
            }, childCount: state.availablePlans.length),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                AppWidgets.textButton(
                  text: 'Restore Purchases',
                  onPressed: () {
                    final userId =
                        'current_user_id'; // In a real app, get this from auth state
                    BlocProvider.of<PremiumBloc>(
                      context,
                    ).add(RestorePurchases(userId: userId));
                  },
                ),
                const SizedBox(height: 8),
                const Text(
                  'Subscriptions will automatically renew unless canceled at least 24 hours before the end of the current period. You can manage your subscriptions in your App Store account settings.',
                  style: TextStyle(fontSize: 12, color: AppColors.darkGray),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Builds a benefit item
  Widget _buildBenefitItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.mapleRed.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: AppColors.mapleRed, size: 20),
          ),
          const SizedBox(width: 16),
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

  /// Builds a premium plan card
  Widget _buildPlanCard(BuildContext context, PremiumPlan plan) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: plan.isMostPopular ? AppColors.mapleRed : Colors.grey.shade300,
          width: plan.isMostPopular ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          if (plan.isMostPopular)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: const BoxDecoration(
                color: AppColors.mapleRed,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
              ),
              child: const Text(
                'MOST POPULAR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      plan.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${plan.currency} ',
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.nearBlack,
                            ),
                          ),
                          TextSpan(
                            text: plan.price.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.nearBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  plan.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.darkGray,
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  children: plan.features.map((feature) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: AppColors.successGreen,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              feature,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                AppWidgets.primaryButton(
                  text: 'Subscribe',
                  onPressed: () {
                    final userId =
                        'current_user_id'; // In a real app, get this from auth state
                    BlocProvider.of<PremiumBloc>(context).add(
                      PurchasePremium(
                        userId: userId,
                        planId: plan.id,
                        paymentMethod:
                            'app_store', // or 'google_play' based on platform
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Handles premium purchase result
  void handlePurchaseResult(BuildContext context, PremiumState state) {
    if (state is PremiumPurchaseSuccess) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.mapleRed, AppColors.canadianBlue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.check_circle, color: Colors.white, size: 48),
                    SizedBox(height: 8),
                    Text(
                      'Welcome to Premium!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Text(
                      'Thank you for upgrading to RoadWise Premium!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'You now have access to all premium features and content. Enjoy your enhanced learning experience!',
                      style: TextStyle(fontSize: 16, color: AppColors.darkGray),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    AppWidgets.primaryButton(
                      text: 'Start Exploring',
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else if (state is PremiumPurchaseFailure) {
      AppWidgets.showToast(
        context: context,
        message: 'Purchase failed: ${state.message}',
        icon: Icons.error,
      );
    } else if (state is PremiumRestoreSuccess) {
      if (state.hadPurchases) {
        AppWidgets.showToast(
          context: context,
          message: 'Your purchases have been restored!',
          icon: Icons.check_circle,
        );
      } else {
        AppWidgets.showToast(
          context: context,
          message: 'No previous purchases found to restore.',
          icon: Icons.info,
        );
      }
    }
  }
}
