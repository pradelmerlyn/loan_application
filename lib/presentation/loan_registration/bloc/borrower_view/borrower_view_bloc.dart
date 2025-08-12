import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'borrower_view_event.dart';
part 'borrower_view_state.dart';

class BorrowerViewBloc extends Bloc<BorrowerViewEvent, BorrowerViewState> {
  BorrowerViewBloc() : super(const BorrowerViewState()) {
    // SSN events
    on<ToggleSSN>(_onToggleSSN);
    on<SsnEdited>(_onSsnEdited);

    // Housing expense events
    on<HousingExpenseChanged>(_onHousingChanged);
  }

  /* ==================== SSN handlers ==================== */

  void _onToggleSSN(ToggleSSN event, Emitter<BorrowerViewState> emit) {
    emit(state.copyWith(obscureSSN: !state.obscureSSN));
  }

  void _onSsnEdited(SsnEdited event, Emitter<BorrowerViewState> emit) {
    emit(state.copyWith(ssn: _digitsOnly(event.input)));
  }

  /* ==================== Housing handlers ==================== */

  void _onHousingChanged(
    HousingExpenseChanged event,
    Emitter<BorrowerViewState> emit,
  ) {
    // Update the specific field with the raw text from UI
    BorrowerViewState next = state;
    switch (event.field) {
      case HousingField.mortgage:
        next = next.copyWith(mortgage: event.text);
        break;
      case HousingField.subordinate:
        next = next.copyWith(subordinate: event.text);
        break;
      case HousingField.propertyTax:
        next = next.copyWith(propertyTax: event.text);
        break;
      case HousingField.hoa:
        next = next.copyWith(hoa: event.text);
        break;
      case HousingField.homeIns:
        next = next.copyWith(homeIns: event.text);
        break;
      case HousingField.mortgageIns:
        next = next.copyWith(mortgageIns: event.text);
        break;
      case HousingField.other:
        next = next.copyWith(other: event.text);
        break;
    }

    // Recompute total using parsed numeric values from all fields
    final total = _toAmount(next.mortgage) +
        _toAmount(next.subordinate) +
        _toAmount(next.propertyTax) +
        _toAmount(next.hoa) +
        _toAmount(next.homeIns) +
        _toAmount(next.mortgageIns) +
        _toAmount(next.other);

    emit(
      next.copyWith(totalHousingFormatted: _fmtCurrency0(total)),
    );
  }

  /* ==================== Helpers & Validators ==================== */

  // Digits only (for SSN etc.)
  String _digitsOnly(String v) => v.replaceAll(RegExp(r'[^0-9]'), '');

  // Parse currency-like input (allows $, commas, dots)
  double _toAmount(String s) {
    final t = s.replaceAll(RegExp(r'[^0-9.]'), '');
    if (t.isEmpty) return 0;
    return double.tryParse(t) ?? 0;
  }

  // Format currency without decimals (e.g., $12,345)
  String _fmtCurrency0(num v) {
    final str = v.toStringAsFixed(0);
    final withCommas = str.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
    return '\$$withCommas';
  }
}
