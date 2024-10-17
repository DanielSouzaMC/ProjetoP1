import 'package:flutter/material.dart';
import 'package:projeto_1/model/logins.dart';
import 'package:projeto_1/view/components/campo_texto.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  String? errorMessage;

  late ListaCadastroManual listStorage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    listStorage = ModalRoute.of(context)?.settings.arguments as ListaCadastroManual? ??
        ListaCadastroManual();
  }

  void criarConta() {
    String email = txtEmail.text.trim();
    String senha = txtSenha.text.trim();

    if (email.isEmpty || senha.isEmpty) {
      setState(() {
        errorMessage = "Erro: Preencha todos os campos.";
      });
      return;
    }

    bool usuarioExiste = Login.gerarDados()
        .any((usuario) => usuario.email == email) ||
        listStorage.obterItens().any((usuario) => usuario.email == email);

    setState(() {
      if (usuarioExiste) {
        errorMessage = "Erro: Usuário já existe.";
      } else {
        Login novoUsuario = Login(email, senha);
        listStorage.adicionaItem(novoUsuario);
        errorMessage = "Usuário criado com sucesso!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Criar conta',
          style: TextStyle(fontSize: 20),
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
                const SizedBox(height: 30),
                criarCampoTexto('Insira e-mail', txtEmail, obscureText: false),
                const SizedBox(height: 30),
                criarCampoTexto('Insira a senha', txtSenha, obscureText: true),
                const SizedBox(height: 30),
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
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
                      onPressed: criarConta,
                      child: const Text('CRIAR CONTA'),
                    ),
                  ),
                ),
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
                      onPressed: () {
                        Navigator.pushNamed(context,'/login',arguments: listStorage);},
                        child: const Text('Voltar'),
                    ),
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
