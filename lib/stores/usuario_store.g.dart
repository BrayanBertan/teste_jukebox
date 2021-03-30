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

  final _$getAllUsuariosAsyncAction =
      AsyncAction('_UsuarioStore.getAllUsuarios');

  @override
  Future<void> getAllUsuarios() {
    return _$getAllUsuariosAsyncAction.run(() => super.getAllUsuarios());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
usuarioList: ${usuarioList}
    ''';
  }
}
