import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mepoupeapp/domain/use_cases/user.dart';
import 'package:mepoupeapp/presenter/bloc/user/delete_user_profile/state_delete_user_profile.dart';

import '../../app_events.dart';

class DeleteUserProfileBloc
    extends Bloc<AppEvents, DeleteUserProfileState> {
  final DeleteUserProfileUseCase useCase;

  DeleteUserProfileBloc(this.useCase)
      : super(DeleteUserProfileInitialState());

  @override
  Stream<DeleteUserProfileState> mapEventToState(AppEvents event) async* {
    if (event is DeleteUserProfileEvent) {
      yield DeleteUserProfileLoadingState();
      final result = await useCase();
      yield result.fold((l) => DeleteUserProfileErrorState(l),
              (r) => DeleteUserProfileSuccessState(r));
    }
  }
}
