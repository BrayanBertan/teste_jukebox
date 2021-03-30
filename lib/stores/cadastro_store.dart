import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_jukebox/helpers/extensions.dart';
import 'package:teste_jukebox/models/usuario.dart';
import 'package:teste_jukebox/repositories/usuario_repository.dart';
import 'package:teste_jukebox/stores/login_store.dart';

part 'cadastro_store.g.dart';

class CadastroStore = _CadastroStore with _$CadastroStore;

abstract class _CadastroStore with Store {
  _CadastroStore({this.usuario}) {
    usuarioRepository = Modular.get<UsuarioRepository>();
    loading = false;
    if (usuario != null) {
      nome = usuario.nome;
      email = usuario.email;
      dataNascimento = usuario.dataNascimento;
      senha = usuario.senha;
      senhaConfirmacao = usuario.senha;
    }
    emailExistenteError = null;
  }

  UsuarioRepository usuarioRepository;

  Usuario usuario;
  @observable
  bool loading;

  @observable
  String nome;

  @action
  void setNome(String value) => nome = value;

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @observable
  DateTime dataNascimento;

  @action
  void setDataNascimento(DateTime value) => dataNascimento = value;

  @observable
  String senha;

  @action
  void setSenha(String value) => senha = value;

  @observable
  String senhaConfirmacao;

  @action
  void setSenhaConfirmacao(String value) => senhaConfirmacao = value;

  @observable
  String emailExistenteError;

  @computed
  bool get nomeValid => nome != null && nome.length > 3;

  @computed
  bool get emailValid => email != null && email.isEmailValid();

  @computed
  bool get senhaValid => senha != null && senha.length > 5;

  @computed
  bool get senhaConfirmacaoValid =>
      senhaConfirmacao != null && senhaConfirmacao == senha;

  @computed
  String get nomeError {
    if (nome == null || nomeValid)
      return null;
    else if (nome.trim().isEmpty)
      return 'Campo obrigatório';
    else
      return 'nome invalido';
  }

  @computed
  String get emailError {
    if (email == null || emailValid)
      return null;
    else if (email.trim().isEmpty)
      return 'Campo obrigatório';
    else
      return 'Email invalido';
  }

  @computed
  String get senhaError {
    if (senha == null || senhaValid)
      return null;
    else if (senha.trim().isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senha invalida';
  }

  @computed
  String get senhaConfirmacaoError {
    if (senhaConfirmacao == null || senhaConfirmacaoValid)
      return null;
    else if (senhaConfirmacao.trim().isEmpty)
      return 'Campo obrigatório';
    else
      return 'As senhas são diferentes';
  }

  @computed
  bool get isFormValid =>
      nomeValid && senhaValid && senhaConfirmacaoValid && emailValid;

  @action
  Future<void> saveUsuario({VoidCallback onSucess, VoidCallback onFail}) async {
    loading = true;
    try {
      if (usuario == null) usuario = Usuario();
      usuario.nome = nome;
      usuario.email = email;
      usuario.senha = md5.convert(utf8.encode(senha)).toString();
      usuario.dataNascimento = dataNascimento;
      print('id ${usuario.id}');
      if (usuario.id == null) {
        final response = await usuarioRepository.checkEmail(usuario.email);

        if (response == null) {
          await usuarioRepository.postUsuario(usuario);
          Modular.get<LoginStore>().usuario = usuario;
          onSucess();
        } else
          onFail();
      } else {
        await usuarioRepository.putUsuario(usuario);
        Modular.get<LoginStore>().usuario = usuario;
        onSucess();
        onSucess();
      }
    } catch (erro) {
      print(erro);
    }
    loading = false;
  }

  void deleteUsuario(String id) async {
    print(id);
    try {
      await usuarioRepository.deleteUsuario(id);
    } catch (erro) {
      print(erro);
    }
  }
}
