import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:teste_jukebox/stores/cadastro_store.dart';
import 'package:teste_jukebox/stores/login_store.dart';
import 'package:teste_jukebox/stores/usuario_store.dart';
import 'package:teste_jukebox/views/home/widgets/usuario_item.dart';
import 'package:teste_jukebox/views/widgets/dialog_trocar_hash.dart';
import 'package:teste_jukebox/views/widgets/logout.dart';

class HomePage extends StatelessWidget {
  final UsuarioStore usuarioStore = UsuarioStore();
  final CadastroStore cadastroStore = CadastroStore();
  @override
  Widget build(BuildContext context) {
    bool isSmallDevice = ResponsiveWrapper.of(context).isMobile ||
        ResponsiveWrapper.of(context).isTablet;
    return Scaffold(
      appBar: AppBar(
        title: Text(Modular.get<LoginStore>().usuario.nome),
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                  context: context, builder: (context) => DialogTrocarHash());
            },
            child: Text(
              'Mudar hash',
              style: TextStyle(color: Colors.white),
            ),
          ),
          LogoutIconButton()
        ],
      ),
      body: Align(
          alignment: isSmallDevice ? Alignment.topCenter : Alignment.center,
          child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          onChanged: usuarioStore.setPesquisa,
                          decoration: InputDecoration(
                              labelText: 'Pesquisar',
                              border: OutlineInputBorder()),
                        )),
                        IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              usuarioStore.pesquisar();
                            }),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    title: Text(
                      'Cadastrar novo usuario',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        Modular.to.pushNamed(
                          '/cadastro',
                        );
                      },
                    ),
                  ),
                  Observer(builder: (context) {
                    return Expanded(
                        child: ListView.builder(
                      itemCount: usuarioStore.usuarioListClone.length,
                      itemBuilder: (context, index) {
                        return usuarioStore.usuarioListClone.length > 0
                            ? UsuarioItem(
                                usuario: usuarioStore.usuarioListClone[index],
                                deletarUsuario: () async {
                                  await cadastroStore.deleteUsuario(
                                      usuarioStore.usuarioListClone[index].id);
                                  await usuarioStore.getAllUsuarios();
                                },
                                updateUsuario: () {
                                  Modular.to.pushNamed('/cadastro',
                                      arguments:
                                          usuarioStore.usuarioListClone[index]);
                                })
                            : Center(
                                child: Text(
                                  'Nenhum usuário cadastrado',
                                  style: TextStyle(fontSize: 30),
                                ),
                              );
                      },
                    ));
                  }),
                ],
              ))),
    );
  }
}
