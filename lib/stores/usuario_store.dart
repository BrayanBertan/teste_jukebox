import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_jukebox/models/usuario.dart';
import 'package:teste_jukebox/repositories/usuario_repository.dart';

part 'usuario_store.g.dart';

class UsuarioStore = _UsuarioStore with _$UsuarioStore;

abstract class _UsuarioStore with Store {
  _UsuarioStore() {
    usuarioRepository = Modular.get<UsuarioRepository>();
    loading = false;
    getAllUsuarios();
  }

  UsuarioRepository usuarioRepository;

  @observable
  bool loading;

  @observable
  ObservableList<Usuario> usuarioList;

  @action
  Future<void> getAllUsuarios() async {
    try {
      loading = true;
      usuarioList.clear();
      final response = await usuarioRepository.getAllUsuarios();
      usuarioList.addAll(response);
      loading = false;
    } catch (erro) {
      print(erro);
    }
  }
}
