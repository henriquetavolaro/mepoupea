import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/use_cases/user.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/user/get_user_profile/bloc_get_user_profile.dart';
import 'package:mepoupeapp/presenter/bloc/user/get_user_profile/state_get_user_profile.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../repositories_use_cases/user/get_user_profile_test.dart';
import 'get_user_profile_bloc_test.mocks.dart';

@GenerateMocks([GetUserProfileUseCase])
main(){

  final useCase = MockGetUserProfileUseCase();

  final bloc = GetUserProfileBloc(useCase);

  test('should emit loading state and success state', () async {

    when(useCase()).thenAnswer((_) async => Right(UserProfileMock()));
    bloc.add(GetUserProfileEvent());
    expect(bloc.stream, emitsInOrder([
      isA<GetUserProfileLoadingState>(),
      isA<GetUserProfileSuccessState>()
    ]));
  });

  test('should emit loading state and errorf state', () async {

    when(useCase()).thenAnswer((_) async => Left(Exception()));
    bloc.add(GetUserProfileEvent());
    expect(bloc.stream, emitsInOrder([
      isA<GetUserProfileLoadingState>(),
      isA<GetUserProfileErrorState>()
    ]));
  });

}