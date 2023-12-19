class LembrancaModelo {
  String id;
  String lembranca;
  String data;

  LembrancaModelo(
      {required this.id, required this.lembranca, required this.data});

  LembrancaModelo.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        lembranca = map["lembranca"],
        data = map["data"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "lembranca": lembranca,
      "data": data,
    };
  }
}
