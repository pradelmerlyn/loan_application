import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'borrower_hmda_ethnicity_details_entity.g.dart';

@JsonSerializable()
class BorrowerHmdaEthnicityDetailsEntity extends Equatable {
  @JsonKey(name: 'hmdaEthnicityTypes')
  final List<String>? hmdaEthnicityTypes;

  @JsonKey(name: 'hmdaEthnicityOriginTypes')
  final List<String>? hmdaEthnicityOriginTypes;

  @JsonKey(name: 'otherHMDAEthnicityOriginType')
  final String? otherHMDAEthnicityOriginType;

  const BorrowerHmdaEthnicityDetailsEntity({
    this.hmdaEthnicityTypes,
    this.hmdaEthnicityOriginTypes,
    this.otherHMDAEthnicityOriginType,
  });

  @override
  List<Object?> get props => [
    hmdaEthnicityTypes,
    hmdaEthnicityOriginTypes,
    otherHMDAEthnicityOriginType,
  ];

  factory BorrowerHmdaEthnicityDetailsEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$BorrowerHmdaEthnicityDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BorrowerHmdaEthnicityDetailsEntityToJson(this);
}
