import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/model/wealth_selfie.dart';
import 'package:mepoupeapp/repositories_use_cases_impl/finance/get_wealth_selfie_impl.dart';
import 'package:mockito/mockito.dart';

import '../onboarding/get_onboard_answer_test.mocks.dart';

class WealthSelfieMock extends Mock implements WealthSelfie{}

main(){

  final service = MockNetworkService();

  final useCase = GetWealthSelfieImpl(service);

  test('should return Right WealthSelfie', () async {
    when(service.getWealthSelfie()).thenAnswer((_) async => WealthSelfieMock());

    final result = await useCase();

    expect(result.fold(id, id), isA<WealthSelfie>());
  });

  test('should return Left Exception', () async {
    when(service.getWealthSelfie()).thenThrow((_) async => Exception());

    final result = await useCase();

    expect(result.fold(id, id), isA<Exception>());
  });

}