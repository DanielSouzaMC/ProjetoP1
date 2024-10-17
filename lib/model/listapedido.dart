import 'package:projeto_1/model/sabores.dart';

class Listapedidos {
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

  void removepedido(Sabores item){
    _listaPedidos.remove(item);
  }

  void limpartudo(){
    _listaPedidos.clear();
  }
}
