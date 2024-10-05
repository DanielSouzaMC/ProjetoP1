import 'package:flutter/material.dart';


class Cadastroview extends StatelessWidget{
  const Cadastroview({super.key});

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
            ],
          ),
        ),
      ),
      
    );
    
  }
}