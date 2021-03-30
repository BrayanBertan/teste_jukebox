import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_jukebox/stores/login_store.dart';
import 'package:teste_jukebox/views/widgets/custom_snackbar.dart';

class DialogTrocarSenha extends StatelessWidget {
  final LoginStore loginStore = Modular.get<LoginStore>();
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
                  'Digite uma nova senha para ${loginStore.email}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Observer(builder: (_) {
                  return TextField(
                    onChanged: loginStore.setSenha,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        errorText: loginStore.senhaError,
                        labelText: 'Senha',
                        isDense: true),
                  );
                }),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                    height: 45,
                    child: Observer(
                      builder: (context) {
                        return ElevatedButton(
                          onPressed: loginStore.senhaValid
                              ? () {
                                  Future.delayed(Duration(seconds: 1))
                                      .then((value) => Modular.to.pop(context));
                                  loginStore.changePassword(
                                      onSucess: () => CustomSnackBar(
                                          context,
                                          'Senha alterada com sucesso',
                                          Colors.green),
                                      onFail: () => CustomSnackBar(context,
                                          'Email inexistente', Colors.red));
                                }
                              : null,
                          child: Text(
                            'Salvar',
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(203, 100, 100, 1)),
                        );
                      },
                    ))
              ],
            ),
          )),
    );
  }
}
