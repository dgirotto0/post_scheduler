# Post Scheduler

Aplicativo Flutter para agendamento e gerenciamento de postagens em redes sociais.

## Sobre o Projeto

O Post Scheduler é uma aplicação mobile desenvolvida em Flutter que permite aos usuários criar, agendar e gerenciar postagens para redes sociais de forma organizada e eficiente.

## Funcionalidades

- Criação de postagens com título, descrição e seleção de mídias
- Agendamento de publicações com data e hora
- Visualização de postagens organizadas por calendário
- Filtro de postagens por data selecionada
- Edição e exclusão de postagens agendadas
- Interface responsiva para diferentes tamanhos de tela


## Tecnologias Utilizadas

- **Provider**: Gerenciamento de estado reativo
- **Hive**: Banco de dados NoSQL local para persistência
- **Image Picker**: Seleção de imagens da galeria e câmera
- **Table Calendar**: Componente de calendário interativo

## Estrutura do Projeto

```
lib/
├── src/
│   ├── models/
│   │   └── postagem_agendada.dart    # Modelo de dados
│   ├── providers/
│   │   └── postagens_provider.dart   # Gerenciamento de estado
│   └── screens/
│       ├── agendamento_screen.dart   # Tela de criação/edição
│       └── postagens_screen.dart     # Tela de visualização
└── main.dart                         
```

## Instalação e Execução

### Pré-requisitos
- Flutter SDK (versão 3.1.0 ou superior)
- Dart SDK
- Android Studio ou VS Code
- Dispositivo físico ou emulador Android/iOS

### Passos para Execução

1. **Clone o repositório**
```bash
git clone https://github.com/dgirotto0/post_scheduler.git
cd post_scheduler
```

2. **Instale as dependências**
```bash
flutter pub get
```

3. **Gere arquivos necessários**
```bash
flutter packages pub run build_runner build
```

4. **Execute a aplicação**
```bash
flutter run
```

## Arquitetura

### Padrão de Design
O projeto utiliza o padrão **Provider** para gerenciamento de estado. A arquitetura separa claramente as responsabilidades:

- **Models**: Definição das estruturas de dados
- **Providers**: Lógica de negócio e gerenciamento de estado
- **Screens**: Interface do usuário e interações

### Persistência de Dados
Utiliza o **Hive** como solução de banco de dados local, oferecendo:
- Performance otimizada para aplicações móveis
- Serialização automática de objetos Dart
- Operações síncronas e assíncronas
- Baixo consumo de memória

## Funcionalidades Detalhadas

### Tela Principal (HomeScreen)
- Contador de postagens agendadas
- Navegação rápida para criação de postagens
- Acesso à visualização de postagens existentes

### Tela de Agendamento (AgendamentoScreen)
- Seleção múltipla de mídias com preview
- Campos de texto com validação
- Seletores de data e horário estilo iOS
- Suporte para edição de postagens existentes

### Tela de Postagens (PostagensScreen)
- Calendário interativo com marcadores
- Lista filtrada por data selecionada
- Cards informativos para cada postagem
- Menu de ações (editar/excluir)

## Dependências de Desenvolvimento

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
  hive_generator: ^2.0.0
  build_runner: ^2.3.3
```

## Estrutura de Dados

### Modelo PostagemAgendada
```dart
class PostagemAgendada {
  String id;
  String titulo;
  String descricao;
  DateTime dataPublicacao;
  DateTime dataCriacao;
  List<String> mediaPaths;
}
```

## Contribuição

O projeto está aberto para contribuições. Para contribuir:

1. Faça um fork do projeto
2. Crie uma branch para sua feature
3. Implemente as mudanças seguindo os padrões do projeto
4. Execute os testes e análise estática
5. Submeta um pull request


## Licença

Este projeto está licenciado sob a Licença MIT. Consulte o arquivo LICENSE para mais detalhes.
