import 'package:dartz/dartz.dart';
import 'package:bin_buddy/core/error/failures.dart';

// Info: For use case with parameter
abstract interface class UsecaseWithParms<SucessType, Params> {
  Future<Either<Failure, SucessType>> call(Params params);
}

// Info: For use case without parameter
abstract interface class UsecaseWithoutParms<SuccessType> {
  Future<Either<Failure, SuccessType>> call();
}
