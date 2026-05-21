import 'package:equatable/equatable.dart';
import '../../domain/entities/review_entity.dart';

/// Base state for Reviews Cubit
abstract class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object?> get props => [];
}

/// Initial state before loading reviews
class ReviewsInitial extends ReviewsState {
  const ReviewsInitial();
}

/// Loading state while fetching or adding reviews
class ReviewsLoading extends ReviewsState {
  const ReviewsLoading();
}

/// Success state containing the list of reviews
class ReviewsSuccess extends ReviewsState {
  final List<ReviewEntity> reviews;

  const ReviewsSuccess(this.reviews);

  @override
  List<Object?> get props => [reviews];
}

/// Failure state containing error message
class ReviewsFailure extends ReviewsState {
  final String message;

  const ReviewsFailure(this.message);

  @override
  List<Object?> get props => [message];
}
