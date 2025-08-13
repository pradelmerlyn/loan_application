import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_home_phone_number_entity.dart';

part 'borrower_home_phone_number_model.g.dart';

@JsonSerializable()
class BorrowerHomePhoneNumberModel extends BorrowerHomePhoneNumberEntity {
  const BorrowerHomePhoneNumberModel({
    super.id,
    super.number,
  });

  factory BorrowerHomePhoneNumberModel.fromEntity(
    BorrowerHomePhoneNumberEntity entity,
  ) =>
      BorrowerHomePhoneNumberModel(
        id: entity.id,
        number: entity.number,
      );

  @override
  List<Object?> get props => [id, number];

  factory BorrowerHomePhoneNumberModel.fromJson(Map<String, dynamic> json) =>
      _$BorrowerHomePhoneNumberModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BorrowerHomePhoneNumberModelToJson(this);
}
