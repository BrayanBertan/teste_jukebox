import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_jukebox/models/usuario.dart';

class UsuarioRepository {
  static const String _BASE_URL = "https://crudcrud.com/api";
  static String hash;
  static const String TABELA = "usuarios";

  void setHash(String hash) {
    if (kIsWeb) {
      hash = 'cb8daa2b074b41aa95fc6978f6926b24';
      return;
    }
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('hash', hash);
    });
  }

  void getHash() {
    if (kIsWeb) {
      hash = 'cb8daa2b074b41aa95fc6978f6926b24';
      return;
    }
    SharedPreferences.getInstance().then((prefs) {
      if (prefs.containsKey('hash'))
        hash = prefs.getString('hash');
      else {
        hash = 'cb8daa2b074b41aa95fc6978f6926b24';
        setHash(hash);
      }
    });
  }

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
    print(usuario.senha);
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
    print(endpoint);
    try {
      final response = await Dio().put(endpoint, data: usuario.tojson());
    } on DioError {
      return Future.error('Erro ao atualizar usuario');
    }
  }

  Future<void> deleteUsuario(String id) async {
    print(id);
    String endpoint = '$_BASE_URL/$hash/$TABELA/${id.trim()}';
    try {
      final response = await Dio().delete(endpoint);
    } on DioError {
      return Future.error('Erro ao deletar usuario');
    }
  }

  Future<Usuario> checkLogin(String email, String senha) async {
    List<Usuario> response = await getAllUsuarios();
    final usuarios = response.where((usuario) =>
        usuario.email.trim() == email.trim() &&
        usuario.senha.trim() == md5.convert(utf8.encode(senha)).toString());
    if (usuarios.length > 0)
      return usuarios.first;
    else
      return null;
  }

  Future<Usuario> checkEmail(String email) async {
    List<Usuario> response = await getAllUsuarios();
    final usuarios = response.where((usuario) => usuario.email == email.trim());
    if (usuarios.length > 0)
      return usuarios.first;
    else
      return null;
  }
}
