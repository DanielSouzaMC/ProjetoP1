import 'package:flutter/material.dart';
import 'package:projeto_1/model/listapedido.dart';
import 'package:projeto_1/model/sabores.dart';

class PedidoView extends StatefulWidget {
  final DynamicListStorage listStorage;

  const PedidoView({super.key, required this.listStorage});

  @override
  _PedidoViewState createState() => _PedidoViewState();
}

class _PedidoViewState extends State<PedidoView> {
  late List<Sabores> listaPedidos;
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    listaPedidos = widget.listStorage.getItems();
    _calculaTotal(); 
  }

  void _calculaTotal() {
    setState(() {
      total = listaPedidos.fold(0.0, (soma, item) {
        String valorFormatado = item.valor.replaceAll('R\$ ', '').replaceAll(',', '.');
        return soma + double.parse(valorFormatado);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                listaPedidos.isEmpty
                    ? const Center(
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.shopping_cart,
                                  size: 24,
                                  color: Colors.black,
                                )),
                            title: Text('Não há pedidos'),
                          ),
                        ),
                      )
                    : ListView.builder(
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
                              trailing: const Icon(Icons.delete_forever_sharp),
                              onTap: () {                                
                                setState(() {
                                  widget.listStorage.removepedido(sabor);
                                  listaPedidos = widget.listStorage.getItems();
                                  _calculaTotal(); 
                                });
                              },
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [                
                Text(
                  'Total: R\$ ${total.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 16),
                SizedBox(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
