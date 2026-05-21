import '../models/review_model.dart';

/// Abstract contract for local data source handling reviews storage
abstract class ReviewsLocalDataSource {
  /// Retrieves cached reviews from local storage
  Future<List<ReviewModel>> getReviews();

  /// Saves a new review into local cache
  Future<void> cacheReview(ReviewModel review);

  /// Caches a list of reviews in local storage
  Future<void> cacheReviews(List<ReviewModel> reviews);

  /// Deletes a review from local cache
  Future<void> deleteReview(String id);
}
