import 'package:flutter/material.dart';

import '../../../../../main.dart';
import '../../../routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    // para ejecutar codigo despues de renederizado el widget en su iniicio
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  Future<void> _init() async {
    final injector = Injector.of(context);
    final conectivityRepository = injector.conectivityRepository;

    final hasInternet = await conectivityRepository.hasInternet;
    if (hasInternet) {
      print('hasInternet $hasInternet');
      final authenticationRepository = injector.authenticationRepository;
      final isSignedIn = await authenticationRepository.isSigned;

      if (isSignedIn) {
        final user = await authenticationRepository.getUserData();

        if (mounted) {
          if (user != null) {
            _goTo(Routes.home);
          } else {
            _goTo(Routes.signIn);
          }
        }
      } else if (mounted) {
        print('false no esta autenticado');
        _goTo(Routes.signIn);
      }
    } else {
      _goTo(Routes.offLine);
    }

    // en esta funcion llamamos a nuestros provider con sus variables y funciones
    // y comprobamos si hay interenet y luego si hay algun usuario con la pantalla atiava
  }

  void _goTo(String routeName) {
    Navigator.pushReplacementNamed(
      context,
      routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 80,
          height: 80,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
