import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../models/postagem_agendada.dart';

class PostagensProvider extends ChangeNotifier {
  final Box<PostagemAgendada> _box = Hive.box<PostagemAgendada>('postagens');

  List<PostagemAgendada> get postagens => _box.values.toList();

  int get totalPostagens => _box.length;

  void adicionarPostagem(PostagemAgendada postagem) {
    _box.put(postagem.id, postagem);

    notifyListeners();
  }

  void atualizarPostagem(PostagemAgendada postagem) {
    _box.put(postagem.id, postagem);
    notifyListeners();
  }

  void removerPostagem(String id) {
    _box.delete(id);
    notifyListeners();
  }

  List<PostagemAgendada> obterPostagensPorData(DateTime data) {
    return postagens.where((postagem) {
      return _ehMesmaData(postagem.dataPublicacao, data);
    }).toList();
  }

  Map<String, List<PostagemAgendada>> agruparPostagensPorData() {
    final Map<String, List<PostagemAgendada>> grupos = {};

    for (final postagem in postagens) {
      final String dataFormatada = formatarDataGrupo(postagem.dataPublicacao);

      if (!grupos.containsKey(dataFormatada)) {
        grupos[dataFormatada] = [];
      }

      grupos[dataFormatada]!.add(postagem);
    }

    return grupos;
  }

  bool temPostagensParaData(DateTime data) {
    return postagens
        .any((postagem) => _ehMesmaData(postagem.dataPublicacao, data));
  }

  List<PostagemAgendada> obterProximasPostagens({int limite = 5}) {
    final DateTime agora = DateTime.now();

    return postagens
        .where((postagem) => postagem.dataPublicacao.isAfter(agora))
        .take(limite)
        .toList();
  }

  /// Verifica se duas datas são do mesmo dia
  bool _ehMesmaData(DateTime data1, DateTime data2) {
    return data1.year == data2.year &&
        data1.month == data2.month &&
        data1.day == data2.day;
  }

  /// Formata a data para usar como chave nos agrupamentos
  String formatarDataGrupo(DateTime data) {
    final DateTime hoje = DateTime.now();
    final DateTime amanha = hoje.add(const Duration(days: 1));

    if (_ehMesmaData(data, hoje)) {
      return 'Hoje';
    } else if (_ehMesmaData(data, amanha)) {
      return 'Amanhã';
    } else {
      return '${data.day.toString().padLeft(2, '0')}/'
          '${data.month.toString().padLeft(2, '0')}/'
          '${data.year}';
    }
  }

  /// Limpa todas as postagens (nao é usado no app, apenas para testes)
  void limparTodas() {
    _box.clear();
    notifyListeners();
    debugPrint('Todas as postagens foram removidas');
  }

  /// apenas para demonstração
  void inicializarComDadosMock() {
    if (_box.isNotEmpty) return;

    final DateTime hoje = DateTime.now();

    final List<PostagemAgendada> dadosMock = [
      PostagemAgendada(
        id: 'mock_1',
        titulo: 'Lorem ipsum dolor sit amet',
        descricao:
            'Aliquam ex arcu, dapibus ut congue at, dictum quis purus. Donec consectetur...',
        dataPublicacao: DateTime(hoje.year, hoje.month, 9, 14, 0),
        dataCriacao: hoje.subtract(const Duration(hours: 2)),
        mediaPaths: [],
      ),
      PostagemAgendada(
        id: 'mock_2',
        titulo: 'Etiam dui arcu, viverra non',
        descricao:
            'Aliquam erat volutpat. Aliquam dignissim felis non felis molestie, et gravida orci...',
        dataPublicacao: DateTime(hoje.year, hoje.month, 10, 19, 0),
        dataCriacao: hoje.subtract(const Duration(hours: 1)),
        mediaPaths: [],
      ),
      PostagemAgendada(
        id: 'mock_3',
        titulo: 'Dicas de produtividade',
        descricao:
            'Compartilhe suas melhores práticas para ser mais produtivo no trabalho.',
        dataPublicacao: hoje.add(const Duration(days: 1)),
        dataCriacao: hoje.subtract(const Duration(minutes: 30)),
        mediaPaths: [],
      ),
    ];

    for (final postagem in dadosMock) {
      _box.put(postagem.id, postagem);
    }
    notifyListeners();

    debugPrint('Dados mock inicializados: ${_box.length} postagens');
  }
}
