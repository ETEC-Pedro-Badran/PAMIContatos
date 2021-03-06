class Contato {
  int? _id;
  String? _nome;
  String? _email;
  String? _telefone;
  String? _imagem;
  //método construtor
  Contato();

  get id => _id;
  get nome => _nome;
  get email => _email;
  get telefone => _telefone;

  get imagem => _imagem;

  set nome(value) => _nome = value;
  set email(value) => _email = value;
  set telefone(value) => _telefone = value;
  set imagem(value) => _imagem = value;

  //método construtor em sobrecarga
  Contato.fromMap(Map map) {
    _id = map['id'];
    _nome = map['nome'];
    _email = map['email'];
    _telefone = map['telefone'];
    _imagem = map['imagem'];
  }

  //método que converte um contato para um Map
  toMap() {
    return {
      'id': _id,
      'nome': _nome,
      'email': _email,
      'telefone': _telefone,
      'imagem': _imagem
    };
  }

  //método que irá converter um contato em um String
  @override
  toString() {
    return "$_nome - $_telefone - $_email";
  }
}
