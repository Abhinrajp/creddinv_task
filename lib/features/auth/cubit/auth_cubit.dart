import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthStatus { idle, success, failure }

class AuthState {
  const AuthState({this.status = AuthStatus.idle, this.message});
  final AuthStatus status;
  final String? message;
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void login(String email, String password) {
    if (email.trim().toLowerCase() == 'demo@luxecart.com' && password == 'password123') {
      emit(const AuthState(status: AuthStatus.success));
    } else {
      emit(const AuthState(status: AuthStatus.failure,
          message: 'Those details do not match our demo account.'));
    }
  }

  void reset() => emit(const AuthState());
}
