import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/review_entity.dart';
import '../cubit/reviews_cubit.dart';
import '../cubit/reviews_state.dart';
import '../widgets/leave_review_form.dart';
import '../widgets/review_item_card.dart';
import '../widgets/reviews_summary_card.dart';

/// Main aggregation section for Reviews, listening to Cubit state
class ReviewsSection extends StatefulWidget {
  const ReviewsSection({super.key});

  @override
  State<ReviewsSection> createState() => _ReviewsSectionState();
}

class _ReviewsSectionState extends State<ReviewsSection> {
  @override
  void initState() {
    super.initState();
    context.read<ReviewsCubit>().loadReviews();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColors = AppColors.textColors(brightness);
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;

    return BlocBuilder<ReviewsCubit, ReviewsState>(
      builder: (context, state) {
        if (state is ReviewsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ReviewsSuccess) {
          final reviews = state.reviews;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Section Title & Subtitle
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'reviews.title_part1'.tr(),
                      style:
                          (isMobile
                                  ? AppTypography.headlineMd(
                                      color: textColors.primaryDefault,
                                    )
                                  : AppTypography.headlineLg(
                                      color: textColors.primaryDefault,
                                    ))
                              .copyWith(fontWeight: FontWeight.w900),
                    ),
                    TextSpan(
                      text: 'reviews.title_highlight'.tr(),
                      style:
                          (isMobile
                                  ? AppTypography.headlineMd(
                                      color: textColors.brandDefault,
                                    )
                                  : AppTypography.headlineLg(
                                      color: textColors.brandDefault,
                                    ))
                              .copyWith(fontWeight: FontWeight.w900),
                    ),
                    TextSpan(
                      text: 'reviews.title_part2'.tr(),
                      style:
                          (isMobile
                                  ? AppTypography.headlineMd(
                                      color: textColors.primaryDefault,
                                    )
                                  : AppTypography.headlineLg(
                                      color: textColors.primaryDefault,
                                    ))
                              .copyWith(fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.spacingSm),
              Text(
                'reviews.subtitle'.tr(),
                textAlign: TextAlign.center,
                style: AppTypography.bodyLg(color: textColors.primaryDisabled2),
              ),
              const SizedBox(height: AppDimensions.spacing3xl),

              // Summary Card (hides breakdown if empty)
              ReviewsSummaryCard(reviews: reviews),
              const SizedBox(height: AppDimensions.spacing4xl),

              // Review Cards Grid / List
              if (reviews.isNotEmpty) ...[
                if (isMobile)
                  Column(
                    children: reviews.map((review) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppDimensions.spacing2xl,
                        ),
                        child: SizedBox(
                          height: 250,
                          child: ReviewItemCard(
                            review: review,
                            onLongPress: () =>
                                _showDeleteDialog(context, review),
                          ),
                        ),
                      );
                    }).toList(),
                  )
                else
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Calculate width for columns based on count (limit to 3 max)
                      final columnsCount = reviews.length.clamp(1, 3);
                      final spacing = AppDimensions.spacing2xl;
                      final totalSpacing = spacing * (columnsCount - 1);
                      final itemWidth =
                          (constraints.maxWidth - totalSpacing) / columnsCount;

                      return Wrap(
                        spacing: spacing,
                        runSpacing: spacing,
                        children: reviews.map((review) {
                          return SizedBox(
                            width: itemWidth,
                            height: 260,
                            child: ReviewItemCard(
                              review: review,
                              onLongPress: () =>
                                  _showDeleteDialog(context, review),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                const SizedBox(height: AppDimensions.spacing4xl),
              ],

              // Leave Review Form (Always visible)
              const LeaveReviewForm(),
            ],
          );
        }

        if (state is ReviewsFailure) {
          return Center(
            child: Text(
              state.message,
              style: AppTypography.bodyLg(color: Colors.red),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  void _showDeleteDialog(BuildContext context, ReviewEntity review) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final textColors = AppColors.textColors(brightness);
    final borderColors = AppColors.borderColors(brightness);
    final controller = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: bgColors.primaryDefault,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
            side: BorderSide(color: borderColors.primaryDisabled),
          ),
          title: Text(
            'reviews.admin.title'.tr(),
            style: AppTypography.headlineXs(
              color: textColors.primaryDefault,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'reviews.admin.prompt'.tr(),
                  style: AppTypography.bodyMd(
                    color: textColors.primaryDisabled2,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacingLg),
                TextFormField(
                  controller: controller,
                  obscureText: true,
                  style: AppTypography.bodyLg(color: textColors.primaryDefault),
                  decoration: InputDecoration(
                    hintText: '••••••••',
                    hintStyle: AppTypography.bodyLg(
                      color: textColors.primaryDisabled,
                    ),
                    filled: true,
                    fillColor: bgColors.primarySecondary,
                    contentPadding: const EdgeInsets.all(
                      AppDimensions.spacingLg,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMd,
                      ),
                      borderSide: BorderSide(
                        color: borderColors.primaryDisabled,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMd,
                      ),
                      borderSide: BorderSide(
                        color: borderColors.primaryDisabled,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMd,
                      ),
                      borderSide: BorderSide(
                        color: borderColors.primaryDefault,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    if (value != '115711') {
                      return 'reviews.admin.wrong_passcode'.tr();
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(
                'reviews.admin.cancel'.tr(),
                style: AppTypography.labelMd(
                  color: textColors.primaryDisabled2,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  Navigator.of(dialogContext).pop();
                  context.read<ReviewsCubit>().deleteReview(review.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'reviews.admin.success_deleted'.tr(),
                        style: AppTypography.bodyMd(
                          color: textColors.primaryToggle,
                        ),
                      ),
                      backgroundColor: bgColors.brandSolid,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
                ),
              ),
              child: Text(
                'reviews.admin.delete'.tr(),
                style: AppTypography.labelMd(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
