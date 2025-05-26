import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vista_admin/bloc/auth_bloc.dart';


class AuthViewModel {
  final AuthBloc authBloc;

  AuthViewModel(this.authBloc);

  void login(String username, String password) {
    authBloc.add(LoginEvent(username, password));
  }
}