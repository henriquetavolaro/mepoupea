import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/use_cases/user.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/user/delete_user_profile/bloc_delete_user_profile.dart';
import 'package:mepoupeapp/presenter/bloc/user/delete_user_profile/state_delete_user_profile.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_user_profile_bloc_test.mocks.dart';

@GenerateMocks([DeleteUserProfileUseCase])
main(){

  final useCase = MockDeleteUserProfileUseCase();

  final bloc = DeleteUserProfileBloc(useCase);

  test('should emit loading state and success state', () async {

    when(useCase()).thenAnswer((_) async => Right(200));
    bloc.add(DeleteUserProfileEvent());
    expect(bloc.stream, emitsInOrder([
      isA<DeleteUserProfileLoadingState>(),
      isA<DeleteUserProfileSuccessState>()
    ]));
  });

  test('should emit loading state and errorf state', () async {

    when(useCase()).thenAnswer((_) async => Left(Exception()));
    bloc.add(DeleteUserProfileEvent());
    expect(bloc.stream, emitsInOrder([
      isA<DeleteUserProfileLoadingState>(),
      isA<DeleteUserProfileErrorState>()
    ]));
  });

}