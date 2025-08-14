import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'borrower_phone_number_entity.g.dart';

/// One item in `phoneNumbers`: { "number": "...", "type": "Home" }
@JsonSerializable()
class BorrowerPhoneNumberEntity extends Equatable {
  @JsonKey(name: 'number')
  final String? number;

  /// e.g. "Home", "Mobile", "Work"
  @JsonKey(name: 'type')
  final String? type;

  const BorrowerPhoneNumberEntity({
    this.number,
    this.type,
  });

  @override
  List<Object?> get props => [number, type];

  factory BorrowerPhoneNumberEntity.fromJson(Map<String, dynamic> json) =>
      _$BorrowerPhoneNumberEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BorrowerPhoneNumberEntityToJson(this);
}
