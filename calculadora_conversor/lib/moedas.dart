class Moeda {
  late String id;
  late String nome;
  late String pais;
  late String valorReal;

  //CONVERTE UM DOCUMENTO DO FIRESTORE EM UM OBJETO
  Moeda.fromJson(Map<String, dynamic> mapa, String id) {
    this.id = id;
    this.nome = mapa['nome'];
    this.pais = mapa['pais'];
    this.valorReal = mapa['valorReal'];
    
  }

  //CONVERTE UM OBJETO EM UM DOCUMENTO FIRESTORE
  Map<String, dynamic> toJSon() {
    return {
      'id': this.id,
      'nome': this.nome,
      'pais':this.pais,
      'valorReal':this.valorReal
    };
  }
}
