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
  Function get isFormValid => emailValid && senhaValid ? checkLogin : null;

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
      print(usuario);

      if (usuario == null)
        onFail();
      else {
        await usuarioRepository.putUsuario(usuario);
        senha = null;
        onSucess();
      }
    } catch (erro) {
      print(erro);
    }
    loading = false;
  }
}
