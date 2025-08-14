
import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/borrower/borrower_info/borrower_phone_number_entity.dart';

part 'borrower_phone_number_model.g.dart';

@JsonSerializable()
class BorrowerPhoneNumberModel extends BorrowerPhoneNumberEntity {
  const BorrowerPhoneNumberModel({
    super.number,
    super.type,
  });

  factory BorrowerPhoneNumberModel.fromEntity(BorrowerPhoneNumberEntity e) =>
      BorrowerPhoneNumberModel(number: e.number, type: e.type);

  factory BorrowerPhoneNumberModel.fromJson(Map<String, dynamic> json) =>
      _$BorrowerPhoneNumberModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BorrowerPhoneNumberModelToJson(this);
}
