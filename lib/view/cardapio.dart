import 'package:flutter/material.dart';
import 'package:projeto_1/model/sabores.dart';

class Cardapioview extends StatelessWidget {
  const Cardapioview({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Sabores> sabores = Sabores.gerarDados();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cardápio de Pizzas',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        ),
        centerTitle: true,
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

          ListView.builder(
            itemCount: sabores.length,
            itemBuilder: (context, index) {
              final sabor = sabores[index];
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
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    var pizzadetalhe = sabores[index];
                    Navigator.pushNamed(context, '/detalhes',arguments: pizzadetalhe);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


