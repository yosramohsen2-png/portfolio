import '../../domain/entities/review_entity.dart';

/// Data Model representing a Review, handling JSON serialization and Entity mapping
class ReviewModel extends ReviewEntity {
  const ReviewModel({
    required super.id,
    required super.name,
    required super.roleCompany,
    required super.comment,
    required super.rating,
    super.isTopReview = false,
    required super.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] as String,
      name: json['name'] as String,
      roleCompany: json['roleCompany'] as String,
      comment: json['comment'] as String,
      rating: (json['rating'] as num).toDouble(),
      isTopReview: json['isTopReview'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'roleCompany': roleCompany,
      'comment': comment,
      'rating': rating,
      'isTopReview': isTopReview,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      id: id,
      name: name,
      roleCompany: roleCompany,
      comment: comment,
      rating: rating,
      isTopReview: isTopReview,
      createdAt: createdAt,
    );
  }

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      id: entity.id,
      name: entity.name,
      roleCompany: entity.roleCompany,
      comment: entity.comment,
      rating: entity.rating,
      isTopReview: entity.isTopReview,
      createdAt: entity.createdAt,
    );
  }
}
