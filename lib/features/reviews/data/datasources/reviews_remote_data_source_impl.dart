import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/review_model.dart';
import 'reviews_remote_data_source.dart';

/// Implementation of ReviewsRemoteDataSource using Supabase
class ReviewsRemoteDataSourceImpl implements ReviewsRemoteDataSource {
  final SupabaseClient _supabaseClient;

  ReviewsRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<List<ReviewModel>> getReviews() async {
    final response = await _supabaseClient
        .from('reviews')
        .select()
        .order('createdAt', ascending: false);

    final List<dynamic> data = response as List<dynamic>;
    return data
        .map((json) => ReviewModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> addReview(ReviewModel review) async {
    await _supabaseClient
        .from('reviews')
        .insert(review.toJson());
  }

  @override
  Future<void> deleteReview(String id) async {
    await _supabaseClient
        .from('reviews')
        .delete()
        .eq('id', id);
  }
}
