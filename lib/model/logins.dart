class Login{

  //contatos
  
  final String email;
  final String senha;
  

  //construtor
  Login(
    this.email,
    this.senha,
  );

  static List<Login> gerarDados() {
        List<Login> lista = [];
    lista.add(Login('joao@email.com','aluno123'));
    lista.add(Login('maria@email.com','aluna123'));
    
    return lista;
}
}