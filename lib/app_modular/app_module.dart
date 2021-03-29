import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_jukebox/repositories/usuario_repository.dart';
import 'package:teste_jukebox/splash_screen.dart';
import 'package:teste_jukebox/views/login/login_view.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => UsuarioRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => SplashScreen()),
    ChildRoute('/home', child: (_, __) => LoginPage()),
  ];
}