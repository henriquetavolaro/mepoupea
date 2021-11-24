import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/model/finance_transaction_input.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/finance/post_finance_movement/bloc_post_finance_movement.dart';
import 'package:mepoupeapp/presenter/bloc/finance/post_finance_movement/state_post_finance_movement.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_finance_movement_test.mocks.dart';

@GenerateMocks([PostFinanceMovementUseCase])
main() {

  final useCase = MockPostFinanceMovementUseCase();

  final bloc = PostFinanceMovementBloc(useCase);

  final financeTransactionInput = FinanceTransactionInput(
      category: "category",
      subCategory: "typeByCategory",
      value: 0.0,
      date: "date",
      description: "description");

  test('should emit loading state and success state', () async {

    when(useCase(financeTransactionInput, "context")).thenAnswer((_) async => Right(200));
    bloc.add(PostFinanceMovementEvent(financeTransactionInput, "context"));
    expect(bloc.stream, emitsInOrder([
      isA<PostFinanceMovementLoadingState>(),
      isA<PostFinanceMovementSuccessState>()
    ]));
  });

  test('should emit loading state and error state', () async {

    when(useCase(financeTransactionInput, "context")).thenAnswer((_) async => Left(Exception()));
    bloc.add(PostFinanceMovementEvent(financeTransactionInput, "context"));
    expect(bloc.stream, emitsInOrder([
      isA<PostFinanceMovementLoadingState>(),
      isA<PostFinanceMovementErrorState>()
    ]));
  });

}