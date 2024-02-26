import 'package:core/core.dart';
import 'package:domain/domain.dart';

class EmploymentSubState {
  final String? position;
  final String? placeOfWork;
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

  EmploymentSubState.fromClient(Client client)
      : position = client.position ?? '',
        positionError = '',
        placeOfWork = client.placeOfWork ?? '',
        placeOfWorkError = '',
        monthlyIncome = client.monthlyIncome,
        monthlyIncomeError = '',
        retiree = client.retiree,
        retireeError = '';

  EmploymentSubState copyWith({
    NullOrString? position,
    NullOrString? placeOfWork,
    NullOrInt? monthlyIncome,
    bool? retiree,
    String? positionError,
    String? placeOfWorkError,
    String? monthlyIncomeError,
    String? retireeError,
  }) {
    return EmploymentSubState(
      position: position != null ? position.value : this.position,
      positionError: positionError ?? this.positionError,
      placeOfWork: placeOfWork != null ? placeOfWork.value : this.placeOfWork,
      placeOfWorkError: placeOfWorkError ?? this.placeOfWorkError,
      monthlyIncome: monthlyIncome != null ? monthlyIncome.value : this.monthlyIncome,
      monthlyIncomeError: monthlyIncomeError ?? this.monthlyIncomeError,
      retiree: retiree ?? this.retiree,
      retireeError: retireeError ?? this.retireeError,
    );
  }
}
