import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_home_phone_number_entity.dart';

part 'borrower_home_phone_number_model.g.dart';

@JsonSerializable()
class BorrowerHomePhoneNumberModel extends BorrowerHomePhoneNumberEntity {
  const BorrowerHomePhoneNumberModel({
    super.id,
    super.number,
    super.type,
  });

  factory BorrowerHomePhoneNumberModel.fromEntity(
    BorrowerHomePhoneNumberEntity e,
  ) =>
      BorrowerHomePhoneNumberModel(id: e.id, number: e.number, type: e.type);

  factory BorrowerHomePhoneNumberModel.fromJson(Map<String, dynamic> json) =>
      _$BorrowerHomePhoneNumberModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BorrowerHomePhoneNumberModelToJson(this);
}
