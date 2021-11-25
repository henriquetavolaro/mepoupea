import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mepoupeapp/domain/model/answer_model.dart';
import 'package:mepoupeapp/domain/model/categorical_costs.dart';
import 'package:mepoupeapp/domain/model/categorical_nath_limits_costs.dart';
import 'package:mepoupeapp/domain/model/costs_list.dart';
import 'package:mepoupeapp/domain/model/finance_balance.dart';
import 'package:mepoupeapp/domain/model/finance_goal.dart';
import 'package:mepoupeapp/domain/model/finance_goal_input.dart';
import 'package:mepoupeapp/domain/model/finance_goals.dart';
import 'package:mepoupeapp/domain/model/finance_selfie.dart';
import 'package:mepoupeapp/domain/model/finance_transaction_input.dart';
import 'package:mepoupeapp/domain/model/onboard_model.dart';
import 'package:mepoupeapp/domain/model/recommendation_cards.dart';
import 'package:mepoupeapp/domain/model/recommendation_cards_categorical.dart';
import 'package:mepoupeapp/domain/model/user_profile.dart';
import 'package:mepoupeapp/domain/model/user_profile_editable.dart';
import 'package:mepoupeapp/domain/model/wealth_selfie.dart';
import 'package:mepoupeapp/utils/secure_storage.dart';

class NetworkService {
  final Dio dio;
  final SecureStorage storage;

  NetworkService(this.dio, this.storage) {
    dio.options.baseUrl =
        "http://me-poupe-lucy-backend.sa-east-1.elasticbeanstalk.com";
    // dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.connectTimeout = 10000;
    dio.options.responseType = ResponseType.plain;
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
      //     final jwt = await storage.getToken();
      // options.headers.addAll({'Authorization': 'Bearer $jwt'});
      print('base ${options.baseUrl}');
      print("PATH: ${options.path}");
      print("headers: ${options.headers}");
      return handler.next(options);
    }, onResponse: (response, handler) {
      print(
          "RESPONSE: ${response.statusCode} / PATH: ${response.requestOptions.path}");
      return handler.next(response);
    }, onError: (DioError e, handler) {
      print(
          "ERROR: ${e.response?.statusCode} / PATH: ${e.requestOptions.path}");
      return handler.next(e);
    }));
  }

  // USER

  Future<UserProfile> getUserProfile() async {
    try {
      var response = await dio.get('/user/profile');
      print('response ${response.data}');
      return UserProfile.fromJson(response.data);
    } on DioError catch (e) {
      print('e $e');
      throw Exception(e);
    }
  }

  Future<int> putUserProfile(UserProfileEditable userProfileEditable) async {
    var json = userProfileEditable.toJson();
    try {
      var response = await dio.put('/user/profile', data: json);
      return response.statusCode!;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  // Future<int> postImageProfile() async {
  //   try {
  //     var response = await dio.post('/user/img-profile');
  //     return response.statusCode!;
  //   } on DioError catch (e) {
  //     throw Exception(e.message);
  //   }
  // }
  //
  // Future<int> postImageSelfie() async {
  //   try {
  //     var response = await dio.post('user/img-selfie');
  //     return response.statusCode!;
  //   } on DioError catch (e) {
  //     throw Exception(e.message);
  //   }
  // }

  Future<int> deleteUserProfile() async {
    try {
      var response = await dio.delete('/user/profile');
      return response.statusCode!;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  // ONBOARDING

  Future<OnboardModel> getOnboardingAnswer(String lastAnswerId) async {
    try {
      var response = await dio.get('/onboard/page-date/0/$lastAnswerId');
      return OnboardModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<int> postOnboardingAnswer(AnswerModel answerModel) async {
    var json = answerModel.toJson();
    try {
      var response = await dio.post('/onboard/answer', data: json);
      return response.statusCode!;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  // FINANCES

  Future<FinanceSelfie> getFinancialSelfie(String dataRange) async {
    try {
      var response = await dio.get('/finance/selfie');
      return FinanceSelfie.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<WealthSelfie> getWealthSelfie() async {
    try {
      var response = await dio.get('/finance/wealth-selfie');
      return WealthSelfie.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<FinanceBalance> getFinanceBalance() async {
    try {
      var response = await dio.get('/finance/balance');
      return FinanceBalance.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<FinanceGoals> getFinanceGoals() async {
    try {
      var response = await dio.get('/finance/goals');
      return FinanceGoals.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<CategoricalCosts> getCategoricalCosts(
      String date, String context) async {
    try {
      var response = await dio.get('/finance/categorical-costs/$context',
          queryParameters: {'date': date});
      return CategoricalCosts.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<CostsList> getFinancialCosts(String context) async {
    try {
      var response = await dio.get('/finance/costs-list/$context');
      return CostsList.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<CategoricalNathLimitsCosts> getFinanceNathLimit(String context) async {
    try {
      var response = await dio.get('/finance/nath/limit/$context');
      return CategoricalNathLimitsCosts.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<int> postFinanceGoals(FinanceGoalInput financeGoalInput) async {
    var json = financeGoalInput.toJson();
    try {
      var response = await dio.post('/finance/goals', data: json);
      return response.statusCode!;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<int> postFinanceNathLimit(
      CategoricalNathLimitsCosts categoricalNathLimitsCosts,
      String context) async {
    var json = categoricalNathLimitsCosts.toJson();
    try {
      var response = await dio.post('/finance/nath/limit/$context', data: json);
      return response.statusCode!;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<int> postFinanceMovement(
      FinanceTransactionInput financeTransactionInput, String context) async {
    var json = financeTransactionInput.toJson();
    try {
      var response = await dio.post('/finance/$context', data: json);
      return response.statusCode!;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<int> putFinanceGoals(FinanceGoal financeGoal) async {
    var json = financeGoal.toJson();
    try {
      var response = await dio.put('finance/goals', data: json);
      return response.statusCode!;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<int> patchCostListDetail(String costId, String category) async {
    try {
      var response = await dio.patch('/finance/cost/$costId',
          queryParameters: {'category': category});
      return response.statusCode!;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<int> deleteFinanceGoals(String goalId) async {
    try {
      var response = await dio.delete('/finance/goals/$goalId');
      return response.statusCode!;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  // RECOMMENDATIONS

  Future<RecommendationsCards> getRecommendationCard(String context) async {
    try {
      var response = await dio.get('/recommendations/cards/$context');
      return RecommendationsCards.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<RecommendationsCardsCategorical> getRecommendationCardCategorical(
      String context) async {
    try {
      var response = await dio.get('/recommendations/categorical/$context');
      return RecommendationsCardsCategorical.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
