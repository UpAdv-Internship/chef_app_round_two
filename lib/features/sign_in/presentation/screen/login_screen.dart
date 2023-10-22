import 'package:chef_app_round_two/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                AppAssets.backgroundTwo,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Text('data')
            ],
          )
        ],
      ),
    );
  }
}
