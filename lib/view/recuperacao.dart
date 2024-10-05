import 'package:flutter/material.dart';
import 'package:projeto_1/model/logins.dart';

import 'components/campo_texto.dart';

class RecuperacaoView extends StatefulWidget {
  const RecuperacaoView({super.key});

  @override
  State<RecuperacaoView> createState() => _RecuperacaoView();
}

class _RecuperacaoView extends State<RecuperacaoView> {
  var txtEmail = TextEditingController();

  String? errorMessage;

  void login() {
    String email = txtEmail.text.trim();

    List<Login> usuarios = Login.gerarDados();

    try {
      Login usuarioEncontrado = usuarios.firstWhere(
        (usuario) => usuario.email == email,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Usuário encontrado\nE-mail: ${usuarioEncontrado.email}\nSenha: ${usuarioEncontrado.senha}"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Erro: E-mail digitado Incorreto!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
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
                const SizedBox(height: 30),
                criarCampoTexto(
                  'Insira seu e-mail',
                  txtEmail,
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
                      onPressed: login, //
                      child: const Text('Verificar'),
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
                        Navigator.popAndPushNamed(context, '/login');
                      },
                      child: const Text('Voltar'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
