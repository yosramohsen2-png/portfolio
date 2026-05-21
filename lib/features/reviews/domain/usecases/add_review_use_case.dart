import '../../../../core/error/failure.dart';
import '../../../../core/utils/either.dart';
import '../entities/review_entity.dart';
import '../repositories/reviews_repository.dart';

/// UseCase for adding a new review to the repository
class AddReviewUseCase {
  final ReviewsRepository _repository;

  AddReviewUseCase(this._repository);

  /// Executes the use case
  Future<Either<Failure, void>> call(ReviewEntity review) {
    return _repository.addReview(review);
  }
}
