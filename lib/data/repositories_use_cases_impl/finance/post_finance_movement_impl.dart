import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/data/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/finance_transaction_input.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';

class PostFinanceMovementImpl implements PostFinanceMovementUseCase {

  final NetworkService service;

  PostFinanceMovementImpl(this.service);

  @override
  Future<Either<Exception, int>> call(FinanceTransactionInput spent, String context) async {
    try {
      final result = await service.postFinanceMovement(spent, context);
      return Right(result);

    } catch (e) {
      return Left(Exception(e));
    }
  }
}