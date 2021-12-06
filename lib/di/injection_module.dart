import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mepoupeapp/app_widget.dart';
import 'package:mepoupeapp/data/authentication/authentication_class.dart';
import 'package:mepoupeapp/data/datasource/network_service.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/finance/delete_finance_goal_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/finance/edit_finance_goals_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/finance/get_categorical_costs_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/finance/get_finance_balance_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/finance/get_finance_goals_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/finance/get_financial_costs_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/finance/get_financial_nath_limit_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/finance/get_financial_selfie_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/finance/get_wealth_selfie_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/finance/post_finance_goals_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/finance/post_finance_movement_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/finance/post_finance_nath_limit_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/onboarding/get_onboard_answers_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/onboarding/post_onboard_answers_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/recommendations/get_recommendation_card_categorical_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/recommendations/get_recommendation_card_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/user/delete_user_profile_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/user/edit_user_profile_impl.dart';
import 'package:mepoupeapp/data/repositories_use_cases_impl/user/get_user_profile_impl.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';
import 'package:mepoupeapp/domain/use_cases/onboarding.dart';
import 'package:mepoupeapp/domain/use_cases/recommendation.dart';
import 'package:mepoupeapp/domain/use_cases/user.dart';
import 'package:mepoupeapp/presenter/bloc/authentication/authentication_bloc.dart';
import 'package:mepoupeapp/presenter/bloc/finance/delete_finance_goal/bloc_delete_finance_goal.dart';
import 'package:mepoupeapp/presenter/bloc/finance/edit_finance_goals/bloc_edit_finance_goals.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_categorical_costs/bloc_get_categorical_costs.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_finance_balance/bloc_get_finance_balance.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_finance_goals/bloc_get_finance_goals.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_financial_costs/bloc_get_financial_costs.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_financial_nath_limit/bloc_get_financial_nath_limit.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_financial_selfie/bloc_get_financial_selfie.dart';
import 'package:mepoupeapp/presenter/bloc/finance/get_wealth_selfie/bloc_get_wealth_selfie.dart';
import 'package:mepoupeapp/presenter/bloc/finance/post_finance_goals/bloc_post_finance_goals.dart';
import 'package:mepoupeapp/presenter/bloc/finance/post_finance_movement/bloc_post_finance_movement.dart';
import 'package:mepoupeapp/presenter/bloc/finance/post_finance_nath_limit/bloc_post_finance_nath_limit.dart';
import 'package:mepoupeapp/presenter/bloc/onboarding/get_onboard_answers/bloc_get_onboard_answers.dart';
import 'package:mepoupeapp/presenter/bloc/onboarding/post_onboard_answers/bloc_post_onboard_answers.dart';
import 'package:mepoupeapp/presenter/bloc/recommendations/get_recommendation_card/bloc_get_recommendation_card.dart';
import 'package:mepoupeapp/presenter/bloc/recommendations/get_recommendation_card_categorical/bloc_get_recommendation_card_categorical.dart';
import 'package:mepoupeapp/presenter/bloc/user/delete_user_profile/bloc_delete_user_profile.dart';
import 'package:mepoupeapp/presenter/bloc/user/edit_user_profile/bloc_edit_user_profile.dart';
import 'package:mepoupeapp/presenter/bloc/user/get_user_profile/bloc_get_user_profile.dart';
import 'package:mepoupeapp/utils/secure_storage.dart';

final sl = GetIt.instance;

void setupServiceLocator(){

  sl.registerSingleton(Dio());
  sl.registerSingleton(SecureStorage());
  sl.registerLazySingleton<NetworkService>(() => NetworkService(sl(), sl()));

  // final auth = FirebaseAuth.instance;
  // auth.setPersistence(Persistence.SESSION);

  //AUTHENTICATION
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => AuthenticationClass(sl(), sl()));
  sl.registerLazySingleton(() => AuthenticationBloc(sl()));


  //USE CASES
  //FINANCE
  sl.registerFactory<DeleteFinanceGoalsUseCase>(() => DeleteFinanceGoalImpl(sl()));
  sl.registerFactory<EditFinanceGoalsUseCase>(() => EditFinanceGoalsImpl(sl()));
  sl.registerFactory<GetCategoricalCostsUseCase>(() => GetCategoricalCostsImpl(sl()));
  sl.registerFactory<GetFinanceBalanceUseCase>(() => GetFinanceBalanceImpl(sl()));
  sl.registerFactory<GetFinanceGoalsUseCase>(() => GetFinanceGoalsImpl(sl()));
  sl.registerFactory<GetFinancialCostsUseCase>(() => GetFinancialCostsImpl(sl()));
  sl.registerFactory<GetFinancialNathLimitUseCase>(() => GetFinancialNathLimitImpl(sl()));
  sl.registerFactory<GetFinancialSelfieUseCase>(() => GetFinancialSelfieImpl(sl()));
  sl.registerFactory<GetWealthSelfieUseCase>(() => GetWealthSelfieImpl(sl()));
  sl.registerFactory<PostFinanceGoalsUseCase>(() => PostFinanceGoalsImpl(sl()));
  sl.registerFactory<PostFinanceMovementUseCase>(() => PostFinanceMovementImpl(sl()));
  sl.registerFactory<PostFinanceNathLimitUseCase>(() => PostFinanceNathLimitImpl(sl()));
  //ONBOARDING
  sl.registerFactory<GetOnboardAnswersUseCase>(() => GetOnboardAnswersImpl(sl()));
  sl.registerFactory<PostOnboardAnswersUseCase>(() => PostOnboardAnswersImpl(sl()));
  //RECOMMENDATIONS
  sl.registerFactory<GetRecommendationsCardsCategoricalUseCase>(() => GetRecommendationCardCategoricalImpl(sl()));
  sl.registerFactory<GetRecommendationCardUseCase>(() => GetRecommendationCardImpl(sl()));
  //USER
  sl.registerFactory<DeleteUserProfileUseCase>(() => DeleteUserProfileImpl(sl()));
  sl.registerFactory<EditUserProfileUseCase>(() => EditUserProfileImpl(sl()));
  sl.registerFactory<GetUserProfileUseCase>(() => GetUserProfileImpl(sl()));

  //BLOCS
  //FINANCE
  sl.registerSingleton(DeleteFinanceGoalsBloc(sl()));
  sl.registerSingleton(EditFinanceGoalsBloc(sl()));
  sl.registerSingleton(GetCategoricalCostsBloc(sl()));
  sl.registerSingleton(GetFinanceBalanceBloc(sl()));
  sl.registerSingleton(GetFinanceGoalsBloc(sl()));
  sl.registerSingleton(GetFinancialCostsBloc(sl()));
  sl.registerSingleton(GetFinancialNathLimitBloc(sl()));
  sl.registerSingleton(GetFinancialSelfieBloc(sl()));
  sl.registerSingleton(GetWealthSelfieBloc(sl()));
  sl.registerSingleton(PostFinanceGoalsBloc(sl()));
  sl.registerSingleton(PostFinanceMovementBloc(sl()));
  sl.registerSingleton(PostFinanceNathLimitBloc(sl()));
  //ONBOARDING
  sl.registerSingleton(GetOnboardAnswersBloc(sl()));
  sl.registerSingleton(PostOnboardAnswersBloc(sl()));
  //RECOMMENDATIONS
  sl.registerSingleton(GetRecommendationCardBloc(sl()));
  sl.registerSingleton(GetRecommendationCardCategoricalBloc(sl()));
  //USER
  sl.registerSingleton(DeleteUserProfileBloc(sl()));
  sl.registerSingleton(EditUserProfileBloc(sl()));
  sl.registerSingleton(GetUserProfileBloc(sl()));


  //NAVIGATOR KEY
  sl.registerSingleton(GlobalKey<NavigatorState>());

}