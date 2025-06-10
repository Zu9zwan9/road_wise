import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/base_bloc.dart';
import '../../data/models/user_model.dart';

// Authentication Events
abstract class AuthEvent extends BaseEvent {}

class AuthCheckRequested extends AuthEvent {}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;
  final bool rememberMe;

  LoginRequested({
    required this.email,
    required this.password,
    required this.rememberMe,
  });

  @override
  List<Object> get props => [email, password, rememberMe];
}

class SocialLoginRequested extends AuthEvent {
  final String provider;

  SocialLoginRequested({required this.provider});

  @override
  List<Object> get props => [provider];
}

class SignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String displayName;

  SignUpRequested({
    required this.email,
    required this.password,
    required this.displayName,
  });

  @override
  List<Object> get props => [email, password, displayName];
}

class SignOutRequested extends AuthEvent {}

class ProvinceSelected extends AuthEvent {
  final String provinceId;

  ProvinceSelected({required this.provinceId});

  @override
  List<Object> get props => [provinceId];
}

// Authentication States
abstract class AuthState extends BaseState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final UserModel user;

  Authenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class Unauthenticated extends AuthState {}

class ProvinceSelectionRequired extends AuthState {
  final UserModel user;

  ProvinceSelectionRequired({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});

  @override
  List<Object> get props => [message];
}

// Authentication BLoC
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  // In a real app, this would be injected
  // final AuthRepository authRepository;

  AuthBloc() : super(AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<SignInRequested>(_onSignInRequested);
    on<LoginRequested>(_onLoginRequested);
    on<SocialLoginRequested>(_onSocialLoginRequested);
    on<SignUpRequested>(_onSignUpRequested);
    on<SignOutRequested>(_onSignOutRequested);
    on<ProvinceSelected>(_onProvinceSelected);
  }

  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      // In a real app, check if user is logged in
      // final user = await authRepository.getCurrentUser();

      // Mock implementation for now
      await Future.delayed(const Duration(seconds: 1));
      final bool isLoggedIn = false;

      if (isLoggedIn) {
        final user = UserModel(
          id: '1',
          email: 'user@example.com',
          displayName: 'Test User',
          selectedProvince: 'on',
          createdAt: DateTime.now(),
          lastLoginAt: DateTime.now(),
        );

        if (user.selectedProvince.isEmpty) {
          emit(ProvinceSelectionRequired(user: user));
        } else {
          emit(Authenticated(user: user));
        }
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      // In a real app, sign in with email and password
      // final user = await authRepository.signIn(event.email, event.password);

      // Mock implementation for now
      await Future.delayed(const Duration(seconds: 1));

      // Simulate successful login
      final user = UserModel(
        id: '1',
        email: event.email,
        displayName: 'Test User',
        selectedProvince: 'on',
        createdAt: DateTime.now(),
        lastLoginAt: DateTime.now(),
      );

      if (user.selectedProvince.isEmpty) {
        emit(ProvinceSelectionRequired(user: user));
      } else {
        emit(Authenticated(user: user));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      // Mock implementation for now
      await Future.delayed(const Duration(seconds: 1));

      // Simulate successful login
      final user = UserModel(
        id: '1',
        email: event.email,
        displayName: 'Test User',
        selectedProvince: 'on',
        createdAt: DateTime.now(),
        lastLoginAt: DateTime.now(),
      );

      if (user.selectedProvince.isEmpty) {
        emit(ProvinceSelectionRequired(user: user));
      } else {
        emit(Authenticated(user: user));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onSocialLoginRequested(
    SocialLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      // Mock implementation for social login
      await Future.delayed(const Duration(seconds: 1));

      // Simulate successful social login
      final user = UserModel(
        id: '1',
        email: 'social@example.com',
        displayName: 'Social User',
        selectedProvince: 'on',
        createdAt: DateTime.now(),
        lastLoginAt: DateTime.now(),
      );

      if (user.selectedProvince.isEmpty) {
        emit(ProvinceSelectionRequired(user: user));
      } else {
        emit(Authenticated(user: user));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      // In a real app, sign up with email, password, and display name
      // final user = await authRepository.signUp(
      //   event.email,
      //   event.password,
      //   event.displayName,
      // );

      // Mock implementation for now
      await Future.delayed(const Duration(seconds: 1));

      // Simulate successful registration
      final user = UserModel(
        id: '1',
        email: event.email,
        displayName: event.displayName,
        selectedProvince: '',
        createdAt: DateTime.now(),
        lastLoginAt: DateTime.now(),
      );

      emit(ProvinceSelectionRequired(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      // In a real app, sign out
      // await authRepository.signOut();

      // Mock implementation for now
      await Future.delayed(const Duration(seconds: 1));

      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onProvinceSelected(
    ProvinceSelected event,
    Emitter<AuthState> emit,
  ) async {
    if (state is ProvinceSelectionRequired) {
      final currentState = state as ProvinceSelectionRequired;
      emit(AuthLoading());
      try {
        // In a real app, update user's selected province
        // final updatedUser = await authRepository.updateUserProvince(
        //   currentState.user.id,
        //   event.provinceId,
        // );

        // Mock implementation for now
        await Future.delayed(const Duration(seconds: 1));

        final updatedUser = currentState.user.copyWith(
          selectedProvince: event.provinceId,
        );

        emit(Authenticated(user: updatedUser));
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    }
  }
}
