// Mocks generated by Mockito 5.0.16 from annotations
// in mepoupeapp/test/presenter/bloc/finance/delete_finance_goal_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mepoupeapp/domain/use_cases/finance.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [DeleteFinanceGoalsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteFinanceGoalsUseCase extends _i1.Mock
    implements _i3.DeleteFinanceGoalsUseCase {
  MockDeleteFinanceGoalsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<Exception, int>> call(String? goalId) =>
      (super.noSuchMethod(Invocation.method(#call, [goalId]),
              returnValue: Future<_i2.Either<Exception, int>>.value(
                  _FakeEither_0<Exception, int>()))
          as _i4.Future<_i2.Either<Exception, int>>);
  @override
  String toString() => super.toString();
}
