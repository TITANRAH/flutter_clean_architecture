import 'package:flutter/cupertino.dart';

import 'app/data/repositories_implementation/authentication_repository_impl.dart';
import 'app/data/repositories_implementation/conectivity_repository_impl.dart';
import 'app/domain/repositories/authentication_repository.dart';
import 'app/domain/repositories/conectivity_repository.dart';
import 'app/my_app.dart';

void main() {
  runApp(
    Injector(
      conectivityRepository: ConectivityRepositoryImpl(),
      authenticationRepository: AuthenticationRepositoryImpl(),
      child: const MyApp(),
    ),
  );
}

class Injector extends InheritedWidget {
  const Injector({
    required super.child,
    super.key,
    required this.conectivityRepository,
    required this.authenticationRepository,
  });

  final ConectivityRepository conectivityRepository;
  final AuthenticationRepository authenticationRepository;

  @override
  // ignore: avoid_renaming_method_parameters
  bool updateShouldNotify(_) => false;

  static Injector of(BuildContext context) {
    final injector = context.dependOnInheritedWidgetOfExactType<Injector>();

    // REEMPLAZO LOS IF CON ASSERTS
    assert(injector != null, 'Inyector could not found');
    return injector!;
  }
}
