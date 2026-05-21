import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/review_entity.dart';

/// Card widget displaying a single review item with quote, text, avatar and stars
class ReviewItemCard extends StatelessWidget {
  final ReviewEntity review;
  final VoidCallback? onLongPress;

  const ReviewItemCard({super.key, required this.review, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);
    final textColors = AppColors.textColors(brightness);
    final iconColors = AppColors.iconColors(brightness);

    final borderColor = review.isTopReview
        ? bgColors.brandSolid
        : borderColors.primaryDisabled;

    final String comment = review.comment.startsWith('reviews.')
        ? review.comment.tr()
        : review.comment;
    final String name = review.name.startsWith('reviews.')
        ? review.name.tr()
        : review.name;
    final String roleCompany = review.roleCompany.startsWith('reviews.')
        ? review.roleCompany.tr()
        : review.roleCompany;

    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppDimensions.spacing3xl),
        decoration: BoxDecoration(
          color: bgColors.primaryDefault,
          borderRadius: BorderRadius.circular(AppDimensions.radius3xl),
          border: Border.all(
            color: borderColor,
            width: review.isTopReview ? 2.0 : AppDimensions.borderWidthXs,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Quote Icon + Optional Top Review Badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.format_quote_rounded,
                  color: iconColors.primaryDefault,
                  size: AppDimensions.iconXl,
                ),
                if (review.isTopReview)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.spacingLg,
                      vertical: AppDimensions.spacingXs,
                    ),
                    decoration: BoxDecoration(
                      color: bgColors.brandSolid,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusFull,
                      ),
                    ),
                    child: Text(
                      'reviews.top_review'.tr(),
                      style: AppTypography.labelSm(
                        color: textColors.primaryToggle,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: AppDimensions.spacingXl),

            // Comment
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  comment,
                  style: AppTypography.bodyLg(
                    color: textColors.primaryDefault,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.spacing2xl),

            // Bottom Row: Avatar + Info + Stars
            Row(
              children: [
                _buildAvatar(bgColors, textColors, name),
                const SizedBox(width: AppDimensions.spacingMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppTypography.headlineXs(
                          color: textColors.primaryDefault,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        roleCompany,
                        style: AppTypography.bodySm(
                          color: textColors.primaryDisabled,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                // Stars
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < review.rating.round()
                          ? Icons.star_rounded
                          : Icons.star_border_rounded,
                      color: iconColors.primaryDefault,
                      size: AppDimensions.iconSm,
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(
    dynamic bgColors,
    dynamic textColors,
    String displayName,
  ) {
    String initials = 'U';
    if (displayName.isNotEmpty) {
      final parts = displayName.trim().split(' ');
      if (parts.length > 1) {
        initials = '${parts[0][0]}${parts[1][0]}'.toUpperCase();
      } else {
        initials = parts[0]
            .substring(0, parts[0].length > 1 ? 2 : 1)
            .toUpperCase();
      }
    }

    Color avatarBg = bgColors.brandLight;
    final charCode = displayName.isNotEmpty ? displayName.codeUnitAt(0) : 0;
    if (charCode % 3 == 0) {
      avatarBg = bgColors.brandSolid.withValues(alpha: 0.3);
    } else if (charCode % 3 == 1) {
      avatarBg = Colors.blue.withValues(alpha: 0.2);
    } else {
      avatarBg = Colors.green.withValues(alpha: 0.2);
    }

    return CircleAvatar(
      radius: 22,
      backgroundColor: avatarBg,
      child: Text(
        initials,
        style: AppTypography.headlineXs(
          color: textColors.primaryDefault,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
