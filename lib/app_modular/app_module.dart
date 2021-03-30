import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_jukebox/repositories/usuario_repository.dart';
import 'package:teste_jukebox/splash_screen.dart';
import 'package:teste_jukebox/stores/login_store.dart';
import 'package:teste_jukebox/views/cadastro/cadastro_view.dart';
import 'package:teste_jukebox/views/home/home_view.dart';
import 'package:teste_jukebox/views/login/login_view.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => UsuarioRepository()),
    Bind((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => SplashScreen()),
    ChildRoute('/login', child: (_, __) => LoginPage()),
    ChildRoute('/home', child: (_, __) => HomePage()),
    ChildRoute('/cadastro', child: (_, __) => CadastroPage()),
  ];
}
