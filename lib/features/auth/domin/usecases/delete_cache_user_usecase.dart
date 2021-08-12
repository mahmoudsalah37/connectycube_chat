import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class LogOutUserUseCase extends UseCase<bool, NoParams> {
  final AuthRepository authRepository;
  LogOutUserUseCase({required this.authRepository});
  @override
  Future<bool> call({required NoParams params}) async {
    return await authRepository.logoutUser();
  }
}
