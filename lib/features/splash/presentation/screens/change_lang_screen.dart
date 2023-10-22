import 'package:flutter/material.dart';

class ChangeLangScreen extends StatelessWidget{
  const ChangeLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('Change Lang Goes Here'),
          ),
    )
    );
  }

}