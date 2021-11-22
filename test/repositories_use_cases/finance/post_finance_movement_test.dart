import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/model/finance_transaction_input.dart';
import 'package:mepoupeapp/repositories_use_cases_impl/finance/post_finance_movement_impl.dart';
import 'package:mockito/mockito.dart';

import '../onboarding/get_onboard_answer_test.mocks.dart';

main() {
  final service = MockNetworkService();

  final useCase = PostFinanceMovementImpl(service);

  final financeTransactionInput = FinanceTransactionInput(
      category: "category",
      typeByCategory: "typeByCategory",
      value: 0.0,
      date: "date",
      description: "description");

  test('should return Right int - code 200', () async {
    when(service.postFinanceMovement(financeTransactionInput, "context")).thenAnswer((
        _) async => 200);

    final result = await useCase(financeTransactionInput, "context");

    expect(result.fold(id, id), isA<int>());
  });

  test('should return Left Exception', () async {
    when(service.postFinanceMovement(financeTransactionInput, "context"))
        .thenThrow((_) async => Exception());

    final result = await useCase(financeTransactionInput, "context");

    expect(result.fold(id, id), isA<Exception>());
  });
}
