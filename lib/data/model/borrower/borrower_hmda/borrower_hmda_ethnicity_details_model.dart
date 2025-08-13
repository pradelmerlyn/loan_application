import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/borrower/borrower_hmda/borrower_hmda_ethnicity_details_entity.dart';

part 'borrower_hmda_ethnicity_details_model.g.dart';

@JsonSerializable()
class BorrowerHmdaEthnicityDetailsModel
    extends BorrowerHmdaEthnicityDetailsEntity {
  const BorrowerHmdaEthnicityDetailsModel({
    super.hmdaEthnicityTypes,
    super.hmdaEthnicityOriginTypes,
    super.otherHMDAEthnicityOriginType,
  });

  /// Domain → Model mapping
  factory BorrowerHmdaEthnicityDetailsModel.fromEntity(
    BorrowerHmdaEthnicityDetailsEntity entity,
  ) =>
      BorrowerHmdaEthnicityDetailsModel(
        hmdaEthnicityTypes: entity.hmdaEthnicityTypes,
        hmdaEthnicityOriginTypes: entity.hmdaEthnicityOriginTypes,
        otherHMDAEthnicityOriginType: entity.otherHMDAEthnicityOriginType,
      );

  factory BorrowerHmdaEthnicityDetailsModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BorrowerHmdaEthnicityDetailsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$BorrowerHmdaEthnicityDetailsModelToJson(this);

  @override
  List<Object?> get props => [
        hmdaEthnicityTypes,
        hmdaEthnicityOriginTypes,
        otherHMDAEthnicityOriginType,
      ];
}
