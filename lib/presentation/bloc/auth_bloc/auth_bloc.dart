import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/data/source/auth_repo/auth_local_data_source.dart';
import 'package:shopit/domain/usecases/login_usecase.dart';
import 'package:shopit/presentation/bloc/auth_bloc/auth_event.dart';
import 'package:shopit/presentation/bloc/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final AuthLocalDataSource localDataSource;

  AuthBloc(this.loginUsecase,this.localDataSource) : super(AuthInitial()) {
    on<AppStartedEvent>((event, emit) async {
      final user = await localDataSource.getUser();
      if (user != null) {
        emit(AuthSuccess(user: user));
      } else {
        emit(AuthInitial());
      }
    }); 
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
