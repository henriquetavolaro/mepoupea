import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/datasource/network_service.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';

class PatchCostListDetailsImpl implements PatchCostListDetailsUseCase {

  final NetworkService service;

  PatchCostListDetailsImpl(this.service);

  @override
  Future<Either<Exception, int>> call(String costId, String category)async {
    try {
      final result = await service.patchCostListDetail(costId, category);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

}