
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/user.dart';
import 'package:mepoupeapp/presenter/bloc/user/get_user_profile/state_get_user_profile.dart';

import '../../app_events.dart';

class GetUserProfileBloc
    extends Bloc<AppEvents, GetUserProfileState> {
  final GetUserProfileUseCase useCase;

  GetUserProfileBloc(this.useCase)
      : super(GetUserProfileInitialState());

  @override
  Stream<GetUserProfileState> mapEventToState(AppEvents event) async* {
    if (event is GetUserProfileEvent) {
      yield GetUserProfileLoadingState();
      final result = await useCase();
      print('result: ${result.toString()}');
      yield result.fold((l) => GetUserProfileErrorState(l),
              (r) => GetUserProfileSuccessState(r));
    }
  }
}