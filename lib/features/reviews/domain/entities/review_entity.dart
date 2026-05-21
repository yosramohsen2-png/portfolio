import 'package:equatable/equatable.dart';

/// Pure Dart Entity representing a Review in the Domain layer
class ReviewEntity extends Equatable {
  final String id;
  final String name;
  final String roleCompany;
  final String comment;
  final double rating;
  final bool isTopReview;
  final DateTime createdAt;

  const ReviewEntity({
    required this.id,
    required this.name,
    required this.roleCompany,
    required this.comment,
    required this.rating,
    this.isTopReview = false,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        roleCompany,
        comment,
        rating,
        isTopReview,
        createdAt,
      ];
}
