import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';
import 'package:connectycube_sdk/connectycube_calls.dart';

class GetCacheUserUseCase extends UseCase<CubeUser, NoParams> {
  final AuthRepository authRepository;
  GetCacheUserUseCase({required this.authRepository});
  @override
  Future<CubeUser?> call({required NoParams params}) {
    return Future.value(authRepository.getCacheUser());
  }
}
