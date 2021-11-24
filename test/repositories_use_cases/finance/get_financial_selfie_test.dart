import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/finance/get_financial_selfie_impl.dart';
import 'package:mepoupeapp/domain/model/finance_selfie.dart';
import 'package:mockito/mockito.dart';

import '../onboarding/get_onboard_answer_test.mocks.dart';

class FinanceSelfieMock extends Mock implements FinanceSelfie{}

main(){

  final service = MockNetworkService();

  final useCase = GetFinancialSelfieImpl(service);

  test('should return Right FinanceSelfie', () async {
    when(service.getFinancialSelfie("date")).thenAnswer((_) async => FinanceSelfieMock());

    final result = await useCase("date");

    expect(result.fold(id, id), isA<FinanceSelfie>());
  });

  test('should return Left Exception', () async {
    when(service.getFinancialSelfie("date")).thenThrow((_) async => Exception());

    final result = await useCase("date");

    expect(result.fold(id, id), isA<Exception>());
  });

}