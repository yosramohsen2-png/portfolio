import '../../../../core/error/failure.dart';
import '../../../../core/utils/either.dart';
import '../repositories/reviews_repository.dart';

/// UseCase to delete a review from the repository
class DeleteReviewUseCase {
  final ReviewsRepository _repository;

  DeleteReviewUseCase(this._repository);

  /// Executes the usecase to delete a review by its ID
  Future<Either<Failure, void>> call(String id) {
    return _repository.deleteReview(id);
  }
}
