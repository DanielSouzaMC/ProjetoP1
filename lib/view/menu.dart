import 'package:flutter/material.dart';

class Menuview extends StatelessWidget {
  const Menuview({super.key});

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
    );
  }
}
