import 'package:chef_app_round_two/core/databases/api/end_points.dart';
import 'package:chef_app_round_two/core/databases/cache/cache_helper.dart';
import 'package:chef_app_round_two/core/services/service_locator.dart';
import 'package:chef_app_round_two/features/sign_in/data/model/login_model.dart';
import 'package:chef_app_round_two/features/sign_in/data/reposatory/login_repo.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepository loginRepo;
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
//!passsword suffixIcon
  bool isLoginPasswordsShowing = true;
  IconData suffixIcon = Icons.visibility_off ;
  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordsShowing = !isLoginPasswordsShowing;
    suffixIcon =
        isLoginPasswordsShowing ?Icons.visibility_off   : Icons.visibility;
    emit(ChangeLoginPasswordSuffixIcon());
  }


  LoginModel? loginModel;
  // login method
  void login() async {
    emit(LoginLoadingState());
    final result = await loginRepo.login(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold((l) => emit(LoginErrorState(l)), (r) async {
      loginModel = r;
      Map<String, dynamic> decodedToken = JwtDecoder.decode(r.token);
      await sl<CacheHelper>()
          .saveData(key: Apikeys.id, value: decodedToken[Apikeys.id]);
      await sl<CacheHelper>().saveData(
        key: Apikeys.token,
        value: r.token,
      );
      emit(LoginSuccessState());
    });
  }
}
