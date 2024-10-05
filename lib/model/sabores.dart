class Sabores {
  final String codigo;
  final String nome;
  final String ingredientes;
  final String valor;
  final String foto;

  Sabores(
    this.codigo, 
    this.nome, 
    this.ingredientes, 
    this.valor,
    this.foto,
  );

  static List<Sabores> gerarDados() {
    return [
      Sabores('01', 'Margherita', 'Tomate, Mussarela, Manjericão', 'R\$ 30,00','lib/images/margherita.jpeg'),
      Sabores('02', 'Pepperoni', 'Pepperoni, Mussarela, Molho de Tomate', 'R\$ 35,00','lib/images/pepperoni.jpg'),
      Sabores('03', 'Quatro Queijos', 'Mussarela, Parmesão, Gorgonzola, Catupiry', 'R\$ 40,00','lib/images/pizza_quatro_queijos.jpg'),
      Sabores('04', 'Calabresa', 'Calabresa, Cebola, Azeitona, Mussarela', 'R\$ 32,00','lib/images/pizza_calabresa.png'),
      Sabores('05', 'Frango com Catupiry', 'Frango desfiado, Catupiry, Mussarela', 'R\$ 38,00','lib/images/pizza_frango_catupiry.jpeg'),
      Sabores('06', 'Portuguesa', 'Presunto, Ovo, Cebola, Azeitona, Mussarela', 'R\$ 42,00','lib/images/pizza_portuguesa.jpeg'),
      Sabores('07', 'Napolitana', 'Tomate, Alho, Azeitona, Mussarela', 'R\$ 33,00','lib/images/pizza_napolitana.jpeg'),
      Sabores('08', 'Toscana', 'Calabresa, Pimentão, Azeitona, Cebola', 'R\$ 36,00','lib/images/pizza_napolitana.jpeg'),
      Sabores('09', 'Vegetariana', 'Tomate, Cebola, Pimentão, Champignon, Brócolis', 'R\$ 39,00','lib/images/pizza-vegetariana.jpg'),
      Sabores('10', 'Atum', 'Atum, Cebola, Azeitona, Mussarela', 'R\$ 41,00','lib/images/pizza_atum.jpeg'),
    ];
  }
}