import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'deposit_agreement_events.dart';
part 'deposit_agreement_state.dart';

class DepositAgreementBloc extends Bloc<DepositAgreementEvent, DepositAgreementState> {
  final AppRouter _appRouter;
  final AddDepositUseCase _addDepositUseCase;

  DepositAgreementBloc({
    required AppRouter appRouter,
    required AddDepositUseCase addDepositUseCase,
    required String clientId,
  })  : _appRouter = appRouter,
        _addDepositUseCase = addDepositUseCase,
        super(DepositAgreementState.initial(clientId: clientId)) {
    on<UpdateDepositType>(_onUpdateDepositType);
    on<UpdateAgreementNumber>(_onUpdateAgreementNumber);
    on<UpdateAmount>(_onUpdateUpdateAmount);
    on<UpdateInterest>(_onUpdateInterest);
    on<UpdateAgreementDates>(_onUpdateAgreementDates);
    on<SubmitForm>(_onSubmitForm);
  }

  void _onUpdateDepositType(
    UpdateDepositType event,
    Emitter<DepositAgreementState> emit,
  ) {
    emit(state.copyWith(
      depositType: event.depositType,
    ));
  }

  void _onUpdateAgreementNumber(
    UpdateAgreementNumber event,
    Emitter<DepositAgreementState> emit,
  ) {
    emit(state.copyWith(
      agreementNumber: event.agreementNumber,
    ));
  }

  void _onUpdateUpdateAmount(
    UpdateAmount event,
    Emitter<DepositAgreementState> emit,
  ) {
    emit(state.copyWith(
      amount: NullOrBigInt(event.amount),
    ));
  }

  void _onUpdateInterest(
    UpdateInterest event,
    Emitter<DepositAgreementState> emit,
  ) {
    emit(state.copyWith(
      interest: NullOrInt(event.interest),
    ));
  }

  void _onUpdateAgreementDates(
    UpdateAgreementDates event,
    Emitter<DepositAgreementState> emit,
  ) {
    final DateTime? begin = event.begin ?? state.agreementBegin;
    final DateTime? end = event.end ?? state.agreementEnd;

    String? beginError = begin != null ? '' : null;
    String? endError = end != null ? '' : null;
    String agreementsDatesMismatchError = '';

    if (begin != null && end != null && !end.isAfter(begin)) {
      agreementsDatesMismatchError = LocaleKeys.deposit_errors_agreementsDatesMismatchError.translate();
    }

    emit(state.copyWith(
      agreementBegin: begin,
      agreementBeginError: beginError,
      agreementEnd: end,
      agreementEndError: endError,
      agreementsDatesMismatchError: agreementsDatesMismatchError,
    ));
  }

  Future<void> _onSubmitForm(
    SubmitForm event,
    Emitter<DepositAgreementState> emit,
  ) async {
    final String depositTypeError = ValidationService.notEmptyDepositType(state.depositType) ?? '';
    final String agreementNumberError = ValidationService.notEmpty(state.agreementNumber) ?? '';
    final String agreementBeginError = ValidationService.notEmptyDateTime(state.agreementBegin) ?? '';
    final String agreementEndError = ValidationService.notEmptyDateTime(state.agreementEnd) ?? '';
    final String amountError = ValidationService.notEmptyBigInt(state.amount) ?? '';
    final String interestError = ValidationService.notEmptyInt(state.interest) ?? '';

    final bool noErrors = compareAllTo(<String>[
      depositTypeError,
      agreementNumberError,
      agreementBeginError,
      agreementEndError,
      amountError,
      interestError,
    ], '');

    emit(state.copyWith(
      depositTypeError: depositTypeError,
      agreementNumberError: agreementNumberError,
      agreementBeginError: agreementBeginError,
      agreementEndError: agreementEndError,
      amountError: amountError,
      interestError: interestError,
    ));

    if (noErrors) {
      final DepositDTO dto = DepositDTO(
        clientId: state.clientId,
        type: state.depositType!,
        agreementNumber: state.agreementNumber,
        agreementBegin: state.agreementBegin!,
        agreementEnd: state.agreementEnd!,
        amount: state.amount!,
        interest: state.interest!,
      );

      final Deposit deposit = await _addDepositUseCase.execute((
        clientId: state.clientId,
        data: dto,
      ));

      await _appRouter.pop<Deposit>(deposit);
    }
  }
}
