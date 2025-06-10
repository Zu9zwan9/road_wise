import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../provincial_content/data/models/province_model.dart';
import '../../../provincial_content/presentation/bloc/province_bloc.dart';
import '../bloc/auth_bloc.dart';

class ProvinceSelectionScreen extends StatefulWidget {
  const ProvinceSelectionScreen({super.key});

  @override
  State<ProvinceSelectionScreen> createState() =>
      _ProvinceSelectionScreenState();
}

class _ProvinceSelectionScreenState extends State<ProvinceSelectionScreen> {
  String? _selectedProvinceId;

  @override
  void initState() {
    super.initState();
    // Load provinces when screen initializes
    BlocProvider.of<ProvinceBloc>(context).add(LoadProvinces());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              // Navigate to dashboard when province selection is complete
              Navigator.of(context).pushReplacementNamed('/dashboard');
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Your Province',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.canadianBlue,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'RoadWise will customize your learning experience based on your province\'s specific traffic rules and regulations.',
                      style: TextStyle(fontSize: 16, color: AppColors.darkGray),
                    ),
                  ],
                ),
              ),

              // Province List
              Expanded(
                child: BlocBuilder<ProvinceBloc, ProvinceState>(
                  builder: (context, state) {
                    if (state is ProvinceLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProvincesLoaded) {
                      return _buildProvinceList(state.provinces);
                    } else if (state is ProvinceError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: AppColors.errorRed,
                              size: 48,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Error: ${state.message}',
                              style: const TextStyle(color: AppColors.errorRed),
                            ),
                            const SizedBox(height: 16),
                            AppWidgets.secondaryButton(
                              text: 'Try Again',
                              onPressed: () {
                                BlocProvider.of<ProvinceBloc>(
                                  context,
                                ).add(LoadProvinces());
                              },
                              isFullWidth: false,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(child: Text('Loading provinces...'));
                    }
                  },
                ),
              ),

              // Continue Button
              Padding(
                padding: const EdgeInsets.all(24),
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, authState) {
                    return AppWidgets.primaryButton(
                      text: 'Continue',
                      onPressed: () {
                        if (_selectedProvinceId != null) {
                          BlocProvider.of<AuthBloc>(context).add(
                            ProvinceSelected(provinceId: _selectedProvinceId!),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please select a province.'),
                            ),
                          );
                        }
                      },
                      isLoading: authState is AuthLoading,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProvinceList(List<ProvinceModel> provinces) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: provinces.length,
      itemBuilder: (context, index) {
        final province = provinces[index];
        final isSelected = province.id == _selectedProvinceId;

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isSelected ? AppColors.mapleRed : Colors.transparent,
              width: 2,
            ),
          ),
          elevation: isSelected ? 4 : 1,
          child: InkWell(
            onTap: () {
              setState(() {
                _selectedProvinceId = province.id;
              });
              BlocProvider.of<ProvinceBloc>(
                context,
              ).add(SelectProvince(provinceId: province.id));
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Province flag or icon placeholder
                  Container(
                    width: 60,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        province.code,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Province details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          province.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          province.description,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.darkGray,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  // Selection indicator
                  if (isSelected)
                    const Icon(Icons.check_circle, color: AppColors.mapleRed),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
