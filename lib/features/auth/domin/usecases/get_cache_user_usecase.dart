import 'package:connectycube_sdk/connectycube_calls.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class GetCacheUserUseCase extends UseCase<CubeUser, NoParams> {
  final AuthRepository authRepository;
  GetCacheUserUseCase({required this.authRepository});
  @override
  CubeUser call({required NoParams params}) {
    return authRepository.getCacheUser();
  }
}
