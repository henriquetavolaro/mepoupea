import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_categorical_costs/bloc_get_categorical_costs.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_categorical_costs/state_get_categorical_costs.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../datasource/network_service_test.dart';
import '../../../repositories_use_cases/finance/get_categorical_costs_test.dart';
import 'get_categorical_costs_test.mocks.dart';

@GenerateMocks([GetCategoricalCostsUseCase])
main() {

  final useCase = MockGetCategoricalCostsUseCase();

  final bloc = GetCategoricalCostsBloc(useCase);

  test('should emit loading state and success state', () async {

    when(useCase("date", "context")).thenAnswer((_) async => Right(CategoricalCostsMock()));
    bloc.add(GetCategoricalCostsEvent("date", "context"));
    expect(bloc.stream, emitsInOrder([
      isA<GetCategoricalCostsLoadingState>(),
      isA<GetCategoricalCostsSuccessState>()
    ]));
  });

  test('should emit loading state and error state', () async {

    when(useCase("date", "context")).thenAnswer((_) async => Left(Exception()));
    bloc.add(GetCategoricalCostsEvent("date", "context"));
    expect(bloc.stream, emitsInOrder([
      isA<GetCategoricalCostsLoadingState>(),
      isA<GetCategoricalCostsErrorState>()
    ]));
  });

}