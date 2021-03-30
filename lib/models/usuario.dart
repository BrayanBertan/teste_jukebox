class Usuario {
  String id;
  String nome;
  String email;
  String senha;
  DateTime dataNascimento;

  Usuario(
      {this.id,
      this.nome = '',
      this.email = '',
      this.senha = '',
      this.dataNascimento});

  Map<String, dynamic> tojson() {
    print('aaa ${this.dataNascimento}');
    return {
      'nome': this.nome,
      'email': this.email,
      'senha': this.senha,
      'dataNascimento': this.dataNascimento == null
          ? '${DateTime.now()}'
          : '${this.dataNascimento}',
    };
  }

  factory Usuario.fromJson(Map json) {
    print(json['dataNascimento']);
    return Usuario(
      id: json['_id'],
      nome: json['nome'] ?? '',
      email: json['email'] ?? '',
      senha: json['senha'] ?? '',
      dataNascimento: json['dataNascimento'] != null
          ? DateTime.parse(json['dataNascimento'])
          : DateTime.now(),
    );
  }
}
