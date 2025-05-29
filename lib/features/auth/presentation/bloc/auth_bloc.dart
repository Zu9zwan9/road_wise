import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_wise/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:road_wise/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:road_wise/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:road_wise/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:road_wise/features/auth/presentation/bloc/auth_event.dart';
import 'package:road_wise/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signIn;
  final SignUpUseCase signUp;
  final SignOutUseCase signOut;
  final GetCurrentUserUseCase getCurrentUser;
  StreamSubscription? _userSubscription;

  AuthBloc({
    required this.signIn,
    required this.signUp,
    required this.signOut,
    required this.getCurrentUser,
  }) : super(const AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<SignInRequested>(_onSignInRequested);
    on<SignUpRequested>(_onSignUpRequested);
    on<GoogleSignInRequested>(_onGoogleSignInRequested);
    on<AppleSignInRequested>(_onAppleSignInRequested);
    on<SignOutRequested>(_onSignOutRequested);
    on<ForgotPasswordRequested>(_onForgotPasswordRequested);
  }

  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final user = await getCurrentUser();
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(const Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final user = await signIn(
        SignInParams(
          email: event.email,
          password: event.password,
        ),
      );
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final user = await signUp(
        SignUpParams(
          email: event.email,
          password: event.password,
          displayName: event.displayName,
        ),
      );
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onGoogleSignInRequested(
    GoogleSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      // Implement Google sign in
      // final user = await authRepository.signInWithGoogle();
      // emit(Authenticated(user));
      emit(const AuthError('Google sign in not implemented yet'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onAppleSignInRequested(
    AppleSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      // Implement Apple sign in
      // final user = await authRepository.signInWithApple();
      // emit(Authenticated(user));
      emit(const AuthError('Apple sign in not implemented yet'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      await signOut();
      emit(const Unauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onForgotPasswordRequested(
    ForgotPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      // Implement password reset
      // await authRepository.sendPasswordResetEmail(event.email);
      // emit(PasswordResetSent(event.email));
      emit(const AuthError('Password reset not implemented yet'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
