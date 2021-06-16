class Contaconversor {
  late String id;
  late double numreal;
  late String moedanova;
  late double resconvertido;

  //CONVERTE UM DOCUMENTO DO FIRESTORE EM UM OBJETO
  Contaconversor.fromJson(Map<String, dynamic> mapa, String id) {
    this.id = id;
    this.numreal = mapa['numreal'];
    this.moedanova = mapa['moedanova'];
    this.resconvertido = mapa['resconvertido'];
  }

  //CONVERTE UM OBJETO EM UM DOCUMENTO FIRESTORE
  Map<String, dynamic> toJSon() {
    return {
      'id': this.id,
      'numreal': this.numreal,
      'moedanova': this.moedanova,
      'resconvertido': this.resconvertido
    };
  }
}
