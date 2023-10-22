import 'package:chef_app_round_two/features/sign_up/presentation/widgets/stepper_widget.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: StepperWidget()),
        // SliverToBoxAdapter(child: StepperBody()),
      ],
    );
  }
}

// class StepperBody extends StatelessWidget {
//   const StepperBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }
