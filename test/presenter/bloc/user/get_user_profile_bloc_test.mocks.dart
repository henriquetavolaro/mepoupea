// Mocks generated by Mockito 5.0.16 from annotations
// in mepoupeapp/test/presenter/bloc/user/get_user_profile_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mepoupeapp/domain/model/user_profile.dart' as _i5;
import 'package:mepoupeapp/domain/use_cases/user.dart' as _i3;
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

/// A class which mocks [GetUserProfileUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetUserProfileUseCase extends _i1.Mock
    implements _i3.GetUserProfileUseCase {
  MockGetUserProfileUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<Exception, _i5.UserProfile>> call() =>
      (super.noSuchMethod(Invocation.method(#call, []),
              returnValue: Future<_i2.Either<Exception, _i5.UserProfile>>.value(
                  _FakeEither_0<Exception, _i5.UserProfile>()))
          as _i4.Future<_i2.Either<Exception, _i5.UserProfile>>);
  @override
  String toString() => super.toString();
}
