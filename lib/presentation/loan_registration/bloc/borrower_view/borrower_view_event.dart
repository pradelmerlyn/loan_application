part of 'borrower_view_bloc.dart';

enum HousingField {
  mortgage,
  subordinate,
  propertyTax,
  hoa,
  homeIns,
  mortgageIns,
  other,
}

abstract class BorrowerViewEvent extends Equatable {
  const BorrowerViewEvent();
  @override
  List<Object> get props => [];
}

class ToggleSSN extends BorrowerViewEvent {
  const ToggleSSN();
}

class SsnEdited extends BorrowerViewEvent {
  final String input;
  const SsnEdited(this.input);
  @override
  List<Object> get props => [input];
}

class HousingExpenseChanged extends BorrowerViewEvent {
  final HousingField field;
  final String text; // raw text from the field

  const HousingExpenseChanged({required this.field, required this.text});

  @override
  List<Object> get props => [field, text];
}
