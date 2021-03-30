import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_jukebox/helpers/extensions.dart';
import 'package:teste_jukebox/models/usuario.dart';
import 'package:teste_jukebox/repositories/usuario_repository.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    usuarioRepository = Modular.get<UsuarioRepository>();
    loading = false;
  }

  UsuarioRepository usuarioRepository;
  Usuario usuario;

  @observable
  bool loading;

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @observable
  String senha;

  @action
  void setSenha(String value) => senha = value;

  @observable
  String loginError;

  @computed
  bool get emailValid => email != null && email.isEmailValid();

  @computed
  String get emailError {
    if (email == null || emailValid)
      return null;
    else
      return 'Email invalido';
  }

  @computed
  bool get senhaValid => senha != null && senha.length > 5;

  @computed
  bool get isFormValid => emailValid && senhaValid;

  @computed
  String get senhaError {
    if (senha == null || senhaValid)
      return null;
    else if (senha.trim().isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senha precisa ter pelo menos 6 caracteres';
  }

  @action
  Future<void> checkLogin(
      {@required VoidCallback onSucess, @required VoidCallback onFail}) async {
    print(senha);
    loading = true;
    try {
      usuario = await usuarioRepository.checkLogin(email, senha);
      print(usuario);

      if (usuario == null) {
        loginError = 'Credencias inválidas';
        onFail();
      } else {
        loginError = null;
        onSucess();
      }
    } catch (erro) {
      print(erro);
    }
    loading = false;
  }

  @action
  Future<void> changePassword(
      {@required VoidCallback onSucess, @required VoidCallback onFail}) async {
    loading = true;
    try {
      usuario = await usuarioRepository.checkEmail(email);

      if (usuario == null)
        onFail();
      else {
        usuario.senha = md5.convert(utf8.encode(senha)).toString();

        await usuarioRepository.putUsuario(usuario);
        senha = null;
        onSucess();
      }
    } catch (erro) {
      print(erro);
    }
    loading = false;
  }

  @action
  logout() => usuario = Usuario();
}
