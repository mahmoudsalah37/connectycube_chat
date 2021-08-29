import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class IsOnlineUseCase extends UseCase<Future<bool>, NoParams> {
  final AuthRepository authRepository;
  IsOnlineUseCase({required this.authRepository});
  @override
  Future<bool> call({required NoParams params}) async {
    return await authRepository.isOnline();
  }
}
