
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/model/categorical_nath_limits_costs.dart';
import 'package:mepoupeapp/repositories_use_cases_impl/finance/get_financial_nath_limit_impl.dart';
import 'package:mockito/mockito.dart';

import '../onboarding/get_onboard_answer_test.mocks.dart';

class CategoricalNathCostsDetailsMock extends Mock implements CategoricalNathCostsDetails{}

main(){

  final service = MockNetworkService();

  final useCase = GetFinancialNathLimitImpl(service);

  test('should return Right CategoricalNathCostsDetails', () async {
    when(service.getFinanceNathLimit("context")).thenAnswer((_) async => CategoricalNathCostsDetailsMock());

    final result = await useCase("context");

    expect(result.fold(id, id), isA<CategoricalNathCostsDetails>());
  });

  test('should return Left Exception', () async {
    when(service.getFinanceNathLimit("context")).thenThrow((_) async => Exception());

    final result = await useCase("context");

    expect(result.fold(id, id), isA<Exception>());
  });

}