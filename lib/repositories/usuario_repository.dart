import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:teste_jukebox/models/usuario.dart';

class UsuarioRepository {
  static const String _BASE_URL = "https://crudcrud.com/api";
  static String hash = "4d75bd94be32484187b209b07fc05966";
  static const String TABELA = "usuarios";

  Future<List<Usuario>> getAllUsuarios() async {
    String endpoint = '$_BASE_URL/$hash/$TABELA';

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
    String endpoint = '$_BASE_URL/$hash/$TABELA';
    print(endpoint);
    try {
      final response = await Dio().post(endpoint, data: usuario.tojson());
    } on DioError {
      return Future.error('Erro ao salvar usuario');
    }
  }

  Future<void> putUsuario(Usuario usuario) async {
    String endpoint = '$_BASE_URL/$hash/$TABELA/${usuario.id}';
    try {
      final response = await Dio().put(endpoint, data: usuario.tojson());
    } on DioError {
      return Future.error('Erro ao atualizar usuario');
    }
  }

  Future<void> deleteUsuario(String id) async {
    String endpoint = '$_BASE_URL/$hash/$TABELA/$id';
    try {
      final response = await Dio().delete(endpoint);
    } on DioError {
      return Future.error('Erro ao deletar usuario');
    }
  }

  Future<Usuario> checkLogin(String email, String senha) async {
    List<Usuario> response = await getAllUsuarios();
    final usuarios = response.where((usuario) =>
        usuario.email == email &&
        usuario.senha == md5.convert(utf8.encode(senha)).toString());
    if (usuarios.length > 0)
      return usuarios.first;
    else
      return null;
  }

  Future<Usuario> checkEmail(String email) async {
    List<Usuario> response = await getAllUsuarios();
    final usuarios = response.where((usuario) => usuario.email == email);
    if (usuarios.length > 0)
      return usuarios.first;
    else
      return null;
  }
}
