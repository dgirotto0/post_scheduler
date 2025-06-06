import 'package:hive/hive.dart';

part 'postagem_agendada.g.dart';

/// Modelo que representa uma postagem agendada
///
/// Contém todas as informações necessárias para uma postagem
/// que foi agendada para publicação futura.
@HiveType(typeId: 0)
class PostagemAgendada extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String titulo;
  @HiveField(2)
  String descricao;
  @HiveField(3)
  DateTime dataPublicacao;
  @HiveField(4)
  DateTime dataCriacao;
  @HiveField(5)
  List<String> mediaPaths; // caminhos locais

  PostagemAgendada({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.dataPublicacao,
    required this.dataCriacao,
    required this.mediaPaths,
  });

  /// Cria uma nova postagem agendada com ID único baseado no timestamp
  factory PostagemAgendada.criar({
    required String titulo,
    required String descricao,
    required DateTime dataPublicacao,
    List<String>? mediaPaths,
  }) {
    final agora = DateTime.now();
    return PostagemAgendada(
      id: agora.millisecondsSinceEpoch.toString(),
      titulo: titulo,
      descricao: descricao,
      dataPublicacao: dataPublicacao,
      dataCriacao: agora,
      mediaPaths: mediaPaths ?? [],
    );
  }
}
