import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar_ahmed_advanced_app/core/networking/api_result.dart';
import 'package:omar_ahmed_advanced_app/features/login/data/models/login_request_body.dart';
import 'package:omar_ahmed_advanced_app/features/login/data/repos/login_repo.dart';

import 'package:omar_ahmed_advanced_app/features/login/logic/login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  Future<void> login(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    response.when(
      success: (data) {
        emit(LoginState.success(data));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message??''));
      },
    );
  }
}
