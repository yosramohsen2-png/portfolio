import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/review_model.dart';
import 'reviews_local_data_source.dart';

/// Implementation of ReviewsLocalDataSource using SharedPreferences
class ReviewsLocalDataSourceImpl implements ReviewsLocalDataSource {
  static const String _reviewsKey = 'cached_reviews';
  final SharedPreferences _prefs;

  ReviewsLocalDataSourceImpl(this._prefs);

  @override
  Future<List<ReviewModel>> getReviews() async {
    final jsonString = _prefs.getString(_reviewsKey);
    if (jsonString != null) {
      try {
        final List<dynamic> jsonList = json.decode(jsonString);
        final list = jsonList
            .map((json) => ReviewModel.fromJson(json))
            .toList();

        // Filter out any default/dummy reviews from previous database migrations
        final cleanedList = list
            .where((r) => r.id != 'default_review_1' && r.id != 'dummy')
            .toList();

        if (cleanedList.length != list.length) {
          await _saveReviewsToPrefs(cleanedList);
        }

        return cleanedList;
      } catch (_) {
        return [];
      }
    } else {
      // First time app launch: start empty
      return [];
    }
  }

  @override
  Future<void> cacheReview(ReviewModel review) async {
    final currentReviews = await getReviews();
    // Add new review at the beginning so it appears first
    currentReviews.insert(0, review);
    await _saveReviewsToPrefs(currentReviews);
  }

  Future<void> _saveReviewsToPrefs(List<ReviewModel> reviews) async {
    final List<Map<String, dynamic>> jsonList = reviews
        .map((r) => r.toJson())
        .toList();
    await _prefs.setString(_reviewsKey, json.encode(jsonList));
  }

  @override
  Future<void> deleteReview(String id) async {
    final currentReviews = await getReviews();
    currentReviews.removeWhere((r) => r.id == id);
    await _saveReviewsToPrefs(currentReviews);
  }
}
