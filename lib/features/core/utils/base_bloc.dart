import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Base class for all events in the application
abstract class BaseEvent extends Equatable {
  const BaseEvent();

  @override
  List<Object> get props => [];
}

/// Base class for all states in the application
abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object> get props => [];
}

/// Base class for all BLoCs in the application
abstract class BaseBloc<E extends BaseEvent, S extends BaseState> extends Bloc<E, S> {
  BaseBloc(super.initialState);
}
