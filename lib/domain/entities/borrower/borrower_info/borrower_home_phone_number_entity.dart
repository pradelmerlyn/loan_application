import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'borrower_home_phone_number_entity.g.dart';

@JsonSerializable()
class BorrowerHomePhoneNumberEntity extends Equatable {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'number')
  final String? number;

  @JsonKey(name: 'type')
  final dynamic type;

  const BorrowerHomePhoneNumberEntity({
    this.id,
    this.number,
    this.type,
  });

  factory BorrowerHomePhoneNumberEntity.fromJson(Map<String, dynamic> json) =>
      _$BorrowerHomePhoneNumberEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$BorrowerHomePhoneNumberEntityToJson(this);

  @override
  List<Object?> get props => [id, number, type];
}
