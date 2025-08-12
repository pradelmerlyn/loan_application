part of 'borrower_view_bloc.dart';

class BorrowerViewState extends Equatable {
  // SSN
  final bool obscureSSN;
  final String ssn; 

  final String mortgage;
  final String subordinate;
  final String propertyTax;
  final String hoa;
  final String homeIns;
  final String mortgageIns;
  final String other;

  final String totalHousingFormatted;

  const BorrowerViewState({
    this.obscureSSN = false,
    this.ssn = '',
    this.mortgage = '',
    this.subordinate = '',
    this.propertyTax = '',
    this.hoa = '',
    this.homeIns = '',
    this.mortgageIns = '',
    this.other = '',
    this.totalHousingFormatted = '\$0',
  });

  BorrowerViewState copyWith({
    bool? obscureSSN,
    String? ssn,
    String? mortgage,
    String? subordinate,
    String? propertyTax,
    String? hoa,
    String? homeIns,
    String? mortgageIns,
    String? other,
    String? totalHousingFormatted,
  }) {
    return BorrowerViewState(
      obscureSSN: obscureSSN ?? this.obscureSSN,
      ssn: ssn ?? this.ssn,
      mortgage: mortgage ?? this.mortgage,
      subordinate: subordinate ?? this.subordinate,
      propertyTax: propertyTax ?? this.propertyTax,
      hoa: hoa ?? this.hoa,
      homeIns: homeIns ?? this.homeIns,
      mortgageIns: mortgageIns ?? this.mortgageIns,
      other: other ?? this.other,
      totalHousingFormatted:
          totalHousingFormatted ?? this.totalHousingFormatted,
    );
  }

  @override
  List<Object> get props => [
        obscureSSN,
        ssn,
        mortgage,
        subordinate,
        propertyTax,
        hoa,
        homeIns,
        mortgageIns,
        other,
        totalHousingFormatted,
      ];
}
