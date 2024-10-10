import 'package:flutter/material.dart';
import 'package:projeto_1/model/listapedido.dart';
import 'package:projeto_1/model/sabores.dart';

class PedidoView extends StatelessWidget {
  final DynamicListStorage listStorage;

  const PedidoView({super.key, required this.listStorage});

  @override
  Widget build(BuildContext context) {
    
    final List<Sabores> listaPedidos = listStorage.getItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pedido',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
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
                listaPedidos.isEmpty ? const Center(
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                               child: Icon(
                                  Icons.shopping_cart,
                                  size: 24,
                                  color: Colors.black,
                                )
                            ),
                            title: Text('Não ha pedidos'),
                          )
                        )
                  )
                  :
                        ListView.builder(
                        itemCount: listaPedidos.length,
                        itemBuilder: (context, index) {
                          final sabor = listaPedidos[index];
                          return Card(
                            child: ListTile(
                              leading: const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.local_pizza,
                                  size: 24,
                                  color: Colors.black,
                                ),
                              ),
                              title: Text(
                                sabor.nome, 
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Arial',
                                ),
                              ),
                              subtitle: Text(
                                sabor.valor,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Arial',
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 22),
                          minimumSize: const Size(150, 50), 
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/cardapio');
                        },
                        child: const Text('Cardápio'),
                        ),
                       ElevatedButton(
                         style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(fontSize: 22),
                            minimumSize: const Size(150, 50), 
                          ),
                          onPressed: () {},
                          child: const Text('Comprar'),
                        ),
                     ],
                  ),
               ),
            ),
        ],
      ),
    );
  }
}
