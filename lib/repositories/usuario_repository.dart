import 'package:dio/dio.dart';
import 'package:teste_jukebox/models/usuario.dart';

class UsuarioRepository {
  static const String _BASE_URL = "https://crudcrud.com/api";
  static const String HASH = "4d75bd94be32484187b209b07fc05966";
  static const String TABELA = "usuarios";

  Future<List<Usuario>> getAllUsuarios() async {
    String endpoint = '$_BASE_URL/$HASH/$TABELA';

    print(endpoint);
    try {
      final response = await Dio().get(endpoint);
      return response.data.map<Usuario>((usuario) {
        return Usuario.fromJson(usuario);
      }).toList();
    } on DioError {
      return Future.error('Erro ao retornar os usuarios');
    }
  }

  Future<void> postUsuario(Usuario usuario) async {
    String endpoint = '$_BASE_URL/$HASH/$TABELA';
    print(endpoint);
    try {
      final response = await Dio().post(endpoint, data: usuario.tojson());
    } on DioError {
      return Future.error('Erro ao salvar usuario');
    }
  }

  Future<void> putUsuario(Usuario usuario) async {
    String endpoint = '$_BASE_URL/$HASH/$TABELA';
    try {
      final response = await Dio().put(endpoint, data: usuario.tojson());
    } on DioError {
      return Future.error('Erro ao atualizar usuario');
    }
  }
}
