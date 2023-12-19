class LembrolModelo {
  String id;
  String nome;
  String atividade;
  String contexto;

  String? urlimagem;

  LembrolModelo(
      {required this.id,
      required this.nome,
      required this.atividade,
      required this.contexto});

  LembrolModelo.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        nome = map["nome"],
        atividade = map["atividade"],
        contexto = map["contexto"],
        urlimagem = map["urlimagem"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "atividade": atividade,
      "contexto": contexto,
      "urlimagem": urlimagem,
    };
  }
}
