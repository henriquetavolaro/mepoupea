import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_wealth_selfie/bloc_get_wealth_selfie.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_wealth_selfie/state_get_wealth_selfie.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../repositories_use_cases/finance/get_wealth_selfie_test.dart';
import 'get_wealth_selfie_test.mocks.dart';

@GenerateMocks([GetWealthSelfieUseCase])
main() {

  final useCase = MockGetWealthSelfieUseCase();

  final bloc = GetWealthSelfieBloc(useCase);

  test('should emit loading state and success state', () async {

    when(useCase()).thenAnswer((_) async => Right(WealthSelfieMock()));
    bloc.add(GetWealthSelfieEvent());
    expect(bloc.stream, emitsInOrder([
      isA<GetWealthSelfieLoadingState>(),
      isA<GetWealthSelfieSuccessState>()
    ]));
  });

  test('should emit loading state and error state', () async {

    when(useCase()).thenAnswer((_) async => Left(Exception()));
    bloc.add(GetWealthSelfieEvent());
    expect(bloc.stream, emitsInOrder([
      isA<GetWealthSelfieLoadingState>(),
      isA<GetWealthSelfieErrorState>()
    ]));
  });
}