import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mepoupeapp/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/categorical_costs.dart';
import 'package:mepoupeapp/domain/model/categorical_nath_limits_costs.dart';
import 'package:mepoupeapp/domain/model/costs_list.dart';
import 'package:mepoupeapp/domain/model/finance_balance.dart';
import 'package:mepoupeapp/domain/model/finance_goals.dart';
import 'package:mepoupeapp/domain/model/finance_selfie.dart';
import 'package:mepoupeapp/domain/model/onboard_model.dart';
import 'package:mepoupeapp/domain/model/recommendation_cards.dart';
import 'package:mepoupeapp/domain/model/recommendation_cards_categorical.dart';
import 'package:mepoupeapp/domain/model/user_profile.dart';
import 'package:mepoupeapp/domain/model/wealth_selfie.dart';
import 'package:mockito/mockito.dart';

class OnboardModelMock extends Mock implements OnboardModel {}

main() {
  final dio = Dio(BaseOptions());
  final dioAdapter = DioAdapter(dio: dio);
  dio.httpClientAdapter = dioAdapter;

  final service = NetworkService(dio);

  // ONBOARDING

  test("should return Onboarding Model", () async {
    const path = "/onboard/page-date/0/lastAnswerId";
    dioAdapter.onGet(path, (server) {
      server.reply(200, jsonOnboardModel);
    });
    final result = await service.getOnboardingAnswer("lastAnswerId");
    expect(result, isA<OnboardModel>());
  });

  test("should return a DioError", () async {
    const path = "/onboard/page-date/0/lastAnswerId";
    final dioError = DioError(
      error: {'message': 'Some beautiful error!'},
      requestOptions: RequestOptions(path: path),
      response: Response(
        statusCode: 500,
        requestOptions: RequestOptions(path: path),
      ),
      type: DioErrorType.response,
    );
    dioAdapter.onGet(path, (server) {
      server.throws(404, dioError);
    });
    final result = await service.getOnboardingAnswer("lastAnswerId");
    expect(result, throwsA(isA<DioError>()));
  });

  // USER

  test("should return User Profile", () async {
    const path = "/user/profile";
    dioAdapter.onGet(path, (server) {
      server.reply(200, jsonUser);
    });
    final result = await service.getUserProfile();
    expect(result, isA<UserProfile>());
  });

  // FINANCE

  test("should return FinanceSelfie", () async {
    const path = "/finance/selfie";
    dioAdapter.onGet(path, (server) {
      server.reply(200, jsonFinanceSelfie);
    });
    final result = await service.getFinancialSelfie("dataRange");
    expect(result, isA<FinanceSelfie>());
  });

  test("should return WealthSelfie", () async {
    const path = "/finance/wealth-selfie";
    dioAdapter.onGet(path, (server) {
      server.reply(200, jsonWealthSelfie);
    });
    final result = await service.getWealthSelfie();
    expect(result, isA<WealthSelfie>());
  });

  test("should return FinanceBalance", () async {
    const path = "/finance/balance";
    dioAdapter.onGet(path, (server) {
      server.reply(200, jsonFinanceBalance);
    });
    final result = await service.getFinanceBalance();
    expect(result, isA<FinanceBalance>());
  });

  // test("should return FinanceGoals", () async {
  //   const path = "/finance/goals";
  //   dioAdapter.onGet(
  //       path,
  //           (server) {
  //         server.reply(200, jsonFinanceGoals);
  //       });
  //   final result = await service.getFinanceGoals();
  //   expect(result, isA<FinanceGoals>());
  // });

  test("should return CategoricalCosts", () async {
    const path = "/finance/categorical-costs/context";
    dioAdapter.onGet(path, (server) {
      server.reply(200, jsonCategoricalCosts);
    });
    final result = await service.getCategoricalCosts("date", "context");
    expect(result, isA<CategoricalCosts>());
  });

  //
  // test("should return CostsList", () async {
  //   const path = "/finance/costs-list/context";
  //   dioAdapter.onGet(
  //       path,
  //           (server) {
  //         server.reply(200, jsonCostList);
  //       });
  //   final result = await service.getFinancialCosts("context");
  //   expect(result, isA<CostsList>());
  // });

  // test("should return CategoricalNathCostsDetails", () async {
  //   const path = "/finance/nath/limit/context";
  //   dioAdapter.onGet(
  //       path,
  //           (server) {
  //         server.reply(200, jsonCategoricalNathCostsDetails);
  //       });
  //   final result = await service.getFinanceNathLimit("context");
  //   expect(result, isA<CategoricalNathCostsDetails>());
  // });

  // RECOMMENDATION

  test("should return RecommendationsCards", () async {
    const path = "/recommendations/cards/context";
    dioAdapter.onGet(path, (server) {
      server.reply(200, jsonRecommendationCards);
    });
    final result = await service.getRecommendationCard("context");
    expect(result, isA<RecommendationsCards>());
  });

  test("should return RecommendationsCardsCategorical", () async {
    const path = "/recommendations/categorical/context";
    dioAdapter.onGet(path, (server) {
      server.reply(200, jsonRecommendationsCardsCategorical);
    });
    final result = await service.getRecommendationCardCategorical("context");
    expect(result, isA<RecommendationsCardsCategorical>());
  });
}

var jsonOnboardModel =
    "{\"pageId\": \"string\",\"cardType\": 0,\"texts\": [{\"text\": \"string\",\"fontSize\": 0.0,\"marker\": \"string\",\"textPosition\": \"string\"}],\"answerOptions\": [{\"answerId\": \"string\",\"text\": \"string\",\"fieldType\": 0,\"url\": \"string\"}]}";

var jsonUser =
    "{\"name\":\"string\",\"email\":\"string\",\"phone\":\"string\",\"imgUrl\":\"string\",\"createdAt\":\"string\",\"updatedAt\":\"string\"}";

var jsonFinanceSelfie =
    "{\"alone\": {\"likes\": 0.0,\"won\": {\"total\": 0.0},\"spent\": {\"total\": 0.0,\"value\": 0.0},\"invested\": {\"total\": 0.0,\"value\": 0.0}},\"withNath\": {\"likes\": 0.0,\"won\": {\"total\": 0.0},\"spent\": {\"total\": 0.0,\"value\": 0.0},\"invested\": {\"total\": 0.0,\"value\": 0.0}}}";

var jsonWealthSelfie =
    "{\"won\": {\"value\": 0.0,\"banks\": {\"bankId\": \"string\",\"icon\": \"string\"}},\"spent\": {\"value\": 0.0},\"invested\": {\"total\": 0.0,\"stockbrokers\": [{\"stockbrokerId\": \"string\",\"icon\": \"string\"}]}}";

var jsonFinanceBalance =
    "{\"likes\": 0.0,\"balance\": 0.0,\"total\": 0.0,\"lastHours\": 0.0}";

var jsonFinanceGoals =
    "{\"goals\":[{\"goalId\": \"string\",\"presentValue\": 0.0,\"goalValue\": 0.0,\"date\": \"string\",\"icon\": \"string\"}]}";

var jsonCategoricalCosts =
    "{\"total\": 0.0,\"budget\": 0.0,\"live\": {\"value\": 0.0,\"percentage\": 0.0},\"eat\": {\"value\": 0.0,\"percentage\": 0.0},\"health\": {\"value\": 0.0,\"percentage\": 0.0},\"transport\": {\"value\": 0.0,\"percentage\": 0.0},\"entertainment\": {\"value\": 0.0,\"percentage\": 0.0}}";

var jsonCostList =
    "{\"transactionsNumber\": 0.0,\"costs\": [{\"costId\": \"string\",\"icon\": \"string\",\"title\": \"string\",\"category\": \"string\",\"value\": 0.0,\"origin\": \"string\"}]}";

var jsonCategoricalNathCostsDetails =
    "{\"total\": 0.0,\"budget\": 0.0,\"live\": {\"value\": 0.0,\"percentage\": 0.0,\"limit\": 0.0},\"eat\": {\"value\": 0.0,\"percentage\": 0.0,\"limit\": 0.0},\"health\": {\"value\": 0.0,\"percentage\": 0.0,\"limit\": 0.0},\"transport\": {\"value\": 0.0,\"percentage\": 0.0,\"limit\": 0.0},\"entertainment\": {\"value\": 0.0,\"percentage\": 0.0,\"limit\": 0.0}}";

var jsonRecommendationCards =
    "{\"text\": \"string\",\"costValue\": 0.0,\"savedValue\": 0.0,\"icon\": \"string\",\"recommendationId\": \"string\"}";

var jsonRecommendationsCardsCategorical = "{\"category\": \"string\",\"text\": \"string\",\"details\": [\"string\"],\"recommendationId\": \"string\"}";
