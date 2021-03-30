import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_jukebox/repositories/usuario_repository.dart';
import 'package:teste_jukebox/stores/login_store.dart';
import 'package:teste_jukebox/views/widgets/custom_snackbar.dart';

class DialogTrocarHash extends StatelessWidget {
  final LoginStore loginStore = Modular.get<LoginStore>();
  final TextEditingController hashController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Card(
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Digite o novo hash',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: hashController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Hash',
                      isDense: true),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      UsuarioRepository.hash = hashController.text;
                      Future.delayed(Duration(seconds: 1))
                          .then((value) => Modular.to.pop(context));
                      CustomSnackBar(
                          context, 'hash alterado com sucesso', Colors.green);
                    },
                    child: Text(
                      'Salvar',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(203, 100, 100, 1)),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
