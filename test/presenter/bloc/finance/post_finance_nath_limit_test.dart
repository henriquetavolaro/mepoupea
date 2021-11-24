import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/model/categorical_nath_limits_costs.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/finance/post_finance_nath_limit/bloc_post_finance_nath_limit.dart';
import 'package:mepoupeapp/presenter/bloc/finance/post_finance_nath_limit/state_post_finance_nath_limit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_finance_nath_limit_test.mocks.dart';

@GenerateMocks([PostFinanceNathLimitUseCase])
main() {

  final useCase = MockPostFinanceNathLimitUseCase();

  final bloc = PostFinanceNathLimitBloc(useCase);

  final categoricalNathLimitCostDetails = CategoricalNathCostsDetails(
      value: 0.0, percentage: 0.0, limit: 0.0);

  final categoricalNathLimitCost = CategoricalNathLimitsCosts(
      total: 0.0,
      budget: 0.0,
      live: categoricalNathLimitCostDetails,
      eat: categoricalNathLimitCostDetails,
      health: categoricalNathLimitCostDetails,
      transport: categoricalNathLimitCostDetails,
      entertainment: categoricalNathLimitCostDetails);


  test('should emit loading state and success state', () async {

    when(useCase(categoricalNathLimitCost, "context")).thenAnswer((_) async => Right(200));
    bloc.add(PostFinanceNathLimitEvent(categoricalNathLimitCost, "context"));
    expect(bloc.stream, emitsInOrder([
      isA<PostFinanceNathLimitLoadingState>(),
      isA<PostFinanceNathLimitSuccessState>()
    ]));
  });

  test('should emit loading state and error state', () async {

    when(useCase(categoricalNathLimitCost, "context")).thenAnswer((_) async => Left(Exception()));
    bloc.add(PostFinanceNathLimitEvent(categoricalNathLimitCost, "context"));
    expect(bloc.stream, emitsInOrder([
      isA<PostFinanceNathLimitLoadingState>(),
      isA<PostFinanceNathLimitErrorState>()
    ]));
  });

}