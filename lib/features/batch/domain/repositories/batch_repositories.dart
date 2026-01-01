import 'package:dartz/dartz.dart';
import 'package:bin_buddy/core/error/failures.dart';
import 'package:bin_buddy/features/batch/domain/entities/batch_entity.dart';

abstract class IBatchRepository {
  /// Get all batches
  Future<Either<Failure, List<BatchEntity>>> getAllBatches();

  /// Get a batch by ID
  Future<Either<Failure, BatchEntity>> getBatchById(String batchId);

  /// Create a new batch
  Future<Either<Failure, bool>> createBatch(BatchEntity batch);

  /// Update an existing batch
  Future<Either<Failure, bool>> updateBatch(BatchEntity batch);

  /// Delete a batch by ID
  Future<Either<Failure, bool>> deleteBatch(String batchId);
}
