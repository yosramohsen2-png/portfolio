import '../../../../core/error/failure.dart';
import '../../../../core/utils/either.dart';
import '../entities/review_entity.dart';

/// Abstract repository contract for reviews in the Domain layer
abstract class ReviewsRepository {
  /// Retrieves reviews as Domain Entities wrapped in Either
  Future<Either<Failure, List<ReviewEntity>>> getReviews();

  /// Adds a new review entity to storage
  Future<Either<Failure, void>> addReview(ReviewEntity review);

  /// Deletes a review by its ID
  Future<Either<Failure, void>> deleteReview(String id);
}
