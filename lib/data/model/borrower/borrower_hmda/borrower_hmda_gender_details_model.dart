import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/borrower/borrower_hmda/borrower_hmda_gender_details_entity.dart';

part 'borrower_hmda_gender_details_model.g.dart';

@JsonSerializable()
class BorrowerHmdaGenderDetailsModel extends BorrowerHmdaGenderDetailsEntity {
  const BorrowerHmdaGenderDetailsModel({
    super.hmdaGenderTypes,
  });

  factory BorrowerHmdaGenderDetailsModel.fromEntity(
    BorrowerHmdaGenderDetailsEntity entity,
  ) =>
      BorrowerHmdaGenderDetailsModel(
        hmdaGenderTypes: entity.hmdaGenderTypes,
      );

  factory BorrowerHmdaGenderDetailsModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BorrowerHmdaGenderDetailsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BorrowerHmdaGenderDetailsModelToJson(this);

  @override
  List<Object?> get props => [hmdaGenderTypes];
}
