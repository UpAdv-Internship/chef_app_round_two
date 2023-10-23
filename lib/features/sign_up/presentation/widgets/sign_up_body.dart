import 'package:chef_app_round_two/features/sign_up/presentation/widgets/stepper_body.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/stepper_widget.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(child: StepperWidget()),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(child: StepperBody()),
      ],
    );
  }
}
