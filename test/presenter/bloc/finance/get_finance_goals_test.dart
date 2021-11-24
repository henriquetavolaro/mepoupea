import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_finance_goals/bloc_get_finance_goals.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_finance_goals/state_get_finance_goals.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../datasource/network_service_test.dart';
import '../../../repositories_use_cases/finance/get_finance_goals_test.dart';
import 'get_finance_goals_test.mocks.dart';

@GenerateMocks([GetFinanceGoalsUseCase])
main() {

  final useCase = MockGetFinanceGoalsUseCase();

  final bloc = GetFinanceGoalsBloc(useCase);

  test('should emit loading state and success state', () async {

    when(useCase()).thenAnswer((_) async => Right(FinanceGoalsMock()));
    bloc.add(GetFinanceGoalsEvent());
    expect(bloc.stream, emitsInOrder([
      isA<GetFinanceGoalsLoadingState>(),
      isA<GetFinanceGoalsSuccessState>()
    ]));
  });

  test('should emit loading state and error state', () async {

    when(useCase()).thenAnswer((_) async => Left(Exception()));
    bloc.add(GetFinanceGoalsEvent());
    expect(bloc.stream, emitsInOrder([
      isA<GetFinanceGoalsLoadingState>(),
      isA<GetFinanceGoalsErrorState>()
    ]));
  });

}