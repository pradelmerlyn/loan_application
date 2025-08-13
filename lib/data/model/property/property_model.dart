import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/property/property_entity.dart';
import 'property_address_model.dart';

part 'property_model.g.dart';

@JsonSerializable()
class PropertyModel extends PropertyEntity {
  const PropertyModel({
    super.id,
    super.intendedUsageType,
    super.propertyType,
    PropertyAddressModel? super.address,
  });

  
  factory PropertyModel.fromEntity(PropertyEntity e) => PropertyModel(
        id: e.id,
        intendedUsageType: e.intendedUsageType,
        propertyType: e.propertyType,
        address: e.address != null
            ? PropertyAddressModel.fromEntity(e.address!)
            : null,
      );

  factory PropertyModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PropertyModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        intendedUsageType,
        propertyType,
        address,
      ];
}
