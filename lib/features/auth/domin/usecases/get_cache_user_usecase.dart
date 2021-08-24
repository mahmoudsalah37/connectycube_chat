import 'package:connectycube_sdk/connectycube_calls.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class GetCacheUserUseCase extends UseCase<Future<CubeUser?>, NoParams> {
  final AuthRepository authRepository;
  GetCacheUserUseCase({required this.authRepository});
  @override
  Future<CubeUser?> call({required NoParams params}) {
    return Future.value(authRepository.getCacheUser());
  }
}
