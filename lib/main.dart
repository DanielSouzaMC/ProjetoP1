import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:projeto_1/model/listapedido.dart';
import 'package:projeto_1/view/Item.dart';
import 'package:projeto_1/view/cadastro.dart';
import 'package:projeto_1/view/cardapio.dart';
import 'package:projeto_1/view/detalhes.dart';
import 'package:projeto_1/view/login.dart';
import 'package:projeto_1/view/menu.dart';
import 'package:projeto_1/view/pedido.dart';
import 'package:projeto_1/view/recuperacao.dart';
import 'package:projeto_1/view/comprafim.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final Listapedidos listStorage = Listapedidos();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/item': (context) => const Itemview(),
        '/login': (context) => const Loginview(),
        '/recuperacao': (context) => const RecuperacaoView(),
        '/cardapio': (context) => Cardapioview(listStorage: listStorage),
        '/pedido': (context) => PedidoView(listStorage: listStorage),
        '/menu': (context) => Menuview(listStorage: listStorage),
        '/detalhes': (context) => const DetalhesView(),
        '/cadastro': (context) => Cadastro(),
        '/comprafim': (context) => ComprafinalView(),
      },
    );
  }
}
