class AnotacaoModel {
  late String id;
  late String titulo;
  late String descricao;
  late bool concluido;

  AnotacaoModel(
    this.id,
    this.titulo,
    this.descricao,
    this.concluido,
  );

  AnotacaoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    concluido = json['concluido'] == 0 ? false : true;
  }

  Map<String, Object?> toJson() {
    final Map<String, Object?> data = new Map<String, Object?>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['concluido'] = this.concluido == false ? 0 : 1;
    return data;
  }
}
