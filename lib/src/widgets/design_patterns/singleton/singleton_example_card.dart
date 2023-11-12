import 'package:appy/src/constants.dart';
import 'package:flutter/material.dart';

class SingletonExampleCard extends StatelessWidget {
  final String text;

  const SingletonExampleCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(Constants.large),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
