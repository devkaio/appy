# Singleton

## Definição
Singleton é um padrão de projeto criacional que permite garantir que uma classe tenha apenas uma instância, fornecendo um ponto de acesso global a essa instância.

## Contexto
Geralmente queremos acessar um objeto que contenha o mesmo estado, independente de quem o chame. Ou seja, quando atribuímos um valor ao objeto inicialmente e gostaríamos de acessar os dados desse objeto no futuro. Um exemplo prático seria o de buscar os dados de usuário após login.

Por um lado, poderíamos buscar essa informação sempre que necessário. Mas e se não for o caso e quiseremos esses dados disponíveis durante todo o ciclo do programa? Para isso, usamos o padrão Singleton.

## Aplicabilidade

Considere utilizar este padrão quando a instanciação de uma classe pode ser custosa, como é o caso de carregar dados de uma fonte externa ou mesmo interna como um banco de dados. Além diso, esse padrão permite que você acesse a mesma instância sempre que precisar. Por exemplo um Logger.

## Implmentação

### ExampleStateBase

Pelo fato de utilizarmos várias implementações, vamos nos beneficiar da herança para criar uma classe base que irá passar informações necessárias para outras classes.

Nessa classe base estão o texto inicial que será exibido na tela e outra propriedade que será responsável pela alteração de estado do texto durante o ciclo do programa.

Marcamos essas propriedades com a anotação @protected para evitar acessá-las diretamente e para isso usaremos suas classes derivadas.

Dart ainda não oferece a visibilidade protegida de propriedades por isso anotamos para que aparece uma informação no linter caso tentemos realizar o acesso indevido.

```dart
base class ExampleStateBase {
  @protected
  late String initialText;
  @protected
  late String stateText;

  String get currentText => '$stateText\nHashcode: $hashCode';

  void setStateText(String text) => stateText = text;

  void reset() {
    stateText = initialText;
  }
}
```

### ExampleStateByDefinition

Para estar de acordo com o padrão, nossa classe deverá estender de ExampleStateBase para ter acesso às suas propriedades stateText e initialText, além de seus métodos.

Para implementar o padrão por definição, a classe `ExampleStateByDefinition` deverá gerenciar a criação do objeto a partir da atribuição da variável estática e o acesso a essa instância se dará por meio do método estático `getState()`.

```dart
  static ExampleStateByDefinition? _instance;

  ExampleStateByDefinition._internal() {
    initialText =
        "Uma nova instância de 'ExampleStateByDefinition' foi criada.";
    stateText = initialText;
  }

  static ExampleStateByDefinition getInstance() {
    return _instance ??= ExampleStateByDefinition._internal();
  }
```

### Implementação de Singleton com construtor factory

Em Dart é possível criar objetos constantes a partir de construtores factory. A classe `ExampleState` implementará o padrão usando esse construtor. Dessa forma, não precisamos utilizar o método `getState()` para acessar a instância. Com esse construtor ainda será possível acessar o mesmo objeto da mesma maneira padrão.

```dart
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
```

### ExampleStateWithoutSingleton

Trata-se de uma implementação padrão para entendimento do tema.

```dart
final class ExampleStateWithoutSingleton extends ExampleStateBase {
  ExampleStateWithoutSingleton() {
    initialText =
        "Uma nova instância de 'ExampleStateWithoutSingleton' foi criada.";
    stateText = initialText;
  }
}
```

### Exemplo

O exemplo completo utiliza as três implementações do estado:

```dart
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
```