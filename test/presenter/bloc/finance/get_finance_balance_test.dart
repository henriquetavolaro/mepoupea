import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_finance_balance/bloc_get_finance_balance.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_finance_balance/state_get_finance_balance.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../repositories_use_cases/finance/get_finance_balance_test.dart';
import 'get_finance_balance_test.mocks.dart';

@GenerateMocks([GetFinanceBalanceUseCase])
main() {

  final useCase = MockGetFinanceBalanceUseCase();

  final bloc = GetFinanceBalanceBloc(useCase);

  test('should emit loading state and success state', () async {

    when(useCase()).thenAnswer((_) async => Right(FinanceBalanceMock()));
    bloc.add(GetFinanceBalanceEvent());
    expect(bloc.stream, emitsInOrder([
      isA<GetFinanceBalanceLoadingState>(),
      isA<GetFinanceBalanceSuccessState>()
    ]));
  });

  test('should emit loading state and error state', () async {

    when(useCase()).thenAnswer((_) async => Left(Exception()));
    bloc.add(GetFinanceBalanceEvent());
    expect(bloc.stream, emitsInOrder([
      isA<GetFinanceBalanceLoadingState>(),
      isA<GetFinanceBalanceErrorState>()
    ]));
  });

}