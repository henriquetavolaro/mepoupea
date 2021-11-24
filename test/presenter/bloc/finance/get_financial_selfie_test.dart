import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_financial_selfie/bloc_get_financial_selfie.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_financial_selfie/state_get_financial_selfie.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../repositories_use_cases/finance/get_financial_selfie_test.dart';
import 'get_financial_selfie_test.mocks.dart';

@GenerateMocks([GetFinancialSelfieUseCase])
main() {

  final useCase = MockGetFinancialSelfieUseCase();

  final bloc = GetFinancialSelfieBloc(useCase);

  test('should emit loading state and success state', () async {

    when(useCase("context")).thenAnswer((_) async => Right(FinanceSelfieMock()));
    bloc.add(GetFinancialSelfieEvent("context"));
    expect(bloc.stream, emitsInOrder([
      isA<GetFinancialSelfieLoadingState>(),
      isA<GetFinancialSelfieSuccessState>()
    ]));
  });

  test('should emit loading state and error state', () async {

    when(useCase("context")).thenAnswer((_) async => Left(Exception()));
    bloc.add(GetFinancialSelfieEvent("context"));
    expect(bloc.stream, emitsInOrder([
      isA<GetFinancialSelfieLoadingState>(),
      isA<GetFinancialSelfieErrorState>()
    ]));
  });

}