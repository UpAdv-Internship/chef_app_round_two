import 'package:chef_app_round_two/core/local/app_locale.dart';
import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:chef_app_round_two/core/utils/app_strings.dart';
import 'package:chef_app_round_two/features/splash/presentation/cubit/global_cubit.dart';
import 'package:chef_app_round_two/features/splash/presentation/cubit/global_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.settings.tr(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocConsumer<GlobalCubit, GlobalState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Row(
              children: [
                Text(
                  AppStrings.language.tr(context),
                ),
                const Spacer(),
                Switch(
                  activeColor: AppColors.primary,
                  value: BlocProvider.of<GlobalCubit>(context).switchOn,
                  onChanged: (value) {
                    BlocProvider.of<GlobalCubit>(context).switchLang(value);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
