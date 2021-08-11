import 'package:connectycube_chat/features/auth/domin/repositories/auth_repository.dart';
import 'package:connectycube_chat/features/auth/domin/usecases/register.dart';
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late Register register;
  late MockAuthRepository mockAuthRepository;
  setUp(() {
    mockAuthRepository = MockAuthRepository();
    register = Register(authRepository: mockAuthRepository);
  });
  final RegisterParams params = RegisterParams(
      fullName: 'fullName', login: 'login', password: 'password');
  test('should register', () async {
    when(mockAuthRepository.register(params))
        .thenAnswer((_) async => CubeUser());
  });
}
