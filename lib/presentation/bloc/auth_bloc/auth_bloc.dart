import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/domain/usecases/login_usecase.dart';
import 'package:shopit/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:shopit/presentation/bloc/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;

  AuthBloc(this.loginUsecase) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await loginUsecase.login(event.username, event.password);
        emit(AuthSuccess(user: user));
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });

    on<LogoutEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await loginUsecase.logout();
        emit(AuthInitial());
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });
  }
}
