import '../../../../core/error/failure.dart';
import '../../../../core/utils/either.dart';
import '../entities/review_entity.dart';
import '../repositories/reviews_repository.dart';

/// UseCase for fetching all reviews from the repository
class GetReviewsUseCase {
  final ReviewsRepository _repository;

  GetReviewsUseCase(this._repository);

  /// Executes the use case
  Future<Either<Failure, List<ReviewEntity>>> call() {
    return _repository.getReviews();
  }
}
