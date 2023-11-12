import 'example_state_base.dart';

final class ExampleState extends ExampleStateBase {
  static final ExampleState _instance = ExampleState._internal();

  ExampleState._internal() {
    initialText = "Uma nova instância de 'ExampleState' foi criada.";
    stateText = initialText;
  }

  factory ExampleState() {
    return _instance;
  }
}

final class ExampleStateByDefinition extends ExampleStateBase {
  static ExampleStateByDefinition? _instance;

  ExampleStateByDefinition._internal() {
    initialText =
        "Uma nova instância de 'ExampleStateByDefinition' foi criada.";
    stateText = initialText;
  }

  static ExampleStateByDefinition getInstance() {
    return _instance ??= ExampleStateByDefinition._internal();
  }
}

final class ExampleStateWithoutSingleton extends ExampleStateBase {
  ExampleStateWithoutSingleton() {
    initialText =
        "Uma nova instância de 'ExampleStateWithoutSingleton' foi criada.";
    stateText = initialText;
  }
}
