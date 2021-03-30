import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teste_jukebox/models/usuario.dart';

class UsuarioItem extends StatelessWidget {
  Usuario usuario;
  VoidCallback deletarUsuario;
  VoidCallback updateUsuario;
  UsuarioItem({this.usuario, this.deletarUsuario, this.updateUsuario});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(usuario.email),
        title: Text(
            '${usuario.nome} ${DateFormat('dd/MM/yyyy').format(usuario.dataNascimento)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.yellow,
                ),
                onPressed: updateUsuario),
            IconButton(
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                ),
                onPressed: deletarUsuario),
          ],
        ),
      ),
    );
  }
}
