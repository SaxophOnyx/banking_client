import 'package:banking_client/core/core.dart';
import 'package:banking_client/domain/domain.dart';

class EmploymentSubState {
  final String position;
  final String placeOfWork;
  final int? monthlyIncome;
  final bool? retiree;

  final String positionError;
  final String placeOfWorkError;
  final String monthlyIncomeError;
  final String retireeError;

  const EmploymentSubState({
    required this.position,
    required this.positionError,
    required this.placeOfWork,
    required this.placeOfWorkError,
    required this.monthlyIncome,
    required this.monthlyIncomeError,
    required this.retiree,
    required this.retireeError,
  });

  const EmploymentSubState.empty()
      : position = '',
        positionError = '',
        placeOfWork = '',
        placeOfWorkError = '',
        monthlyIncome = null,
        monthlyIncomeError = '',
        retiree = null,
        retireeError = '';

  EmploymentSubState.fromUser(User user)
      : position = user.position ?? '',
        positionError = '',
        placeOfWork = user.placeOfWork ?? '',
        placeOfWorkError = '',
        monthlyIncome = user.monthlyIncome,
        monthlyIncomeError = '',
        retiree = user.retiree,
        retireeError = '';

  EmploymentSubState copyWith({
    String? position,
    String? placeOfWork,
    NullOrInt? monthlyIncome,
    bool? retiree,
    String? positionError,
    String? placeOfWorkError,
    String? monthlyIncomeError,
    String? retireeError,
  }) {
    return EmploymentSubState(
      position: position ?? this.position,
      positionError: positionError ?? this.positionError,
      placeOfWork: placeOfWork ?? this.placeOfWork,
      placeOfWorkError: placeOfWorkError ?? this.placeOfWorkError,
      monthlyIncome: monthlyIncome != null ? monthlyIncome.value : this.monthlyIncome,
      monthlyIncomeError: monthlyIncomeError ?? this.monthlyIncomeError,
      retiree: retiree ?? this.retiree,
      retireeError: retireeError ?? this.retireeError,
    );
  }
}
