import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mepoupeapp/domain/model/user_profile_editable.dart';
import 'package:mepoupeapp/domain/use_cases/user.dart';
import 'package:mepoupeapp/presenter/bloc/app_events.dart';
import 'package:mepoupeapp/presenter/bloc/user/edit_user_profile/bloc_edit_user_profile.dart';
import 'package:mepoupeapp/presenter/bloc/user/edit_user_profile/state_edit_user_profile.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'edit_user_profile_bloc_test.mocks.dart';

@GenerateMocks([EditUserProfileUseCase])
main(){

  final useCase = MockEditUserProfileUseCase();

  final bloc = EditUserProfileBloc(useCase);

  final userProfileEditable = UserProfileEditable(name: "name", email: "email", phone: "phone");

  test('should emit loading state and success state', () async {

    when(useCase(userProfileEditable)).thenAnswer((_) async => Right(200));
    bloc.add(EditUserProfileEvent(userProfileEditable));
    expect(bloc.stream, emitsInOrder([
      isA<EditUserProfileLoadingState>(),
      isA<EditUserProfileSuccessState>()
    ]));
  });

  test('should emit loading state and errorf state', () async {

    when(useCase(userProfileEditable)).thenAnswer((_) async => Left(Exception()));
    bloc.add(EditUserProfileEvent(userProfileEditable));
    expect(bloc.stream, emitsInOrder([
      isA<EditUserProfileLoadingState>(),
      isA<EditUserProfileErrorState>()
    ]));
  });

}