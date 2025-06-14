import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:road_wise/features/auth/presentation/bloc/auth_bloc.dart'; // Ensure this import is correct
import 'package:road_wise/features/core/presentation/widgets/custom_button.dart';
import 'package:road_wise/features/core/presentation/widgets/custom_text_field.dart';
import 'package:road_wise/utils/app_colors.dart';
import 'package:road_wise/utils/app_router.dart';
import 'package:road_wise/utils/app_strings.dart';
import 'package:road_wise/utils/app_styles.dart';
import 'package:road_wise/utils/spacing.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.register)),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is ProvinceSelectionRequired) {
            // Navigate to province selection screen
            // This might happen if user registration is partial and needs more info
            context.goNamed(AppRoute.provinceSelection.name);
          } else if (state is Authenticated) {
            // This case might be less common directly after registration
            // unless your flow auto-logs in and skips province selection.
            context.goNamed(AppRoute.home.name);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Join Road Wise',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Create an account to track your progress and learn road signs effectively',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  CustomTextField(
                    controller: _fullNameController,
                    label: AppStrings.fullName,
                    hint: AppStrings.enterFullName,
                    prefixIcon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.pleaseEnterYourName;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  CustomTextField(
                    controller: _emailController,
                    label: AppStrings.email,
                    hint: AppStrings.enterEmail,
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
                  const SizedBox(height: AppSpacing.lg),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: AppStrings.password,
                      hintText: AppStrings.enterPassword,
                      prefixIcon: const Icon(Icons.lock),
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
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.pleaseEnterAPassword;
                      }
                      if (value.length < 6) {
                        return AppStrings.passwordMustBeAtLeast6Characters;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    decoration: InputDecoration(
                      labelText: AppStrings.confirmPassword,
                      hintText: AppStrings.reenterPassword,
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.pleaseConfirmYourPassword;
                      }
                      if (value != _passwordController.text) {
                        return AppStrings.passwordsDoNotMatch;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return CustomButton(
                        text: AppStrings.register,
                        onPressed: state is AuthLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                    SignUpRequested(
                                      // Corrected event name
                                      _emailController.text,
                                      _passwordController.text,
                                      _fullNameController.text,
                                      // Add other parameters like province if needed
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
                  const SizedBox(height: AppSpacing.lg),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      AppStrings.alreadyHaveAnAccount,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
