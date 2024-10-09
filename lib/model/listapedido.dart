import 'package:projeto_1/model/sabores.dart';

class DynamicListStorage {
  final List<Sabores> _listaPedidos = [];

  void adicionaitem(Sabores item) {
    _listaPedidos.add(item);
  }

  List<Sabores> getItems() {
    return List.unmodifiable(_listaPedidos);
  }

  bool vazia() {
    return _listaPedidos.isEmpty;
  }
}
