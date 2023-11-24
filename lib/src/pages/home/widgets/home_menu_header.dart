import 'package:flutter/material.dart';

import '../../../constants.dart';

class MainMenuHeader extends StatelessWidget {
  const MainMenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: Constants.large,
      ),
      child: Column(
        children: [
          Text(
            "APPY",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: Constants.medium,
          ),
          Text(
            "Feito com Flutter",
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
