import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/user.dart';
import 'package:mepoupeapp/presenter/bloc/user/edit_user_profile/state_edit_user_profile.dart';

import '../../app_events.dart';

class EditUserProfileBloc
    extends Bloc<AppEvents, EditUserProfileState> {
  final EditUserProfileUseCase useCase;

  EditUserProfileBloc(this.useCase)
      : super(EditUserProfileInitialState());

  @override
  Stream<EditUserProfileState> mapEventToState(AppEvents event) async* {
    if (event is EditUserProfileEvent) {
      yield EditUserProfileLoadingState();
      final result = await useCase(event.userProfileEditable);
      yield result.fold((l) => EditUserProfileErrorState(l),
              (r) => EditUserProfileSuccessState(r));
    }
  }
}
