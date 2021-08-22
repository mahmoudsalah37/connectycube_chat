import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:equatable/equatable.dart';

class LoginUseCase extends UseCase<Future<CubeUser?>, LoginParams> {
  final AuthRepository authRepository;
  LoginUseCase({required this.authRepository});
  @override
  Future<CubeUser?> call({required LoginParams params}) {
    return authRepository.login(params);
  }
}

class LoginParams extends Equatable {
  const LoginParams({required this.login, required this.password});
  final String login, password;
  @override
  List<Object?> get props => [login, password];
}
