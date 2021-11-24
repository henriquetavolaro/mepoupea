import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/data/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/finance_balance.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';

class GetFinanceBalanceImpl implements GetFinanceBalanceUseCase{

  final NetworkService service;

  GetFinanceBalanceImpl(this.service);

  @override
  Future<Either<Exception, FinanceBalance>> call() async {
    try {
      final result = await service.getFinanceBalance();
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}