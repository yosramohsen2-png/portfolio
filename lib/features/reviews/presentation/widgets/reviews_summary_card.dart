import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/review_entity.dart';

/// Summary card displaying average rating, stars, and breakdown bars
class ReviewsSummaryCard extends StatelessWidget {
  final List<ReviewEntity> reviews;

  const ReviewsSummaryCard({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);
    final textColors = AppColors.textColors(brightness);
    final iconColors = AppColors.iconColors(brightness);

    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;

    // Calculate stats
    final totalReviews = reviews.length;
    double averageRating = 0.0;
    final counts = {5: 0, 4: 0, 3: 0, 2: 0, 1: 0};

    if (totalReviews > 0) {
      double sum = 0;
      for (final r in reviews) {
        sum += r.rating;
        final int star = r.rating.round().clamp(1, 5);
        counts[star] = (counts[star] ?? 0) + 1;
      }
      averageRating = sum / totalReviews;
    }

    final content = isMobile
        ? Column(
            children: [
              _buildRatingScore(textColors, averageRating),
              const SizedBox(height: AppDimensions.spacingLg),
              _buildStarsAndCount(
                textColors,
                iconColors,
                totalReviews,
                averageRating,
              ),
              if (totalReviews > 0) ...[
                const SizedBox(height: AppDimensions.spacingXl),
                _buildBars(textColors, bgColors, totalReviews, counts),
              ],
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildRatingScore(textColors, averageRating),
                  const SizedBox(width: AppDimensions.spacing3xl),
                  _buildStarsAndCount(
                    textColors,
                    iconColors,
                    totalReviews,
                    averageRating,
                  ),
                ],
              ),
              if (totalReviews > 0)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: AppDimensions.spacing4xl,
                    ),
                    child: _buildBars(
                      textColors,
                      bgColors,
                      totalReviews,
                      counts,
                    ),
                  ),
                ),
            ],
          );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.spacing3xl),
      decoration: BoxDecoration(
        color: bgColors.primaryDefault,
        borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
        border: Border.all(
          color: borderColors.primaryDisabled,
          width: AppDimensions.borderWidthXs,
        ),
      ),
      child: content,
    );
  }

  Widget _buildRatingScore(dynamic textColors, double averageRating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          averageRating.toStringAsFixed(1),
          style: AppTypography.headline2xl(
            color: textColors.primaryDefault,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(width: AppDimensions.spacingXs),
        Text(
          'reviews.summary.out_of_5'.tr(),
          style: AppTypography.bodyLg(
            color: textColors.primaryDisabled,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildStarsAndCount(
    dynamic textColors,
    dynamic iconColors,
    int totalReviews,
    double averageRating,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return Icon(
              index < averageRating.round()
                  ? Icons.star_rounded
                  : Icons.star_border_rounded,
              color: iconColors.primaryDefault,
              size: AppDimensions.iconMd,
            );
          }),
        ),
        const SizedBox(height: AppDimensions.spacingXs),
        Text(
          'reviews.summary.reviews_count'.tr(args: [totalReviews.toString()]),
          style: AppTypography.bodyMd(
            color: textColors.primaryDisabled,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildBars(
    dynamic textColors,
    dynamic bgColors,
    int totalReviews,
    Map<int, int> counts,
  ) {
    return Column(
      children: [5, 4, 3, 2, 1].map((star) {
        final count = counts[star] ?? 0;
        final percentage = totalReviews > 0 ? count / totalReviews : 0.0;

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.spacingXxs,
          ),
          child: Row(
            children: [
              Text(
                '$star',
                style: AppTypography.bodySm(
                  color: textColors.primaryDisabled,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: AppDimensions.spacingSm),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
                  child: LinearProgressIndicator(
                    value: percentage,
                    backgroundColor: bgColors.primaryDisabled,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      bgColors.brandSolid,
                    ),
                    minHeight: 6,
                  ),
                ),
              ),
              const SizedBox(width: AppDimensions.spacingSm),
              SizedBox(
                width: 24,
                child: Text(
                  '$count',
                  style: AppTypography.bodySm(
                    color: textColors.primaryDisabled,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
