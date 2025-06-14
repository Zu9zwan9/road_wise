import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/core/utils/base_bloc.dart';

// Premium Features Events
abstract class PremiumEvent extends BaseEvent {}

class CheckPremiumStatus extends PremiumEvent {
  final String userId;

  CheckPremiumStatus({required this.userId});

  @override
  List<Object> get props => [userId];
}

class PurchasePremium extends PremiumEvent {
  final String userId;
  final String planId;
  final String paymentMethod;

  PurchasePremium({
    required this.userId,
    required this.planId,
    required this.paymentMethod,
  });

  @override
  List<Object> get props => [userId, planId, paymentMethod];
}

class RestorePurchases extends PremiumEvent {
  final String userId;

  RestorePurchases({required this.userId});

  @override
  List<Object> get props => [userId];
}

// Premium Features States
abstract class PremiumState extends BaseState {}

class PremiumInitial extends PremiumState {}

class PremiumLoading extends PremiumState {}

class PremiumStatusChecked extends PremiumState {
  final bool isPremium;
  final String? currentPlan;
  final DateTime? expiryDate;
  final List<PremiumPlan> availablePlans;

  PremiumStatusChecked({
    required this.isPremium,
    this.currentPlan,
    this.expiryDate,
    required this.availablePlans,
  });

  @override
  List<Object> get props => [
    isPremium,
    if (currentPlan != null) currentPlan!,
    if (expiryDate != null) expiryDate!,
    availablePlans,
  ];
}

class PremiumPurchaseSuccess extends PremiumState {
  final String planId;
  final DateTime expiryDate;

  PremiumPurchaseSuccess({required this.planId, required this.expiryDate});

  @override
  List<Object> get props => [planId, expiryDate];
}

class PremiumPurchaseFailure extends PremiumState {
  final String message;

  PremiumPurchaseFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class PremiumRestoreSuccess extends PremiumState {
  final String? planId;
  final DateTime? expiryDate;
  final bool hadPurchases;

  PremiumRestoreSuccess({
    this.planId,
    this.expiryDate,
    required this.hadPurchases,
  });

  @override
  List<Object> get props => [
    if (planId != null) planId!,
    if (expiryDate != null) expiryDate!,
    hadPurchases,
  ];
}

class PremiumError extends PremiumState {
  final String message;

  PremiumError({required this.message});

  @override
  List<Object> get props => [message];
}

// Premium Plan Model
class PremiumPlan {
  final String id;
  final String name;
  final String description;
  final double price;
  final String currency;
  final PremiumPlanDuration duration;
  final List<String> features;
  final bool isMostPopular;
  final double? discountPercentage;

  PremiumPlan({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.currency,
    required this.duration,
    required this.features,
    this.isMostPopular = false,
    this.discountPercentage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PremiumPlan &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

// Premium Plan Duration
enum PremiumPlanDuration { monthly, quarterly, yearly, lifetime }

// Premium Features BLoC
class PremiumBloc extends BaseBloc<PremiumEvent, PremiumState> {
  // In a real app, these would be injected
  // final PremiumRepository premiumRepository;
  // final PaymentService paymentService;

  PremiumBloc() : super(PremiumInitial()) {
    on<CheckPremiumStatus>(_onCheckPremiumStatus);
    on<PurchasePremium>(_onPurchasePremium);
    on<RestorePurchases>(_onRestorePurchases);
  }

  Future<void> _onCheckPremiumStatus(
    CheckPremiumStatus event,
    Emitter<PremiumState> emit,
  ) async {
    emit(PremiumLoading());
    try {
      // In a real app, check premium status from repository
      // final premiumStatus = await premiumRepository.checkPremiumStatus(event.userId);
      // final availablePlans = await premiumRepository.getAvailablePlans();

      // Mock implementation for now
      await Future.delayed(const Duration(seconds: 1));

      // Mock premium status
      final bool isPremium = false;
      final String? currentPlan = null;
      final DateTime? expiryDate = null;

      // Mock available plans
      final availablePlans = [
        PremiumPlan(
          id: 'monthly',
          name: 'Monthly',
          description: 'Full access to all premium features',
          price: 4.99,
          currency: 'USD',
          duration: PremiumPlanDuration.monthly,
          features: [
            'Ad-free experience',
            'Unlimited practice tests',
            'Offline access to all content',
            'Detailed performance analytics',
            'Priority support',
          ],
          isMostPopular: false,
        ),
        PremiumPlan(
          id: 'quarterly',
          name: 'Quarterly',
          description: 'Save 15% compared to monthly',
          price: 12.99,
          currency: 'USD',
          duration: PremiumPlanDuration.quarterly,
          features: [
            'Ad-free experience',
            'Unlimited practice tests',
            'Offline access to all content',
            'Detailed performance analytics',
            'Priority support',
            'Personalized study plan',
          ],
          isMostPopular: true,
          discountPercentage: 15,
        ),
        PremiumPlan(
          id: 'yearly',
          name: 'Yearly',
          description: 'Save 40% compared to monthly',
          price: 35.99,
          currency: 'USD',
          duration: PremiumPlanDuration.yearly,
          features: [
            'Ad-free experience',
            'Unlimited practice tests',
            'Offline access to all content',
            'Detailed performance analytics',
            'Priority support',
            'Personalized study plan',
            'Exclusive advanced modules',
          ],
          isMostPopular: false,
          discountPercentage: 40,
        ),
        PremiumPlan(
          id: 'lifetime',
          name: 'Lifetime',
          description: 'One-time payment for lifetime access',
          price: 99.99,
          currency: 'USD',
          duration: PremiumPlanDuration.lifetime,
          features: [
            'Ad-free experience',
            'Unlimited practice tests',
            'Offline access to all content',
            'Detailed performance analytics',
            'Priority support',
            'Personalized study plan',
            'Exclusive advanced modules',
            'Free updates for life',
            'Early access to new features',
          ],
          isMostPopular: false,
        ),
      ];

      emit(
        PremiumStatusChecked(
          isPremium: isPremium,
          currentPlan: currentPlan,
          expiryDate: expiryDate,
          availablePlans: availablePlans,
        ),
      );
    } catch (e) {
      emit(PremiumError(message: e.toString()));
    }
  }

  Future<void> _onPurchasePremium(
    PurchasePremium event,
    Emitter<PremiumState> emit,
  ) async {
    emit(PremiumLoading());
    try {
      // In a real app, process payment and update premium status
      // final result = await paymentService.processPurchase(
      //   userId: event.userId,
      //   planId: event.planId,
      //   paymentMethod: event.paymentMethod,
      // );
      // await premiumRepository.updatePremiumStatus(
      //   userId: event.userId,
      //   planId: event.planId,
      //   expiryDate: result.expiryDate,
      // );

      // Mock implementation for now
      await Future.delayed(const Duration(seconds: 2));

      // Mock successful purchase
      final DateTime expiryDate = DateTime.now().add(const Duration(days: 30));

      emit(
        PremiumPurchaseSuccess(planId: event.planId, expiryDate: expiryDate),
      );
    } catch (e) {
      emit(PremiumPurchaseFailure(message: e.toString()));
    }
  }

  Future<void> _onRestorePurchases(
    RestorePurchases event,
    Emitter<PremiumState> emit,
  ) async {
    emit(PremiumLoading());
    try {
      // In a real app, restore purchases and update premium status
      // final restoredPurchases = await paymentService.restorePurchases(event.userId);
      // if (restoredPurchases.isNotEmpty) {
      //   final latestPurchase = restoredPurchases.first;
      //   await premiumRepository.updatePremiumStatus(
      //     userId: event.userId,
      //     planId: latestPurchase.planId,
      //     expiryDate: latestPurchase.expiryDate,
      //   );
      // }

      // Mock implementation for now
      await Future.delayed(const Duration(seconds: 2));

      // Mock no purchases to restore
      final bool hadPurchases = false;

      emit(
        PremiumRestoreSuccess(
          planId: null,
          expiryDate: null,
          hadPurchases: hadPurchases,
        ),
      );
    } catch (e) {
      emit(PremiumError(message: e.toString()));
    }
  }
}
