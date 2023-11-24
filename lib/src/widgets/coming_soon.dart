import 'package:appy/src/constants.dart';
import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: Constants.extraLarge,
      ),
      child: Text(
        'Em Breve',
        style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white70),
      ),
    );
  }
}
