import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/data/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/finance_selfie.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';

class GetFinancialSelfieImpl implements GetFinancialSelfieUseCase {

  final NetworkService service;

  GetFinancialSelfieImpl(this.service);

  @override
  Future<Either<Exception, FinanceSelfie>> call(String date) async {
    try {
      final result = await service.getFinancialSelfie(date);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}