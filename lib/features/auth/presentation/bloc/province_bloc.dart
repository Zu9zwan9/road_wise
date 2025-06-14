import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/base_bloc.dart';

// Events
abstract class ProvinceEvent extends BaseEvent {
  const ProvinceEvent();
}

class LoadProvinces extends ProvinceEvent {
  const LoadProvinces();
}

class SelectProvince extends ProvinceEvent {
  final String provinceId;
  final String provinceName;

  const SelectProvince({required this.provinceId, required this.provinceName});

  @override
  List<Object> get props => [provinceId, provinceName];
}

// States
abstract class ProvinceState extends BaseState {
  const ProvinceState();
}

class ProvinceInitial extends ProvinceState {
  const ProvinceInitial();
}

class ProvincesLoading extends ProvinceState {
  const ProvincesLoading();
}

class ProvincesLoaded extends ProvinceState {
  final List<Map<String, dynamic>> provinces;
  final String? selectedProvinceId;
  final String? selectedProvinceName;

  const ProvincesLoaded({
    required this.provinces,
    this.selectedProvinceId,
    this.selectedProvinceName,
  });

  @override
  List<Object?> get props => [
    provinces,
    selectedProvinceId,
    selectedProvinceName,
  ];

  ProvincesLoaded copyWith({
    List<Map<String, dynamic>>? provinces,
    String? selectedProvinceId,
    String? selectedProvinceName,
  }) {
    return ProvincesLoaded(
      provinces: provinces ?? this.provinces,
      selectedProvinceId: selectedProvinceId ?? this.selectedProvinceId,
      selectedProvinceName: selectedProvinceName ?? this.selectedProvinceName,
    );
  }
}

class ProvinceError extends ProvinceState {
  final String message;

  const ProvinceError({required this.message});

  @override
  List<Object> get props => [message];
}

// BLoC
class ProvinceBloc extends BaseBloc<ProvinceEvent, ProvinceState> {
  final List<Map<String, dynamic>> _mockProvinces = [
    {'id': 'ab', 'name': 'Alberta'},
    {'id': 'bc', 'name': 'British Columbia'},
    {'id': 'mb', 'name': 'Manitoba'},
    {'id': 'nb', 'name': 'New Brunswick'},
    {'id': 'nl', 'name': 'Newfoundland and Labrador'},
    {'id': 'nt', 'name': 'Northwest Territories'},
    {'id': 'ns', 'name': 'Nova Scotia'},
    {'id': 'nu', 'name': 'Nunavut'},
    {'id': 'on', 'name': 'Ontario'},
    {'id': 'pe', 'name': 'Prince Edward Island'},
    {'id': 'qc', 'name': 'Quebec'},
    {'id': 'sk', 'name': 'Saskatchewan'},
    {'id': 'yt', 'name': 'Yukon'},
  ];

  ProvinceBloc() : super(const ProvinceInitial()) {
    on<LoadProvinces>(_onLoadProvinces);
    on<SelectProvince>(_onSelectProvince);
  }

  void _onLoadProvinces(
    LoadProvinces event,
    Emitter<ProvinceState> emit,
  ) async {
    emit(const ProvincesLoading());
    try {
      // In a real app, you might fetch this data from an API or database
      await Future.delayed(const Duration(milliseconds: 300));
      emit(ProvincesLoaded(provinces: _mockProvinces));
    } catch (e) {
      emit(ProvinceError(message: e.toString()));
    }
  }

  void _onSelectProvince(SelectProvince event, Emitter<ProvinceState> emit) {
    final currentState = state;
    if (currentState is ProvincesLoaded) {
      emit(
        currentState.copyWith(
          selectedProvinceId: event.provinceId,
          selectedProvinceName: event.provinceName,
        ),
      );

      // Here you would typically save the selected province to user preferences
      // or update the user profile in a database
    }
  }
}
