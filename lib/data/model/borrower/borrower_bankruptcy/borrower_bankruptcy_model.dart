import 'package:json_annotation/json_annotation.dart';
import 'package:loan/domain/entities/borrower/borrower_bankruptcy/borrower_bankruptcy_entity.dart';

part 'borrower_bankruptcy_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BorrowerBankruptcyModel extends BorrowerBankruptcyEntity {
  const BorrowerBankruptcyModel({
    super.id,
    super.bankruptcyCaseNumber,
    super.bankruptcyChapterType,
    super.bankruptcyClosedType,
    super.bankruptcyCloseDate,
  });

  factory BorrowerBankruptcyModel.fromEntity(
    BorrowerBankruptcyEntity entity,
  ) =>
      BorrowerBankruptcyModel(
        id: entity.id,
        bankruptcyCaseNumber: entity.bankruptcyCaseNumber,
        bankruptcyChapterType: entity.bankruptcyChapterType,
        bankruptcyClosedType: entity.bankruptcyClosedType,
        bankruptcyCloseDate: entity.bankruptcyCloseDate,
      );

  factory BorrowerBankruptcyModel.fromJson(Map<String, dynamic> json) =>
      _$BorrowerBankruptcyModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BorrowerBankruptcyModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        bankruptcyCaseNumber,
        bankruptcyChapterType,
        bankruptcyClosedType,
        bankruptcyCloseDate,
      ];
}
