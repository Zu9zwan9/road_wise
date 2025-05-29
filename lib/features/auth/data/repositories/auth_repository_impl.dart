import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:road_wise/features/auth/domain/entities/user.dart' as app;
import 'package:road_wise/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRepositoryImpl({
    firebase_auth.FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<app.User> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        throw Exception('Sign in failed: No user returned');
      }

      // Update last login timestamp
      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .update({
        'lastLoginAt': FieldValue.serverTimestamp(),
      });

      return _mapFirebaseUserToAppUser(userCredential.user!);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthExceptionToMessage(e);
    } catch (e) {
      throw Exception('Sign in failed: ${e.toString()}');
    }
  }

  @override
  Future<app.User> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        throw Exception('Sign up failed: No user returned');
      }

      // Create user document in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
        'points': 0,
        'level': 1,
        'completedLessons': [],
        'isPremium': false,
      });

      return _mapFirebaseUserToAppUser(userCredential.user!);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthExceptionToMessage(e);
    } catch (e) {
      throw Exception('Sign up failed: ${e.toString()}');
    }
  }

  @override
  Future<app.User> signInWithGoogle() async {
    // Implement Google sign in
    throw UnimplementedError('Google sign in not implemented yet');
  }

  @override
  Future<app.User> signInWithApple() async {
    // Implement Apple sign in
    throw UnimplementedError('Apple sign in not implemented yet');
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Sign out failed: ${e.toString()}');
    }
  }

  @override
  Future<app.User?> getCurrentUser() async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser == null) {
      return null;
    }

    return _mapFirebaseUserToAppUser(currentUser);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthExceptionToMessage(e);
    } catch (e) {
      throw Exception('Password reset failed: ${e.toString()}');
    }
  }

  @override
  Future<app.User> updateUserProfile({
    String? displayName,
    String? photoUrl,
  }) async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser == null) {
        throw Exception('Update profile failed: No user logged in');
      }

      await currentUser.updateDisplayName(displayName);
      await currentUser.updatePhotoURL(photoUrl);

      return _mapFirebaseUserToAppUser(currentUser);
    } catch (e) {
      throw Exception('Update profile failed: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteAccount() async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser == null) {
        throw Exception('Delete account failed: No user logged in');
      }

      // Delete user document from Firestore
      await _firestore.collection('users').doc(currentUser.uid).delete();

      // Delete Firebase Auth user
      await currentUser.delete();
    } catch (e) {
      throw Exception('Delete account failed: ${e.toString()}');
    }
  }

  @override
  Future<bool> isPremium() async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser == null) {
        return false;
      }

      final userDoc =
          await _firestore.collection('users').doc(currentUser.uid).get();
      return userDoc.data()?['isPremium'] ?? false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> upgradeToPremium() async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser == null) {
        throw Exception('Upgrade to premium failed: No user logged in');
      }

      await _firestore.collection('users').doc(currentUser.uid).update({
        'isPremium': true,
      });
    } catch (e) {
      throw Exception('Upgrade to premium failed: ${e.toString()}');
    }
  }

  @override
  Stream<app.User?> get userStream {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) {
        return null;
      }

      return _mapFirebaseUserToAppUser(firebaseUser);
    });
  }

  // Helper method to map Firebase user to app User
  Future<app.User> _mapFirebaseUserToAppUser(
      firebase_auth.User firebaseUser) async {
    try {
      final userDoc =
          await _firestore.collection('users').doc(firebaseUser.uid).get();
      final userData = userDoc.data() ?? {};

      return app.User(
        id: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        displayName: firebaseUser.displayName,
        photoUrl: firebaseUser.photoURL,
        isEmailVerified: firebaseUser.emailVerified,
        createdAt:
            (userData['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
        lastLoginAt: (userData['lastLoginAt'] as Timestamp?)?.toDate(),
        points: userData['points'] ?? 0,
        level: userData['level'] ?? 1,
        completedLessons: List<String>.from(userData['completedLessons'] ?? []),
        isPremium: userData['isPremium'] ?? false,
      );
    } catch (e) {
      // If there's an error fetching Firestore data, return basic user info
      return app.User(
        id: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        displayName: firebaseUser.displayName,
        photoUrl: firebaseUser.photoURL,
        isEmailVerified: firebaseUser.emailVerified,
        createdAt: DateTime.now(),
      );
    }
  }

  // Helper method to map Firebase Auth exceptions to user-friendly messages
  String _mapFirebaseAuthExceptionToMessage(
      firebase_auth.FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Wrong password provided.';
      case 'email-already-in-use':
        return 'The email address is already in use.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'invalid-email':
        return 'The email address is invalid.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'too-many-requests':
        return 'Too many requests. Try again later.';
      case 'operation-not-allowed':
        return 'This operation is not allowed.';
      default:
        return e.message ?? 'An unknown error occurred.';
    }
  }
}
