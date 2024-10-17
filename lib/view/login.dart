import 'package:flutter/material.dart';
import 'package:projeto_1/model/logins.dart';
import 'components/campo_texto.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _Loginview();
}

class _Loginview extends State<Loginview> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  String? errorMessage;

  ListaCadastroManual listStorage = ListaCadastroManual();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments as ListaCadastroManual?;
    if (args != null) {
      listStorage = args;
    }
  }

  void login() {
    String email = txtEmail.text.trim();
    String senha = txtSenha.text.trim();

    if (email.isEmpty || senha.isEmpty) {
      setState(() {
        errorMessage = "Erro: Preencha todos os campos.";
      });
      return;
    }

    List<Login> usuariosEstaticos = Login.gerarDados();
    List<Login> usuariosDinamicos = listStorage.obterItens();

    bool usuarioEncontrado = usuariosEstaticos.any((usuario) =>
            usuario.email == email && usuario.senha == senha) ||
        usuariosDinamicos.any(
            (usuario) => usuario.email == email && usuario.senha == senha);

    setState(() {
      if (usuarioEncontrado) {
        errorMessage = null;
        Navigator.pushNamed(context, '/menu');
      } else {
        errorMessage = "Erro: E-mail ou senha incorretos.";
      }
    });
  }

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
                const SizedBox(height: 30),
                const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Login:",
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.left,
                    )),
                criarCampoTexto(
                  'E-mail',
                  txtEmail,
                  obscureText: false,
                ),
                const SizedBox(height: 15),
                criarCampoTexto('Senha', txtSenha, obscureText: true),
                SizedBox(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/recuperacao');
                          },
                          child: const Text('Esqueceu Senha ?')),
                    )),
                const SizedBox(height: 15),
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
                      onPressed: login,
                      child: const Text('LOGIN'),
                    ),
                  ),
                ),
                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red),
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
                          Navigator.pushNamed(context, '/cadastro');
                        },
                        child: const Text('CRIAR CONTA')),
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
