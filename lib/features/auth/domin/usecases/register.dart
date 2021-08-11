import 'package:connectycube_chat/core/usecases/usecase.dart';
import 'package:connectycube_chat/features/auth/domin/repositories/auth_repository.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:equatable/equatable.dart';

class Register extends UseCase<void, RegisterParams> {
  final AuthRepository authRepository;
  Register({required this.authRepository});
  @override
  Future<CubeUser?> call({required RegisterParams params}) {
    return authRepository.register(params);
  }
}

class RegisterParams extends Equatable {
  final String fullName, login, password;

  const RegisterParams(
      {required this.fullName, required this.login, required this.password});
  @override
  List<Object?> get props => [fullName, login, password];
}
