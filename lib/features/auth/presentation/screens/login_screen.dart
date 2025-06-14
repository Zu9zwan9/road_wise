import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_wise/features/auth/presentation/bloc/auth_bloc.dart'; // Ensure this import is correct
import 'package:road_wise/features/core/presentation/widgets/custom_button.dart';
import 'package:road_wise/features/core/presentation/widgets/custom_text_field.dart';
import 'package:road_wise/features/core/presentation/widgets/social_login_button.dart';
import 'package:road_wise/utils/app_colors.dart';
import 'package:road_wise/utils/app_router.dart';
import 'package:road_wise/utils/app_strings.dart';
import 'package:road_wise/utils/app_styles.dart';
import 'package:road_wise/utils/spacing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.login)),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is Authenticated) {
            // Navigate to home or dashboard
            context.goNamed(AppRoute.home.name);
          } else if (state is ProvinceSelectionRequired) {
            // Navigate to province selection screen
            context.goNamed(AppRoute.provinceSelection.name);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Road Wise',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Master road signs, ace your driving test',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                CustomTextField(
                  controller: _emailController,
                  label: AppStrings.email,
                  hint: AppStrings.enterYourEmail,
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.pleaseEnterYourEmail;
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return AppStrings.pleaseEnterAValidEmail;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.sm),
                CustomTextField(
                  controller: _passwordController,
                  label: AppStrings.password,
                  hint: AppStrings.enterYourPassword,
                  prefixIcon: Icons.lock,
                  obscureText: _obscurePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.pleaseEnterYourPassword;
                    }
                    if (value.length < 6) {
                      return AppStrings.passwordMustBeAtLeast6Characters;
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/forgot-password');
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return CustomButton(
                      text: AppStrings.login,
                      onPressed: state is AuthLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                  SignInRequested(
                                    // Corrected event name
                                    _emailController.text,
                                    _passwordController.text,
                                  ),
                                );
                              }
                            },
                      child: state is AuthLoading
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            )
                          : null,
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                SocialLoginButton(
                  text: AppStrings.loginWithGoogle,
                  iconPath:
                      'assets/icons/google_logo.png', // Replace with your asset
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      const SocialLoginRequested("google"),
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.sm),
                SocialLoginButton(
                  text: AppStrings.loginWithFacebook,
                  iconPath:
                      'assets/icons/facebook_logo.png', // Replace with your asset
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      const SocialLoginRequested("facebook"),
                    );
                  },
                ),
                const SizedBox(height: AppSpacing.sm),
                SocialLoginButton(
                  text: AppStrings.loginWithApple,
                  iconPath:
                      'assets/icons/apple_logo.png', // Replace with your asset
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      const SocialLoginRequested("apple"),
                    );
                  },
                ),
                const Spacer(),
                const Text(
                  '© 2025 Road Wise. All rights reserved.',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
