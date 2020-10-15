class Conversion {
  double _dolar = 0.00025893;
  double _euro = 0.00022051;
  double _yen = 0.02729258;
  double pesosDolar(double pesos) {
    return pesos * _dolar;
  }

  double pesosEuro(double pesos) {
    return pesos * _euro;
  }

  double pesosYen(double pesos) {
    return pesos * _yen;
  }
}
