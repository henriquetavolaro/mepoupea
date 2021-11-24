import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/finance/patch_cost_list_details_impl.dart';
import 'package:mockito/mockito.dart';

import '../onboarding/get_onboard_answer_test.mocks.dart';

main() {
  final service = MockNetworkService();

  final useCase = PatchCostListDetailsImpl(service);


  test('should return Right int - code 200', () async {
    when(service.patchCostListDetail("costId", "category")).thenAnswer((
        _) async => 200);

    final result = await useCase("costId", "category");

    expect(result.fold(id, id), isA<int>());
  });

  test('should return Left Exception', () async {
    when(service.patchCostListDetail("costId", "category")).thenThrow((_) async =>
        Exception());

    final result = await useCase("costId", "category");

    expect(result.fold(id, id), isA<Exception>());
  });
}