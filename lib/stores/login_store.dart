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
  Function get isFormValid => emailValid ? checkLogin : null;

  @action
  Future<void> checkLogin() async {
    try {
      usuario = await usuarioRepository.checkLogin(email, senha);
      print(usuario);
      if (usuario == null) loginError = 'Credencias inválidas';
    } catch (erro) {
      print(erro);
    }
  }
}
