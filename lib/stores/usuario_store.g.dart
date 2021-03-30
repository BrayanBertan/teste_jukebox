// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsuarioStore on _UsuarioStore, Store {
  Computed<bool> _$nomeValidComputed;

  @override
  bool get nomeValid =>
      (_$nomeValidComputed ??= Computed<bool>(() => super.nomeValid,
              name: '_UsuarioStore.nomeValid'))
          .value;
  Computed<bool> _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_UsuarioStore.emailValid'))
          .value;
  Computed<bool> _$senhaValidComputed;

  @override
  bool get senhaValid =>
      (_$senhaValidComputed ??= Computed<bool>(() => super.senhaValid,
              name: '_UsuarioStore.senhaValid'))
          .value;
  Computed<bool> _$senhaConfirmacaoValidComputed;

  @override
  bool get senhaConfirmacaoValid => (_$senhaConfirmacaoValidComputed ??=
          Computed<bool>(() => super.senhaConfirmacaoValid,
              name: '_UsuarioStore.senhaConfirmacaoValid'))
      .value;
  Computed<String> _$nomeErrorComputed;

  @override
  String get nomeError =>
      (_$nomeErrorComputed ??= Computed<String>(() => super.nomeError,
              name: '_UsuarioStore.nomeError'))
          .value;
  Computed<String> _$emailErrorComputed;

  @override
  String get emailError =>
      (_$emailErrorComputed ??= Computed<String>(() => super.emailError,
              name: '_UsuarioStore.emailError'))
          .value;
  Computed<String> _$senhaErrorComputed;

  @override
  String get senhaError =>
      (_$senhaErrorComputed ??= Computed<String>(() => super.senhaError,
              name: '_UsuarioStore.senhaError'))
          .value;
  Computed<String> _$senhaConfirmacaoErrorComputed;

  @override
  String get senhaConfirmacaoError => (_$senhaConfirmacaoErrorComputed ??=
          Computed<String>(() => super.senhaConfirmacaoError,
              name: '_UsuarioStore.senhaConfirmacaoError'))
      .value;
  Computed<Function> _$isFormValidComputed;

  @override
  Function get isFormValid =>
      (_$isFormValidComputed ??= Computed<Function>(() => super.isFormValid,
              name: '_UsuarioStore.isFormValid'))
          .value;

  final _$loadingAtom = Atom(name: '_UsuarioStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$usuarioListAtom = Atom(name: '_UsuarioStore.usuarioList');

  @override
  ObservableList<Usuario> get usuarioList {
    _$usuarioListAtom.reportRead();
    return super.usuarioList;
  }

  @override
  set usuarioList(ObservableList<Usuario> value) {
    _$usuarioListAtom.reportWrite(value, super.usuarioList, () {
      super.usuarioList = value;
    });
  }

  final _$nomeAtom = Atom(name: '_UsuarioStore.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$emailAtom = Atom(name: '_UsuarioStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$dataNascimentoAtom = Atom(name: '_UsuarioStore.dataNascimento');

  @override
  DateTime get dataNascimento {
    _$dataNascimentoAtom.reportRead();
    return super.dataNascimento;
  }

  @override
  set dataNascimento(DateTime value) {
    _$dataNascimentoAtom.reportWrite(value, super.dataNascimento, () {
      super.dataNascimento = value;
    });
  }

  final _$senhaAtom = Atom(name: '_UsuarioStore.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$senhaConfirmacaoAtom = Atom(name: '_UsuarioStore.senhaConfirmacao');

  @override
  String get senhaConfirmacao {
    _$senhaConfirmacaoAtom.reportRead();
    return super.senhaConfirmacao;
  }

  @override
  set senhaConfirmacao(String value) {
    _$senhaConfirmacaoAtom.reportWrite(value, super.senhaConfirmacao, () {
      super.senhaConfirmacao = value;
    });
  }

  final _$emailExistenteErrorAtom =
      Atom(name: '_UsuarioStore.emailExistenteError');

  @override
  String get emailExistenteError {
    _$emailExistenteErrorAtom.reportRead();
    return super.emailExistenteError;
  }

  @override
  set emailExistenteError(String value) {
    _$emailExistenteErrorAtom.reportWrite(value, super.emailExistenteError, () {
      super.emailExistenteError = value;
    });
  }

  final _$getAllUsuariosAsyncAction =
      AsyncAction('_UsuarioStore.getAllUsuarios');

  @override
  Future<void> getAllUsuarios() {
    return _$getAllUsuariosAsyncAction.run(() => super.getAllUsuarios());
  }

  final _$saveUsuarioAsyncAction = AsyncAction('_UsuarioStore.saveUsuario');

  @override
  Future<void> saveUsuario() {
    return _$saveUsuarioAsyncAction.run(() => super.saveUsuario());
  }

  final _$_UsuarioStoreActionController =
      ActionController(name: '_UsuarioStore');

  @override
  void setNome(String value) {
    final _$actionInfo = _$_UsuarioStoreActionController.startAction(
        name: '_UsuarioStore.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_UsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_UsuarioStoreActionController.startAction(
        name: '_UsuarioStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_UsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataNascimento(DateTime value) {
    final _$actionInfo = _$_UsuarioStoreActionController.startAction(
        name: '_UsuarioStore.setDataNascimento');
    try {
      return super.setDataNascimento(value);
    } finally {
      _$_UsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo = _$_UsuarioStoreActionController.startAction(
        name: '_UsuarioStore.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_UsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenhaConfirmacao(String value) {
    final _$actionInfo = _$_UsuarioStoreActionController.startAction(
        name: '_UsuarioStore.setSenhaConfirmacao');
    try {
      return super.setSenhaConfirmacao(value);
    } finally {
      _$_UsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
usuarioList: ${usuarioList},
nome: ${nome},
email: ${email},
dataNascimento: ${dataNascimento},
senha: ${senha},
senhaConfirmacao: ${senhaConfirmacao},
emailExistenteError: ${emailExistenteError},
nomeValid: ${nomeValid},
emailValid: ${emailValid},
senhaValid: ${senhaValid},
senhaConfirmacaoValid: ${senhaConfirmacaoValid},
nomeError: ${nomeError},
emailError: ${emailError},
senhaError: ${senhaError},
senhaConfirmacaoError: ${senhaConfirmacaoError},
isFormValid: ${isFormValid}
    ''';
  }
}
