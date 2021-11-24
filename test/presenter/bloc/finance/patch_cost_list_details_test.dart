
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/finance/patch_cost_list_details/bloc_patch_cost_list_details.dart';
import 'package:mepoupeapp/presenter/bloc/finance/patch_cost_list_details/state_patch_cost_list_details.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'patch_cost_list_details_test.mocks.dart';

@GenerateMocks([PatchCostListDetailsUseCase])
main() {

  final useCase = MockPatchCostListDetailsUseCase();

  final bloc = PatchCostListDetailsBloc(useCase);

  test('should emit loading state and success state', () async {

    when(useCase("costId", "category")).thenAnswer((_) async => Right(200));
    bloc.add(PatchCostListDetailsEvent("costId", "category"));
    expect(bloc.stream, emitsInOrder([
      isA<PatchCostListDetailsLoadingState>(),
      isA<PatchCostListDetailsSuccessState>()
    ]));
  });

  test('should emit loading state and errorf state', () async {

    when(useCase("costId", "category")).thenAnswer((_) async => Left(Exception()));
    bloc.add(PatchCostListDetailsEvent("costId", "category"));
    expect(bloc.stream, emitsInOrder([
      isA<PatchCostListDetailsLoadingState>(),
      isA<PatchCostListDetailsErrorState>()
    ]));
  });


}