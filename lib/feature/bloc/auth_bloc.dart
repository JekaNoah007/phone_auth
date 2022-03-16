import 'package:auth_project/feature/repositories/api_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repo}) : super(AuthInitial()) {
    on<AuthSendNumberEvent>(_sendNumber);
    on<AuthSendCodeEvent>(_sendCodeNumber);
  }

  late final AuthRepoImpl repo;

  Future<void> _sendNumber(
    AuthSendNumberEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    await Future.delayed(const Duration(seconds: 2));

    final result = await repo.sendNumber(phone: event.phoneNumber);

    if (result) {
      emit(AuthSuccess());
    } else {
      emit(AuthError());
    }
  }

  Future<void> _sendCodeNumber(
    AuthSendCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    await Future.delayed(const Duration(seconds: 2));

    final result = await repo.sendCodeNumber(code: event.codeNumber);

    if (result) {
      emit(AuthSuccess());
    } else {
      emit(AuthError());
    }
  }
}

@immutable
abstract class AuthEvent {}

class AuthSendNumberEvent extends AuthEvent {
  AuthSendNumberEvent({required this.phoneNumber});
  final String phoneNumber;
}

class AuthSendCodeEvent extends AuthEvent {
  AuthSendCodeEvent({required this.codeNumber});
  final String codeNumber;
}

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {}
