import '../models/user.dart';

abstract class AuthenticationRepository {

Future<bool> get isSigned;
Future<User> getUserData();
}