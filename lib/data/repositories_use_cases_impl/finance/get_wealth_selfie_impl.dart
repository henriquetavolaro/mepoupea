import 'package:dartz/dartz.dart';
import 'package:mepoupeapp/data/datasource/network_service.dart';
import 'package:mepoupeapp/domain/model/wealth_selfie.dart';
import 'package:mepoupeapp/domain/use_cases/finance.dart';

class GetWealthSelfieImpl implements GetWealthSelfieUseCase {

  final NetworkService service;

  GetWealthSelfieImpl(this.service);

  @override
  Future<Either<Exception, WealthSelfie>> call() async {
    try {
      final result = await service.getWealthSelfie();
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}