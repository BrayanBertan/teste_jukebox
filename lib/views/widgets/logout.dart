import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_jukebox/stores/login_store.dart';

class LogoutIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Modular.get<LoginStore>().logout();
                Modular.to.pushReplacementNamed('/login');
              }),
          Text('Logout')
        ],
      ),
    );
  }
}
