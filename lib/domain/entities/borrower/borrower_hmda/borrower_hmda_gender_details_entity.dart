import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'borrower_hmda_gender_details_entity.g.dart';

@JsonSerializable()
class BorrowerHmdaGenderDetailsEntity extends Equatable {
  @JsonKey(name: 'hmdaGenderTypes')
  final List<String>? hmdaGenderTypes;

  const BorrowerHmdaGenderDetailsEntity({this.hmdaGenderTypes});

  @override
  List<Object?> get props => [hmdaGenderTypes];

  factory BorrowerHmdaGenderDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$BorrowerHmdaGenderDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BorrowerHmdaGenderDetailsEntityToJson(this);
}
