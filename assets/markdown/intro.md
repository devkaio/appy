# Exemplo de Markdown
O Markdown permite que você inclua facilmente texto formatado, imagens e até mesmo código Dart formatado em seu aplicativo.

## Stilos e formatação

Estilos de texto _italico_, __negrito__, or `codigo inline` .

* Use listas ou topicos
* para auxiliar e organizar
* suas ideias

## Links

É possível usar [hiperlinks](hyperlink) no markdown

## Widget Markdown

Esse é um exemplo de como criar o seu próprio widget de markdown:
    Markdown(data: 'Hello _world_!'); 

## Blocos de código

Código em Dart formatado fica bem da hora:

```dart
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Markdown(data: markdownData)
    )
  ));
}
```

Bons estudos!