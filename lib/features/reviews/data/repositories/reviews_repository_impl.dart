import '../../../../core/error/failure.dart';
import '../../../../core/utils/either.dart';
import '../../domain/entities/review_entity.dart';
import '../../domain/repositories/reviews_repository.dart';
import '../datasources/reviews_local_data_source.dart';
import '../datasources/reviews_remote_data_source.dart';
import '../models/review_model.dart';

/// Implementation of ReviewsRepository connecting Data and Domain layers
class ReviewsRepositoryImpl implements ReviewsRepository {
  final ReviewsLocalDataSource _localDataSource;
  final ReviewsRemoteDataSource _remoteDataSource;

  ReviewsRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<Either<Failure, List<ReviewEntity>>> getReviews() async {
    try {
      // Try fetching latest reviews from remote database with a 4-second timeout
      final remoteModels = await _remoteDataSource
          .getReviews()
          .timeout(const Duration(seconds: 4));

      // Cache fresh remote reviews locally
      await _localDataSource.cacheReviews(remoteModels);

      final entities = remoteModels.map((m) => m.toEntity()).toList();
      return Right(entities);
    } catch (_) {
      // Offline fallback: load cached reviews from SharedPreferences if network fails or times out
      try {
        final localModels = await _localDataSource.getReviews();
        final entities = localModels.map((m) => m.toEntity()).toList();
        return Right(entities);
      } catch (cacheError) {
        return const Left(CacheFailure('Failed to load reviews from cache.'));
      }
    }
  }

  @override
  Future<Either<Failure, void>> addReview(ReviewEntity review) async {
    try {
      final model = ReviewModel.fromEntity(review);
      // Cache locally first for instant reactivity
      await _localDataSource.cacheReview(model);
      // Save to Supabase remote database
      await _remoteDataSource.addReview(model);
      return const Right(null);
    } catch (_) {
      return const Left(ServerFailure('Failed to submit review to server.'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteReview(String id) async {
    try {
      // Delete locally first
      await _localDataSource.deleteReview(id);
      // Delete from Supabase remote database
      await _remoteDataSource.deleteReview(id);
      return const Right(null);
    } catch (_) {
      return const Left(ServerFailure('Failed to delete review from server.'));
    }
  }
}
