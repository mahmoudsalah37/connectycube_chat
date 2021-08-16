import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';
import 'package:connectycube_sdk/connectycube_calls.dart';
import 'package:equatable/equatable.dart';

class UpdateUserDataUseCase extends UseCase<CubeUser, UpdateUserDataParams> {
  final AuthRepository authRepository;

  UpdateUserDataUseCase({required this.authRepository});

  @override
  Future<CubeUser?> call({required UpdateUserDataParams params}) {
    return authRepository.updateUserData(params);
  }
}

class UpdateUserDataParams extends Equatable {
  final String userName, fullName, password, avatar;

  UpdateUserDataParams({
   required this.userName,
   required this.fullName,
   required this.password,
   required this.avatar,
  });

  @override
  List<Object?> get props => [userName, fullName, password, avatar];
}
