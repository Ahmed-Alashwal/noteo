import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/errors/failure.dart';
import 'package:note_app/features/auth/domain/usecases/auth_login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthLoginUseCase authLoginUseCase;
  LoginCubit({required this.authLoginUseCase}) : super(LoginInitial());

  Future<dynamic> login({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading());

    final result = await authLoginUseCase.call(
      LoginParams(userName: username, password: password),
    );

    result.fold(
      (failure) => emit(LoginFailure(errMessage: failure.errMessage)),
      (success) => emit(LoginSuccess()),
    );
  }
}
