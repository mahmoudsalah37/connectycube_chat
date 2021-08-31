import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class UpdateUserDataUseCase
    extends UseCase<Future<CubeUser?>, UpdateUserDataParams> {
  final AuthRepository authRepository;

  UpdateUserDataUseCase({required this.authRepository});

  @override
  Future<CubeUser?> call({required UpdateUserDataParams params}) {
    return authRepository.updateUserData(
        login: params.userName,
        fullName: params.fullName,
        avatar: params.avatar);
  }
}

class UpdateUserDataParams extends Equatable {
  final String userName, fullName, avatar;

  UpdateUserDataParams({
    required this.userName,
    required this.fullName,
    required this.avatar,
  });

  @override
  List<Object?> get props => [userName, fullName, avatar];
}
