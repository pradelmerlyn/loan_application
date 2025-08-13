import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/borrower/borrower_hmda/borrower_hmda_race_details_entity.dart';

part 'borrower_hmda_race_details_model.g.dart';

@JsonSerializable()
class BorrowerHmdaRaceDetailsModel extends BorrowerHmdaRaceDetailsEntity {
  const BorrowerHmdaRaceDetailsModel({
    super.hmdaRaceTypes,
    super.hmdaRaceEnrolledOrPrincipalTribe,
    super.hmdaRaceDesignationTypes,
    super.hmdaRaceDesignationOtherAsianDescription,
    super.hmdaRaceDesignationTypesPacificIslander,
    super.hmdaRaceDesignationOtherPacificIslanderDescription,
  });

  /// Domain → Model mapping
  factory BorrowerHmdaRaceDetailsModel.fromEntity(
    BorrowerHmdaRaceDetailsEntity entity,
  ) =>
      BorrowerHmdaRaceDetailsModel(
        hmdaRaceTypes: entity.hmdaRaceTypes,
        hmdaRaceEnrolledOrPrincipalTribe:
            entity.hmdaRaceEnrolledOrPrincipalTribe,
        hmdaRaceDesignationTypes: entity.hmdaRaceDesignationTypes,
        hmdaRaceDesignationOtherAsianDescription:
            entity.hmdaRaceDesignationOtherAsianDescription,
        hmdaRaceDesignationTypesPacificIslander:
            entity.hmdaRaceDesignationTypesPacificIslander,
        hmdaRaceDesignationOtherPacificIslanderDescription:
            entity.hmdaRaceDesignationOtherPacificIslanderDescription,
      );

  factory BorrowerHmdaRaceDetailsModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BorrowerHmdaRaceDetailsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BorrowerHmdaRaceDetailsModelToJson(this);

  @override
  List<Object?> get props => [
        hmdaRaceTypes,
        hmdaRaceEnrolledOrPrincipalTribe,
        hmdaRaceDesignationTypes,
        hmdaRaceDesignationOtherAsianDescription,
        hmdaRaceDesignationTypesPacificIslander,
        hmdaRaceDesignationOtherPacificIslanderDescription,
      ];
}
