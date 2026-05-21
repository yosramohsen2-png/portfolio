import '../models/review_model.dart';

/// Abstract contract for local data source handling reviews storage
abstract class ReviewsLocalDataSource {
  /// Retrieves cached reviews from local storage
  Future<List<ReviewModel>> getReviews();

  /// Saves a new review into local cache
  Future<void> cacheReview(ReviewModel review);

  /// Deletes a review from local cache
  Future<void> deleteReview(String id);
}
