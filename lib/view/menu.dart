import 'package:flutter/material.dart';
import 'package:projeto_1/model/listapedido.dart';

class Menuview extends StatelessWidget {

    final DynamicListStorage listStorage;
  
  const Menuview({super.key, required this.listStorage});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Image.asset(
                  'lib/images/logopizza.jpg',
                  width: 300,
                  height: 300,
                ),
              ),
              const SizedBox(height: 30),
              Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.restaurant,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                  title: const Text('Cardapio'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.pushNamed(context, '/cardapio');
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.shopping_cart,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                  title: const Text('Carrinho'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                     Navigator.pushNamed(context, '/pedido'); 
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 22),
                  minimumSize: const Size(200, 50),
                ),
                onPressed: () {
                  
                  listStorage.limpartudo();
                  
                  Navigator.pushNamed(context, '/login'); 
                },
                child: const Text('Sair'),
              ),
            ),
          ),
    );
  }
}
