import 'package:flutter/material.dart';

import '../../../constants.dart';

class MainMenuHeader extends StatelessWidget {
  const MainMenuHeader({Key? key}) : super(key: key);

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
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: Constants.medium,
          ),
          Text(
            "Criado com Flutter",
            style: Theme.of(context).textTheme.headline5,
          )
        ],
      ),
    );
  }
}
