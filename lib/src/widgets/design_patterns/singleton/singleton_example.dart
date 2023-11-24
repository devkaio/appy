import 'package:appy/src/constants.dart';
import 'package:appy/src/design_patterns/singleton/singleton.dart';
import 'package:appy/src/widgets/design_patterns/singleton/singleton_example_card.dart';
import 'package:appy/src/widgets/platform_button.dart';
import 'package:flutter/material.dart';

class SingletonExample extends StatefulWidget {
  const SingletonExample({super.key});

  @override
  State<SingletonExample> createState() => _SingletonExampleState();
}

class _SingletonExampleState extends State<SingletonExample> {
  final List<ExampleStateBase> stateList = [
    ExampleState(),
    ExampleStateByDefinition.getInstance(),
    ExampleStateWithoutSingleton(),
  ];

  void _setTextValues([String text = 'Singleton']) {
    setState(() {
      for (var state in stateList) {
        state.setStateText(text);
      }
    });
  }

  void _resetTextValues() {
    setState(() {
      for (var state in stateList) {
        state.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...stateList.map((e) => SingletonExampleCard(text: e.currentText)),
            const SizedBox(height: 16.0),
            PlatformButton(
              text: "Alterar o texto para 'Singleton'",
              onPressed: _setTextValues,
            ),
            PlatformButton(
              text: 'Resetar',
              onPressed: _resetTextValues,
            ),
            const SizedBox(
              height: Constants.extraLarge,
            ),
            const Text(
              "OBS: Altere o texto dos estados e navegue no aplicativo (por exemplo, vá para o menu principal e depois volte para este exemplo) para ver como o estado de Singleton se comporta!",
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
