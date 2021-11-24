import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/finance/post_finance_nath_limit_impl.dart';
import 'package:mepoupeapp/domain/model/categorical_nath_limits_costs.dart';
import 'package:mockito/mockito.dart';

import '../onboarding/get_onboard_answer_test.mocks.dart';

main() {
  final service = MockNetworkService();

  final useCase = PostFinanceNathLimitImpl(service);

  final categoricalNathLimitCostDetails = CategoricalNathCostsDetails(
      value: 0.0, percentage: 0.0, limit: 0.0);

  final categoricalNathLimitCost = CategoricalNathLimitsCosts(
      total: 0.0,
      budget: 0.0,
      live: categoricalNathLimitCostDetails,
      eat: categoricalNathLimitCostDetails,
      health: categoricalNathLimitCostDetails,
      transport: categoricalNathLimitCostDetails,
      entertainment: categoricalNathLimitCostDetails);


  test('should return Right int - code 200', () async {
    when(service.postFinanceNathLimit(categoricalNathLimitCost, "context"))
        .thenAnswer((_) async => 200);

    final result = await useCase(categoricalNathLimitCost, "context");

    expect(result.fold(id, id), isA<int>());
  });

  test('should return Left Exception', () async {
    when(service.postFinanceNathLimit(categoricalNathLimitCost, "context"))
        .thenThrow((_) async => Exception());

    final result = await useCase(categoricalNathLimitCost, "context");

    expect(result.fold(id, id), isA<Exception>());
  });
}
