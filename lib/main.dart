import 'package:chef_app_round_two/app/app.dart';
import 'package:chef_app_round_two/core/databases/cache/cache_helper.dart';
import 'package:chef_app_round_two/core/services/service_locator.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/change_password_cubit/update_password_cubit.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:chef_app_round_two/features/profile/presentation/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/cubit/login_cubit.dart';
import 'package:chef_app_round_two/features/sign_in/presentation/forget_password_cubit/cubit/forget_password_cubit.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:chef_app_round_two/features/splash/presentation/cubit/global_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await sl<CacheHelper>().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<UpdateProfileCubit>()),
        BlocProvider(create: (context) => sl<HomeCubit>()),
        BlocProvider(create: (context) => sl<LoginCubit>()),
        BlocProvider(create: (context) => sl<SignUpCubit>()),
        BlocProvider(create: (context) => sl<SignUpCubit>()),
        BlocProvider(create: (context) => sl<UpdatePasswordCubit>()),
        BlocProvider(create: (context) => sl<ForgetPasswordCubit>()),
        BlocProvider(create: (context) => sl<GlobalCubit>()..getCachedLang()),
      ],
      child: const MyApp(),
    ),
  );
}
