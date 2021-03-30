import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:teste_jukebox/stores/login_store.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore loginStore = Modular.get<LoginStore>();
  @override
  void initState() {
    super.initState();

    when((_) => loginStore.usuario != null, () {
      Modular.to.pushReplacementNamed('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSmallDevice = ResponsiveWrapper.of(context).isMobile ||
        ResponsiveWrapper.of(context).isTablet;
    double screenHeight = ResponsiveWrapper.of(context).screenHeight;
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste Jokebox'),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
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
                      child: Text(
                        'Login',
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
                          return TextField(
                            onChanged: loginStore.setEmail,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                errorText: loginStore.emailError,
                                labelText: 'Email',
                                isDense: true),
                            keyboardType: TextInputType.emailAddress,
                          );
                        }),
                        SizedBox(
                          height: 15,
                        ),
                        Observer(builder: (_) {
                          return TextField(
                            onChanged: loginStore.setSenha,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                errorText: loginStore.loginError,
                                labelText: 'Senha',
                                isDense: true),
                          );
                        }),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Esqueceu a senha?',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                loginStore.checkLogin();
                              },
                              child: Text(
                                'Entrar',
                                style: TextStyle(fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(203, 100, 100, 1)),
                            ))
                      ],
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipperTwo(flip: true, reverse: true),
                    child: Container(
                      height: 125,
                      color: Color.fromRGBO(203, 100, 100, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
