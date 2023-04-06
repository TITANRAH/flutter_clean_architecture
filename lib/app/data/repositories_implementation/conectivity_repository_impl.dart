import '../../domain/repositories/conectivity_repository.dart';

class ConectivityRepositoryImpl implements ConectivityRepository {
  @override
  Future<bool> get hasInternet {
    return Future.value(true);
  }
}
