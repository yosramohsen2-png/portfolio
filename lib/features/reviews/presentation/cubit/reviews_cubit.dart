import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/review_entity.dart';
import '../../domain/usecases/add_review_use_case.dart';
import '../../domain/usecases/get_reviews_use_case.dart';
import '../../domain/usecases/delete_review_use_case.dart';
import 'reviews_state.dart';

/// Cubit managing the state of Reviews section
class ReviewsCubit extends Cubit<ReviewsState> {
  final GetReviewsUseCase _getReviewsUseCase;
  final AddReviewUseCase _addReviewUseCase;
  final DeleteReviewUseCase _deleteReviewUseCase;

  ReviewsCubit({
    required GetReviewsUseCase getReviewsUseCase,
    required AddReviewUseCase addReviewUseCase,
    required DeleteReviewUseCase deleteReviewUseCase,
  })  : _getReviewsUseCase = getReviewsUseCase,
        _addReviewUseCase = addReviewUseCase,
        _deleteReviewUseCase = deleteReviewUseCase,
        super(const ReviewsInitial());

  /// Loads all reviews from use case
  Future<void> loadReviews() async {
    emit(const ReviewsLoading());
    final result = await _getReviewsUseCase();
    result.fold(
      (failure) => emit(ReviewsFailure(failure.message)),
      (reviews) => emit(ReviewsSuccess(reviews)),
    );
  }

  /// Adds a new review and reloads the list instantly
  Future<void> addReview({
    required String name,
    required String roleCompany,
    required String comment,
    required double rating,
  }) async {
    emit(const ReviewsLoading());
    final newReview = ReviewEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      roleCompany: roleCompany,
      comment: comment,
      rating: rating,
      isTopReview: false,
      createdAt: DateTime.now(),
    );

    final result = await _addReviewUseCase(newReview);
    await result.fold(
      (failure) async => emit(ReviewsFailure(failure.message)),
      (_) async {
        // Reload reviews to get the updated list instantly (Real-time UI refresh)
        await loadReviews();
      },
    );
  }

  /// Deletes a review by id and reloads the list instantly
  Future<void> deleteReview(String id) async {
    emit(const ReviewsLoading());
    final result = await _deleteReviewUseCase(id);
    await result.fold(
      (failure) async => emit(ReviewsFailure(failure.message)),
      (_) async {
        await loadReviews();
      },
    );
  }
}
