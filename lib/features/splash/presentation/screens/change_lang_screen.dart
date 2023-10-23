import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commons.dart';
import '../cubit/global_cubit.dart';
import '../cubit/global_state.dart';

class ChangeLangScreen extends StatelessWidget {
  const ChangeLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            //background image
            Image.asset(
              AppAssets.background,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 116,
                    ),
                    Image.asset(
                      AppAssets.appLogo,
                      width: 140,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppStrings.welcomeToChefApp.tr(context),
                      style: GoogleFonts.lato(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black), //latoStyle36
                    ),
                    const SizedBox(height: 54),
                    Text(
                      AppStrings.pleaseChooseYourLanguage.tr(context),
                      style: GoogleFonts.lato(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black), //24
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    BlocBuilder<GlobalCubit, GlobalState>(
                        builder: (context, state) {
                      return Row(
                        children: [
                          SizedBox(
                            height: 48,
                            width: 140,
                            child: ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<GlobalCubit>(context)
                                      .changeLang('en');
                                  navigate(context: context, route: Routes.login);
                                },
                                style: Theme.of(context)
                                    .elevatedButtonTheme
                                    .style!
                                    .copyWith(
                                      backgroundColor: MaterialStateProperty.all(
                                          AppColors.black),
                                    ),
                                child: const Text(
                                  'English',
                                  style: TextStyle(
                                      fontSize: 24, color: AppColors.white),
                                )),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 48,
                            width: 140,
                            child: ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<GlobalCubit>(context)
                                      .changeLang('ar');
                                  navigate(context: context, route: Routes.login);
                                },
                                style: Theme.of(context)
                                    .elevatedButtonTheme
                                    .style!
                                    .copyWith(
                                      backgroundColor: MaterialStateProperty.all(
                                          AppColors.black),
                                    ),
                                child: const Text(
                                  'العربية',
                                  style: TextStyle(
                                      fontSize: 24, color: AppColors.white),
                                )),
                          ),
                        ],
                      );
                    })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
