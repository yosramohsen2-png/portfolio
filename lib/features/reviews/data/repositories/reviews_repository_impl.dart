import '../../../../core/error/failure.dart';
import '../../../../core/utils/either.dart';
import '../../domain/entities/review_entity.dart';
import '../../domain/repositories/reviews_repository.dart';
import '../datasources/reviews_local_data_source.dart';
import '../models/review_model.dart';

/// Implementation of ReviewsRepository connecting Data and Domain layers
class ReviewsRepositoryImpl implements ReviewsRepository {
  final ReviewsLocalDataSource _localDataSource;

  ReviewsRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<ReviewEntity>>> getReviews() async {
    try {
      final models = await _localDataSource.getReviews();
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } catch (_) {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addReview(ReviewEntity review) async {
    try {
      final model = ReviewModel.fromEntity(review);
      await _localDataSource.cacheReview(model);
      return const Right(null);
    } catch (_) {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteReview(String id) async {
    try {
      await _localDataSource.deleteReview(id);
      return const Right(null);
    } catch (_) {
      return const Left(CacheFailure());
    }
  }
}
