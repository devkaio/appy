# Singleton

## Definição
Singleton é um padrão de projeto criacional que permite garantir que uma classe tenha apenas uma instância, fornecendo um ponto de acesso global a essa instância.

## Contexto
Geralmente queremos acessar um objeto que contenha o mesmo estado, independente de quem o chame. Ou seja, quando atribuímos um valor ao objeto inicialmente e gostaríamos de acessar os dados desse objeto no futuro. Um exemplo prático seria os dados de usuário após login.

Por um lado, poderíamos buscar essa informação sempre que necessário. Mas e se não for o caso e quiseremos esses dados disponíveis durante todo o ciclo do programa? Para isso, usamos o padrão Singleton.

Os programas em Dart geralmente são executados em um único núcleo (single thread)