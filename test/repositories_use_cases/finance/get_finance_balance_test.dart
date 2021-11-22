import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/model/finance_balance.dart';
import 'package:mepoupeapp/repositories_use_cases_impl/finance/get_finance_balance_impl.dart';
import 'package:mockito/mockito.dart';

import '../onboarding/get_onboard_answer_test.mocks.dart';

class FinanceBalanceMock extends Mock implements FinanceBalance{}

main(){

  final service = MockNetworkService();

  final useCase = GetFinanceBalanceImpl(service);

  test('should return Right FinanceBalance', () async {
    when(service.getFinanceBalance()).thenAnswer((_) async => FinanceBalanceMock());

    final result = await useCase();

    expect(result.fold(id, id), isA<FinanceBalance>());
  });

  test('should return Left Exception', () async {
    when(service.getFinanceBalance()).thenThrow((_) async => Exception());

    final result = await useCase();

    expect(result.fold(id, id), isA<Exception>());
  });

}