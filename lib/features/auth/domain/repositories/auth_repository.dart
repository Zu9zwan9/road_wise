import 'package:road_wise/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  /// Sign in with email and password
  Future<User> signInWithEmailAndPassword(String email, String password);

  /// Sign up with email and password
  Future<User> signUpWithEmailAndPassword(String email, String password);

  /// Sign in with Google
  Future<User> signInWithGoogle();

  /// Sign in with Apple
  Future<User> signInWithApple();

  /// Sign out
  Future<void> signOut();

  /// Get current user
  Future<User?> getCurrentUser();

  /// Send password reset email
  Future<void> sendPasswordResetEmail(String email);

  /// Update user profile
  Future<User> updateUserProfile({
    String? displayName,
    String? photoUrl,
  });

  /// Delete user account
  Future<void> deleteAccount();

  /// Check if user is premium
  Future<bool> isPremium();

  /// Upgrade to premium
  Future<void> upgradeToPremium();

  /// Get user stream
  Stream<User?> get userStream;
}
