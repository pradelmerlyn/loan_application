import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'property_address_entity.dart';

part 'property_entity.g.dart';

@JsonSerializable()
class PropertyEntity extends Equatable {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'intendedUsageType')
  final String? intendedUsageType;

  @JsonKey(name: 'propertyType')
  final String? propertyType;

  @JsonKey(name: 'address')
  final PropertyAddressEntity? address;

  const PropertyEntity({
    this.id,
    this.intendedUsageType,
    this.propertyType,
    this.address,
  });

  @override
  List<Object?> get props => [
        id,
        intendedUsageType,
        propertyType,
        address,
      ];

  factory PropertyEntity.fromJson(Map<String, dynamic> json) =>
      _$PropertyEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyEntityToJson(this);
}
