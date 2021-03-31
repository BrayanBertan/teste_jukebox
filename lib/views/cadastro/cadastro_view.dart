import 'package:auto_size_text/auto_size_text.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:teste_jukebox/models/usuario.dart';
import 'package:teste_jukebox/stores/cadastro_store.dart';
import 'package:teste_jukebox/views/widgets/custom_snackbar.dart';
import 'package:teste_jukebox/views/widgets/dialog_trocar_hash.dart';
import 'package:teste_jukebox/views/widgets/loading_view.dart';
import 'package:teste_jukebox/views/widgets/logout.dart';

class CadastroPage extends StatelessWidget {
  Usuario usuario;
  CadastroStore cadastroStore;
  CadastroPage({this.usuario})
      : cadastroStore = CadastroStore(usuario: usuario);
  @override
  Widget build(BuildContext context) {
    bool isSmallDevice = ResponsiveWrapper.of(context).isMobile ||
        ResponsiveWrapper.of(context).isTablet;
    double screenHeight = ResponsiveWrapper.of(context).screenHeight;
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste Jukebox'),
        actions: [
          usuario == null ? Container() : LogoutIconButton(),
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Align(
            alignment: isSmallDevice ? Alignment.topCenter : Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: SingleChildScrollView(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipPath(
                        clipper: WaveClipperTwo(),
                        child: Container(
                          height: 125,
                          color: Color.fromRGBO(203, 100, 100, 1),
                          child: AutoSizeText(
                            usuario == null ? 'Cadastro' : 'Edição',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 50),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Observer(builder: (_) {
                              return TextFormField(
                                initialValue: cadastroStore.email,
                                onChanged: cadastroStore.setEmail,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    errorText: cadastroStore.emailError,
                                    labelText: 'Email',
                                    isDense: true),
                                keyboardType: TextInputType.emailAddress,
                              );
                            }),
                            SizedBox(
                              height: 15,
                            ),
                            Observer(builder: (_) {
                              return TextFormField(
                                initialValue: cadastroStore.nome,
                                onChanged: cadastroStore.setNome,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    errorText: cadastroStore.nomeError,
                                    labelText: 'Nome',
                                    isDense: true),
                              );
                            }),
                            SizedBox(
                              height: 15,
                            ),
                            Observer(builder: (_) {
                              return TextFormField(
                                initialValue: cadastroStore.senha,
                                onChanged: cadastroStore.setSenha,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    errorText: cadastroStore.senhaError,
                                    labelText: 'Senha',
                                    isDense: true),
                              );
                            }),
                            SizedBox(
                              height: 15,
                            ),
                            Observer(builder: (_) {
                              return TextFormField(
                                initialValue: cadastroStore.senhaConfirmacao,
                                onChanged: cadastroStore.setSenhaConfirmacao,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    errorText:
                                        cadastroStore.senhaConfirmacaoError,
                                    labelText: 'Repita a senha',
                                    isDense: true),
                              );
                            }),
                            SizedBox(
                              height: 15,
                            ),
                            DateTimeField(
                              format: DateFormat('dd/MM/yyyy'),
                              onChanged: cadastroStore.setDataNascimento,
                              initialValue:
                                  cadastroStore.usuario?.dataNascimento != null
                                      ? cadastroStore.usuario.dataNascimento
                                      : DateTime.now(),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Data de nascimento'),
                              resetIcon: null,
                              onShowPicker: (context, currentValue) {
                                return showDatePicker(
                                    locale: Locale('pt', 'BR'),
                                    context: context,
                                    currentDate: cadastroStore
                                                .usuario?.dataNascimento !=
                                            null
                                        ? cadastroStore.usuario.dataNascimento
                                        : DateTime.now(),
                                    firstDate: DateTime(1900),
                                    initialDate: currentValue ?? DateTime.now(),
                                    lastDate: DateTime.now(),
                                    cancelText: 'Cancelar');
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            DialogTrocarHash());
                                  },
                                  child: Text(
                                    'Mudar hash',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Modular.to.pushReplacementNamed('/login');
                                  },
                                  child: Text(
                                    'Já possui uma conta?',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                                height: 45,
                                child: Observer(
                                  builder: (context) {
                                    return ElevatedButton(
                                      onPressed: cadastroStore.isFormValid
                                          ? () {
                                              cadastroStore.saveUsuario(
                                                onSucess: () {
                                                  Modular.to
                                                      .pushReplacementNamed(
                                                          '/home');
                                                },
                                                onFail: () {
                                                  CustomSnackBar(
                                                      context,
                                                      'Esse email já está em uso',
                                                      Colors.red);
                                                },
                                              );
                                            }
                                          : null,
                                      child: Text(
                                        usuario == null
                                            ? 'Cadastrar'
                                            : 'Salvar',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromRGBO(203, 100, 100, 1),
                                        onSurface:
                                            Color.fromRGBO(203, 100, 100, 0.8),
                                      ),
                                    );
                                  },
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Observer(
              builder: (context) =>
                  cadastroStore.loading ? LoadingPage() : Container()),
        ],
      ),
    );
  }
}
