import 'package:flutter/material.dart';
import 'package:projeto_1/model/sabores.dart';
import 'package:projeto_1/model/listapedido.dart';
import 'package:projeto_1/view/pedido.dart';

class DetalhesView extends StatelessWidget {
  const DetalhesView({super.key});

  @override
  Widget build(BuildContext context) {
   
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final Sabores dados = arguments['sabor'] as Sabores;
    final Listapedidos listStorage =
        arguments['listStorage'] as Listapedidos;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cardápio',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/logopizza.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Image.asset(
                    dados.foto,
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 30),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: const Icon(Icons.local_pizza),
                    title: const Text(
                      'Sabor',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      dados.nome,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: const Icon(Icons.restaurant_outlined),
                    title: const Text(
                      'Ingredientes',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      dados.ingredientes,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: const Icon(Icons.attach_money),
                    title: const Text(
                      'Valor',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      dados.valor,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 500,
                  child: Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 22),
                          minimumSize: const Size(200, 50),
                        ),
                        onPressed: () {
                          listStorage.adicionaitem(dados);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PedidoView(listStorage: listStorage),
                            ),
                          );
                        },
                        child: const Text('Adicionar ao Carrinho')),
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: 500,
                  child: Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 22),
                          minimumSize: const Size(200, 50),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/cardapio');
                        },
                        child: const Text('Voltar pro cardapio')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
