// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool> _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_LoginStore.emailValid'))
          .value;
  Computed<String> _$emailErrorComputed;

  @override
  String get emailError =>
      (_$emailErrorComputed ??= Computed<String>(() => super.emailError,
              name: '_LoginStore.emailError'))
          .value;
  Computed<bool> _$senhaValidComputed;

  @override
  bool get senhaValid =>
      (_$senhaValidComputed ??= Computed<bool>(() => super.senhaValid,
              name: '_LoginStore.senhaValid'))
          .value;
  Computed<Function> _$isFormValidComputed;

  @override
  Function get isFormValid =>
      (_$isFormValidComputed ??= Computed<Function>(() => super.isFormValid,
              name: '_LoginStore.isFormValid'))
          .value;
  Computed<String> _$senhaErrorComputed;

  @override
  String get senhaError =>
      (_$senhaErrorComputed ??= Computed<String>(() => super.senhaError,
              name: '_LoginStore.senhaError'))
          .value;

  final _$loadingAtom = Atom(name: '_LoginStore.loading');

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

  final _$emailAtom = Atom(name: '_LoginStore.email');

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

  final _$senhaAtom = Atom(name: '_LoginStore.senha');

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

  final _$loginErrorAtom = Atom(name: '_LoginStore.loginError');

  @override
  String get loginError {
    _$loginErrorAtom.reportRead();
    return super.loginError;
  }

  @override
  set loginError(String value) {
    _$loginErrorAtom.reportWrite(value, super.loginError, () {
      super.loginError = value;
    });
  }

  final _$checkLoginAsyncAction = AsyncAction('_LoginStore.checkLogin');

  @override
  Future<void> checkLogin(
      {@required VoidCallback onSucess, @required VoidCallback onFail}) {
    return _$checkLoginAsyncAction
        .run(() => super.checkLogin(onSucess: onSucess, onFail: onFail));
  }

  final _$changePasswordAsyncAction = AsyncAction('_LoginStore.changePassword');

  @override
  Future<void> changePassword(
      {@required VoidCallback onSucess, @required VoidCallback onFail}) {
    return _$changePasswordAsyncAction
        .run(() => super.changePassword(onSucess: onSucess, onFail: onFail));
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
email: ${email},
senha: ${senha},
loginError: ${loginError},
emailValid: ${emailValid},
emailError: ${emailError},
senhaValid: ${senhaValid},
isFormValid: ${isFormValid},
senhaError: ${senhaError}
    ''';
  }
}
