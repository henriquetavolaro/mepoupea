import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_financial_costs/bloc_get_financial_costs.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_financial_costs/state_get_financial_costs.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../repositories_use_cases/finance/get_finance_costs_test.dart';
import 'get_financial_costs_test.mocks.dart';

@GenerateMocks([GetFinancialCostsUseCase])
main() {

  final useCase = MockGetFinancialCostsUseCase();

  final bloc = GetFinancialCostsBloc(useCase);

  test('should emit loading state and success state', () async {

    when(useCase("context")).thenAnswer((_) async => Right(CostsListMock()));
    bloc.add(GetFinancialCostsEvent("context"));
    expect(bloc.stream, emitsInOrder([
      isA<GetFinancialCostsLoadingState>(),
      isA<GetFinancialCostsSuccessState>()
    ]));
  });

  test('should emit loading state and error state', () async {

    when(useCase("context")).thenAnswer((_) async => Left(Exception()));
    bloc.add(GetFinancialCostsEvent("context"));
    expect(bloc.stream, emitsInOrder([
      isA<GetFinancialCostsLoadingState>(),
      isA<GetFinancialCostsErrorState>()
    ]));
  });

}