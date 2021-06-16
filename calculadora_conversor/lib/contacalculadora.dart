class Contacalculadora {
  late String id;
  late double num1;
  late double num2;
  late double resultado;
  late String op;

  //CONVERTE UM DOCUMENTO DO FIRESTORE EM UM OBJETO
  Contacalculadora.fromJson(Map<String, dynamic> mapa, String id) {
    this.id = id;
    this.num1 = mapa['num1'];
    this.num2 = mapa['num2'];
    this.op = mapa['op'];
    this.resultado = mapa['resultado'];
  }

  //CONVERTE UM OBJETO EM UM DOCUMENTO FIRESTORE
  Map<String, dynamic> toJSon() {
    return {
      'id': this.id,
      'num1': this.num1,
      'num2': this.num2,
      'op':this.op,
      'resultado': this.resultado
    };
  }
}
