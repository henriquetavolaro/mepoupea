import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/model/costs_list.dart';
import 'package:mepoupeapp/domain/model/finance_goals.dart';
import 'package:mepoupeapp/repositories_use_cases_impl/finance/get_finance_goals_impl.dart';
import 'package:mepoupeapp/repositories_use_cases_impl/finance/get_financial_costs_impl.dart';
import 'package:mockito/mockito.dart';

import '../onboarding/get_onboard_answer_test.mocks.dart';

class CostsListMock extends Mock implements CostsList{}

main(){

  final service = MockNetworkService();

  final useCase = GetFinancialCostsImpl(service);

  test('should return Right CostsList', () async {
    when(service.getFinancialCosts("context")).thenAnswer((_) async => CostsListMock());

    final result = await useCase("context");

    expect(result.fold(id, id), isA<CostsList>());
  });

  test('should return Left Exception', () async {
    when(service.getFinancialCosts("context")).thenThrow((_) async => Exception());

    final result = await useCase("context");

    expect(result.fold(id, id), isA<Exception>());
  });

}