import 'package:chef_app_round_two/features/sign_up/presentation/widgets/get_sign_up_app_bar_widget.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getSignUpAppBar(context),
        body: const SignUpBody(),
      ),
    );
  }
}
