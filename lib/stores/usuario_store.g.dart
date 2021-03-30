// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsuarioStore on _UsuarioStore, Store {
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

  final _$usuarioListCloneAtom = Atom(name: '_UsuarioStore.usuarioListClone');

  @override
  ObservableList<Usuario> get usuarioListClone {
    _$usuarioListCloneAtom.reportRead();
    return super.usuarioListClone;
  }

  @override
  set usuarioListClone(ObservableList<Usuario> value) {
    _$usuarioListCloneAtom.reportWrite(value, super.usuarioListClone, () {
      super.usuarioListClone = value;
    });
  }

  final _$pesquisaAtom = Atom(name: '_UsuarioStore.pesquisa');

  @override
  String get pesquisa {
    _$pesquisaAtom.reportRead();
    return super.pesquisa;
  }

  @override
  set pesquisa(String value) {
    _$pesquisaAtom.reportWrite(value, super.pesquisa, () {
      super.pesquisa = value;
    });
  }

  final _$getAllUsuariosAsyncAction =
      AsyncAction('_UsuarioStore.getAllUsuarios');

  @override
  Future<void> getAllUsuarios() {
    return _$getAllUsuariosAsyncAction.run(() => super.getAllUsuarios());
  }

  final _$_UsuarioStoreActionController =
      ActionController(name: '_UsuarioStore');

  @override
  void setPesquisa(String value) {
    final _$actionInfo = _$_UsuarioStoreActionController.startAction(
        name: '_UsuarioStore.setPesquisa');
    try {
      return super.setPesquisa(value);
    } finally {
      _$_UsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pesquisar() {
    final _$actionInfo = _$_UsuarioStoreActionController.startAction(
        name: '_UsuarioStore.pesquisar');
    try {
      return super.pesquisar();
    } finally {
      _$_UsuarioStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
usuarioList: ${usuarioList},
usuarioListClone: ${usuarioListClone},
pesquisa: ${pesquisa}
    ''';
  }
}
