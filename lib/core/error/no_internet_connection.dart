import 'package:chef_app_round_two/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_lock,
              color: AppColors.red,
            ),
            SizedBox(height: 10),
            Text(
              "No Internet Connection",
            ),
          ],
        ),
      ),
    );
  }
}
