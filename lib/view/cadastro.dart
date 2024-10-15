import 'package:flutter/material.dart';
import 'package:projeto_1/view/components/campo_texto.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar conta',
          style: TextStyle(
            fontSize: 20),
          ),
        centerTitle: true,
      ),
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
                  SizedBox(height: 30),
                  criarCampoTexto('Insira e-mail', txtEmail,obscureText: false),
                  SizedBox(height: 30),
                  criarCampoTexto('Insira a senha', txtSenha,obscureText: false),

                SizedBox( height: 30),

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
                        onPressed: () {},
                        child: const Text('CRIAR CONTA')),
                  ),
                ),
                SizedBox(height: 15),

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
                        child: const Text('Voltar')),
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