import 'package:chef_app_round_two/features/sign_up/presentation/widgets/requierd_health_certification_item.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/required_front_id_item.dart';
import 'package:chef_app_round_two/features/sign_up/presentation/widgets/requored_back_id_item.dart';
import 'package:flutter/material.dart';

class CustomRequierdFiles extends StatelessWidget {
  const CustomRequierdFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        //!Front ID
        RequierdFrontIDFileItem(),
        //!Back ID
        RequierdBackIDFileItem(),
        //!Front ID
        RequierdhealthCertificateFileItem(),
      ],
    );
  }
}



