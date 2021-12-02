

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mepoupeapp/data/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/answer_model.dart';
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
import 'package:mepoupeapp/domain/model/user_profile_editable.dart';
import 'package:mepoupeapp/domain/model/wealth_selfie.dart';
import 'package:mepoupeapp/utils/secure_storage.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_service_test.mocks.dart';

class OnboardModelMock extends Mock implements OnboardModel {}

@GenerateMocks([SecureStorage])
main() {
  final dio = Dio(BaseOptions());
  final dioAdapter = DioAdapter(dio: dio);
  dio.httpClientAdapter = dioAdapter;
  final storage = MockSecureStorage();
  final service = NetworkService(dio, storage);

  // ONBOARDING

  test("should return Onboarding Model", () async {
    when(storage.getToken()).thenAnswer((_) =>  Future.value('12345'));
    const path = "/onboard/page-date/0/lastAnswerId";
    dioAdapter.onGet(path, (server) {
      server.reply(200, jsonDecode(jsonOnboardModel));
    });
    final result = await service.getOnboardingAnswer("lastAnswerId");
    expect(result, isA<OnboardModel>());
  });

  // test("should return a DioError", () async {
  //   const path = "/onboard/page-date/0/lastAnswerId";
  //   final dioError = DioError(
  //     error: {'message': 'Some beautiful error!'},
  //     requestOptions: RequestOptions(path: path),
  //     response: Response(
  //       statusCode: 404,
  //       requestOptions: RequestOptions(path: path),
  //     ),
  //     type: DioErrorType.response,
  //   );
  //   dioAdapter.onGet(path, (server) {
  //     server.throws(404, dioError);
  //   });
  //   final result = await service.getOnboardingAnswer("lastAnswerId");
  //   expect(result, isA<OnboardModel>());
  // });

  // final answerModel = AnswerModel(pageId: "1");
  //
  // test("should return 200", () async {
  //   when(storage.getToken()).thenAnswer((_) =>  Future.value('12345'));
  //   const path = "/onboard/answer";
  //   dioAdapter.onPost(path, (server) {
  //     server.reply(200, answerModel);
  //   },
  //   data: answerModel);
  //   final result = await service.postOnboardingAnswer(answerModel);
  //   expect(result, isA<int>());
  // });

  // USER

  test("should return User Profile", () async {
    when(storage.getToken()).thenAnswer((_) =>  Future.value('12345'));
    const path = "/user/profile";
    dioAdapter.onGet(path, (server) {
      server.reply(200, jsonDecode(jsonUser));
    });
    final result = await service.getUserProfile();
    expect(result, isA<UserProfile>());
  });

  // final userProfileEditable = UserProfileEditable(name: "name", email: "email", phone: "phone");
  //
  // test("should return 200", () async {
  //   when(storage.getToken()).thenAnswer((_) =>  Future.value('12345'));
  //   const path = "/user/profile";
  //   dioAdapter.onPut(path, (server) {
  //     server.reply(200, {200});
  //   });
  //   final result = await service.putUserProfile(userProfileEditable);
  //   expect(result, isA<int>());
  // });

  // FINANCE

  test("should return FinanceSelfie", () async {
    when(storage.getToken()).thenAnswer((_) =>  Future.value('12345'));
    const path = "/finance/selfie";
    dioAdapter.onGet(path, (server) {
      server.reply(200, jsonDecode(jsonFinanceSelfie));
    });
    final result = await service.getFinancialSelfie("dataRange");
    expect(result, isA<FinanceSelfie>());
  });

  test("should return WealthSelfie", () async {
    when(storage.getToken()).thenAnswer((_) =>  Future.value('12345'));
    const path = "/finance/wealth-selfie";
    dioAdapter.onGet(path, (server) {
      server.reply(200, jsonDecode(jsonWealthSelfie));
    });
    final result = await service.getWealthSelfie();
    expect(result, isA<WealthSelfie>());
  });

  test("should return FinanceBalance", () async {
    when(storage.getToken()).thenAnswer((_) =>  Future.value('12345'));
    const path = "/finance/balance";
    dioAdapter.onGet(path, (server) {
      server.reply(200, jsonDecode(jsonFinanceBalance));
    });
    final result = await service.getFinanceBalance();
    expect(result, isA<FinanceBalance>());
  });

  test("should return FinanceGoals", () async {
    when(storage.getToken()).thenAnswer((_) =>  Future.value('12345'));
    const path = "/finance/goals";
    dioAdapter.onGet(path, (server) {
          server.reply(200, jsonDecode(jsonFinanceGoals));
        });
    final result = await service.getFinanceGoals();
    expect(result, isA<FinanceGoals>());
  });

  test("should return CategoricalCosts", () async {
    when(storage.getToken()).thenAnswer((_) =>  Future.value('12345'));
    const path = "/finance/categorical-costs/context";
    dioAdapter.onGet(path, (server) {
      server.reply(200, jsonDecode(jsonCategoricalCosts));
    });
    final result = await service.getCategoricalCosts("date", "context");
    expect(result, isA<CategoricalCosts>());
  });


  test("should return CostsList", () async {
    when(storage.getToken()).thenAnswer((_) =>  Future.value('12345'));
    const path = "/finance/costs-list/context";
    dioAdapter.onGet(path, (server) {
          server.reply(200, jsonDecode(jsonCostList));
        });
    final result = await service.getFinancialCosts("context");
    expect(result, isA<CostsList>());
  });

  test("should return CategoricalNathLimitsCosts", () async {
    when(storage.getToken()).thenAnswer((_) =>  Future.value('12345'));
    const path = "/finance/nath/limit/context";
    dioAdapter.onGet(path, (server) {
          server.reply(200, jsonDecode(jsonCategoricalNathLimitsCosts));
        });
    final result = await service.getFinanceNathLimit("context");
    expect(result, isA<CategoricalNathLimitsCosts>());
  });

  // RECOMMENDATION

  test("should return RecommendationsCards", () async {
    when(storage.getToken()).thenAnswer((_) =>  Future.value('12345'));
    const path = "/recommendations/cards/context";
    dioAdapter.onGet(path, (server) {
      server.reply(200, jsonDecode(jsonRecommendationCards));
    });
    final result = await service.getRecommendationCard("context");
    expect(result, isA<RecommendationsCards>());
  });

  test("should return RecommendationsCardsCategorical", () async {
    when(storage.getToken()).thenAnswer((_) =>  Future.value('12345'));
    const path = "/recommendations/categorical/context";
    dioAdapter.onGet(path, (server) {
      server.reply(200, jsonDecode(jsonRecommendationsCardsCategorical));
    });
    final result = await service.getRecommendationCardCategorical("context");
    expect(result, isA<RecommendationsCardsCategorical>());
  });
}

var jsonOnboardModel =
    "{\"pageId\": \"string\",\"cardType\": 0,\"texts\": [{\"text\": \"string\",\"fontSize\": 0.0,\"marker\": \"string\",\"textPosition\": \"string\"}],\"answerOptions\": [{\"answerId\": \"string\",\"text\": \"string\",\"fieldType\": 0,\"url\": \"string\"}]}";

var jsonUser = "{\"name\": null,\"email\": \"12345\",\"phone\": null,\"isActive\": false,\"createdAt\": \"2021-11-23T16:15:53.151000\",\"updatedAt\": null,\"TESTING\": null}";
    // "{\"name\":\"string\",\"email\":\"string\",\"phone\":\"string\",\"imgUrl\":\"string\",\"createdAt\":\"string\",\"updatedAt\":\"string\"}";

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

var jsonCategoricalNathLimitsCosts =
    "{\"total\": 0.0,\"budget\": 0.0,\"live\": {\"value\": 0.0,\"percentage\": 0.0,\"limit\": 0.0},\"eat\": {\"value\": 0.0,\"percentage\": 0.0,\"limit\": 0.0},\"health\": {\"value\": 0.0,\"percentage\": 0.0,\"limit\": 0.0},\"transport\": {\"value\": 0.0,\"percentage\": 0.0,\"limit\": 0.0},\"entertainment\": {\"value\": 0.0,\"percentage\": 0.0,\"limit\": 0.0}}";

var jsonRecommendationCards =
    "{\"text\": \"string\",\"costValue\": 0.0,\"savedValue\": 0.0,\"icon\": \"string\",\"recommendationId\": \"string\"}";

var jsonRecommendationsCardsCategorical = "{\"category\": \"string\",\"text\": \"string\",\"details\": [\"string\"],\"recommendationId\": \"string\"}";

