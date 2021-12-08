import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_authorization/auth/domain/auth_info.dart';

part 'auth_info_dto.freezed.dart';
part 'auth_info_dto.g.dart';

/// Represent data transfer object.
@freezed
class AuthInfoDTO with _$AuthInfoDTO {
  const AuthInfoDTO._();
  const factory AuthInfoDTO({
    required String phoneNumber,
    required String password,
  }) = _AuthInfoDTO;

  factory AuthInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthInfoDTOFromJson(json);

  factory AuthInfoDTO.fromDomain(AuthInfo _) {
    return AuthInfoDTO(
      phoneNumber: _.phoneNumber,
      password: _.password,
    );
  }
  AuthInfo toDomain() => AuthInfo(
        phoneNumber: phoneNumber,
        password: password,
      );
}
