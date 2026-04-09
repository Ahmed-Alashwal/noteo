import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/core/errors/failure.dart';
import 'package:note_app/features/auth/domain/usecases/auth_register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerUseCase}) : super(RegisterInitial());

  final AuthRegisterUseCase registerUseCase;

  Future<dynamic> register({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      emit(RegisterLoading());

      final response = await registerUseCase.call(
        RegisterParams(userName: userName, email: email, password: password),
      );

      emit(RegisterSuccess());
    } on ServerFailure catch (e) {
      emit(RegisterFailure(errMessage: e.errMessage));
    }
  }
}
