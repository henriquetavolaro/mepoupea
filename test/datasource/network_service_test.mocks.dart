// Mocks generated by Mockito 5.0.16 from annotations
// in mepoupeapp/test/datasource/network_service_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i2;
import 'package:mepoupeapp/utils/secure_storage.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeFlutterSecureStorage_0 extends _i1.Fake
    implements _i2.FlutterSecureStorage {}

/// A class which mocks [SecureStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockSecureStorage extends _i1.Mock implements _i3.SecureStorage {
  MockSecureStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FlutterSecureStorage get storage => (super.noSuchMethod(
      Invocation.getter(#storage),
      returnValue: _FakeFlutterSecureStorage_0()) as _i2.FlutterSecureStorage);
  @override
  String get keyToken =>
      (super.noSuchMethod(Invocation.getter(#keyToken), returnValue: '')
          as String);
  @override
  _i4.Future<dynamic> setToken(String? token) =>
      (super.noSuchMethod(Invocation.method(#setToken, [token]),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<String?> getToken() =>
      (super.noSuchMethod(Invocation.method(#getToken, []),
          returnValue: Future<String?>.value()) as _i4.Future<String?>);
  @override
  _i4.Future<dynamic> removeToken() =>
      (super.noSuchMethod(Invocation.method(#removeToken, []),
          returnValue: Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  String toString() => super.toString();
}
