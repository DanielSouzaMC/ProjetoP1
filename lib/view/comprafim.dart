import 'package:flutter/material.dart';
import 'package:projeto_1/model/listapedido.dart';

class ComprafinalView extends StatefulWidget {
  const ComprafinalView({super.key});

  @override
  State<ComprafinalView> createState() => _ComprafinalViewState();
}

class _ComprafinalViewState extends State<ComprafinalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                SizedBox(
                  width: double.infinity,
                  child: Text('Obrigado pela compra!',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center),
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
                        child: const Text('Fazer outra Compra')),
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
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text('Logar com outra conta')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
