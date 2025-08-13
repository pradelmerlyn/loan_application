import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'borrower_bankruptcy_entity.g.dart';

@JsonSerializable()
class BorrowerBankruptcyEntity extends Equatable {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'bankruptcyCaseNumber')
  final String? bankruptcyCaseNumber;

  @JsonKey(name: 'bankruptcyChapterType')
  final String? bankruptcyChapterType;

  @JsonKey(name: 'bankruptcyClosedType')
  final String? bankruptcyClosedType;

  @JsonKey(name: 'bankruptcyCloseDate')
  final DateTime? bankruptcyCloseDate;

  const BorrowerBankruptcyEntity({
    this.id,
    this.bankruptcyCaseNumber,
    this.bankruptcyChapterType,
    this.bankruptcyClosedType,
    this.bankruptcyCloseDate,
  });

  @override
  List<Object?> get props => [
    id,
    bankruptcyCaseNumber,
    bankruptcyChapterType,
    bankruptcyClosedType,
    bankruptcyCloseDate,
  ];

  factory BorrowerBankruptcyEntity.fromJson(Map<String, dynamic> json) =>
      _$BorrowerBankruptcyEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BorrowerBankruptcyEntityToJson(this);
}
