import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/finance/get_categorical_costs_impl.dart';
import 'package:mepoupeapp/domain/model/categorical_costs.dart';

import 'package:mockito/mockito.dart';

import '../onboarding/get_onboard_answer_test.mocks.dart';

class CategoricalCostsMock extends Mock implements CategoricalCosts{}

main(){

  final service = MockNetworkService();

  final useCase = GetCategoricalCostsImpl(service);

  test('should return Right CategoricalCosts', () async {
    when(service.getCategoricalCosts('date', 'context')).thenAnswer((_) async => CategoricalCostsMock());

    final result = await useCase('date', 'context');

    expect(result.fold(id, id), isA<CategoricalCosts>());
  });

  test('should return Left Exception', () async {
    when(service.getCategoricalCosts('date', 'context')).thenThrow((_) async => Exception());

    final result = await useCase('date', 'context');

    expect(result.fold(id, id), isA<Exception>());
  });

}