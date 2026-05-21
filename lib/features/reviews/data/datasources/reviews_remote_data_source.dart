import '../models/review_model.dart';

/// Contract for the remote data source handling reviews
abstract class ReviewsRemoteDataSource {
  /// Fetches all reviews from the remote database
  Future<List<ReviewModel>> getReviews();

  /// Uploads a new review to the remote database
  Future<void> addReview(ReviewModel review);

  /// Deletes a review by its ID from the remote database
  Future<void> deleteReview(String id);
}
