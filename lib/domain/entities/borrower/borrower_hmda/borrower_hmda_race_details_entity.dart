import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'borrower_hmda_race_details_entity.g.dart';

@JsonSerializable()
class BorrowerHmdaRaceDetailsEntity extends Equatable {
  @JsonKey(name: 'hmdaRaceTypes')
  final List<String>? hmdaRaceTypes;

  @JsonKey(name: 'hmdaRaceEnrolledOrPrincipalTribe')
  final String? hmdaRaceEnrolledOrPrincipalTribe;

  @JsonKey(name: 'hmdaRaceDesignationTypes')
  final List<String>? hmdaRaceDesignationTypes;

  @JsonKey(name: 'hmdaRaceDesignationOtherAsianDescription')
  final String? hmdaRaceDesignationOtherAsianDescription;

  @JsonKey(name: 'hmdaRaceDesignationTypesPacificIslander')
  final List<String>? hmdaRaceDesignationTypesPacificIslander;

  @JsonKey(name: 'hmdaRaceDesignationOtherPacificIslanderDescription')
  final String? hmdaRaceDesignationOtherPacificIslanderDescription;

  const BorrowerHmdaRaceDetailsEntity({
    this.hmdaRaceTypes,
    this.hmdaRaceEnrolledOrPrincipalTribe,
    this.hmdaRaceDesignationTypes,
    this.hmdaRaceDesignationOtherAsianDescription,
    this.hmdaRaceDesignationTypesPacificIslander,
    this.hmdaRaceDesignationOtherPacificIslanderDescription,
  });

  @override
  List<Object?> get props => [
    hmdaRaceTypes,
    hmdaRaceEnrolledOrPrincipalTribe,
    hmdaRaceDesignationTypes,
    hmdaRaceDesignationOtherAsianDescription,
    hmdaRaceDesignationTypesPacificIslander,
    hmdaRaceDesignationOtherPacificIslanderDescription,
  ];

  factory BorrowerHmdaRaceDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$BorrowerHmdaRaceDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BorrowerHmdaRaceDetailsEntityToJson(this);
}
