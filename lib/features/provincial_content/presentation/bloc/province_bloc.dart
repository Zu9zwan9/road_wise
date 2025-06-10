import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/base_bloc.dart';
import '../../data/models/province_model.dart';

// Province Selection Events
abstract class ProvinceEvent extends BaseEvent {}

class LoadProvinces extends ProvinceEvent {}

class SelectProvince extends ProvinceEvent {
  final String provinceId;

  SelectProvince({required this.provinceId});

  @override
  List<Object> get props => [provinceId];
}

// Province Selection States
abstract class ProvinceState extends BaseState {}

class ProvinceInitial extends ProvinceState {}

class ProvinceLoading extends ProvinceState {}

class ProvincesLoaded extends ProvinceState {
  final List<ProvinceModel> provinces;
  final ProvinceModel? selectedProvince;

  ProvincesLoaded({required this.provinces, this.selectedProvince});

  @override
  List<Object> get props => [
    provinces,
    if (selectedProvince != null) selectedProvince!,
  ];
}

class ProvinceError extends ProvinceState {
  final String message;

  ProvinceError({required this.message});

  @override
  List<Object> get props => [message];
}

// Province Selection BLoC
class ProvinceBloc extends BaseBloc<ProvinceEvent, ProvinceState> {
  // In a real app, this would be injected
  // final ProvinceRepository provinceRepository;

  ProvinceBloc() : super(ProvinceInitial()) {
    on<LoadProvinces>(_onLoadProvinces);
    on<SelectProvince>(_onSelectProvince);
  }

  Future<void> _onLoadProvinces(
    LoadProvinces event,
    Emitter<ProvinceState> emit,
  ) async {
    emit(ProvinceLoading());
    try {
      // In a real app, fetch provinces from repository
      // final provinces = await provinceRepository.getProvinces();

      // Mock implementation using the static method from ProvinceModel
      await Future.delayed(const Duration(milliseconds: 500));
      final provinces = ProvinceModel.allProvinces();

      emit(ProvincesLoaded(provinces: provinces));
    } catch (e) {
      emit(ProvinceError(message: e.toString()));
    }
  }

  Future<void> _onSelectProvince(
    SelectProvince event,
    Emitter<ProvinceState> emit,
  ) async {
    if (state is ProvincesLoaded) {
      final currentState = state as ProvincesLoaded;
      try {
        // Find the selected province from the list
        final selectedProvince = currentState.provinces.firstWhere(
          (province) => province.id == event.provinceId,
        );

        // In a real app, save the selected province
        // await provinceRepository.saveSelectedProvince(selectedProvince);

        emit(
          ProvincesLoaded(
            provinces: currentState.provinces,
            selectedProvince: selectedProvince,
          ),
        );
      } catch (e) {
        emit(ProvinceError(message: e.toString()));
      }
    }
  }
}
