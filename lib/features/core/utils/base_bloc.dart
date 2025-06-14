import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Base class for all events in the application
abstract class BaseEvent extends Equatable {
  const BaseEvent();

  @override
  List<Object?> get props => [];
}

/// Base class for all states in the application
abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object?> get props => [];
}

/// Base Bloc class for all blocs in the application
/// Provides common functionality and error handling
class BaseBloc<Event extends BaseEvent, State extends BaseState>
    extends Bloc<Event, State> {
  BaseBloc(State initialState) : super(initialState) {
    on<Event>((event, emit) {
      // Base event handler can be implemented here if needed
    });
  }

  // Common method for handling errors
  void handleError(Object error, StackTrace stackTrace) {
    // Log error or perform any common error handling
    if (kDebugMode) {
      print('Error in bloc: $error');
    }
    print('Stack trace: $stackTrace');
  }
}
