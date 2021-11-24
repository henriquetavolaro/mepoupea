import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_financial_nath_limit/bloc_get_financial_nath_limit.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_financial_nath_limit/state_get_financial_nath_limit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../repositories_use_cases/finance/get_financial_nath_limit_test.dart';
import 'get_financial_nath_limit_test.mocks.dart';

@GenerateMocks([GetFinancialNathLimitUseCase])
main() {

  final useCase = MockGetFinancialNathLimitUseCase();

  final bloc = GetFinancialNathLimitBloc(useCase);

  test('should emit loading state and success state', () async {

    when(useCase("context")).thenAnswer((_) async => Right(CategoricalNathLimitsCostsMock()));
    bloc.add(GetFinancialNathLimitEvent("context"));
    expect(bloc.stream, emitsInOrder([
      isA<GetFinancialNathLimitLoadingState>(),
      isA<GetFinancialNathLimitSuccessState>()
    ]));
  });

  test('should emit loading state and error state', () async {

    when(useCase("context")).thenAnswer((_) async => Left(Exception()));
    bloc.add(GetFinancialNathLimitEvent("context"));
    expect(bloc.stream, emitsInOrder([
      isA<GetFinancialNathLimitLoadingState>(),
      isA<GetFinancialNathLimitErrorState>()
    ]));
  });

}