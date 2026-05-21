import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/shared/widgets/primary_button.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/theme/app_typography.dart';
import '../cubit/reviews_cubit.dart';

/// Form widget allowing users to submit new reviews with validation
class LeaveReviewForm extends StatefulWidget {
  const LeaveReviewForm({super.key});

  @override
  State<LeaveReviewForm> createState() => _LeaveReviewFormState();
}

class _LeaveReviewFormState extends State<LeaveReviewForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _roleController = TextEditingController();
  final _commentController = TextEditingController();
  double _rating = 5.0;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _roleController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isSubmitting = true);

      await context.read<ReviewsCubit>().addReview(
        name: _nameController.text.trim(),
        roleCompany: _roleController.text.trim(),
        comment: _commentController.text.trim(),
        rating: _rating,
      );

      if (mounted) {
        setState(() {
          _isSubmitting = false;
          _nameController.clear();
          _roleController.clear();
          _commentController.clear();
          _rating = 5.0;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('reviews.form.success_message'.tr()),
            backgroundColor: Colors.green,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('reviews.form.error_message'.tr()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColors = AppColors.backgroundColors(brightness);
    final borderColors = AppColors.borderColors(brightness);
    final textColors = AppColors.textColors(brightness);
    final iconColors = AppColors.iconColors(brightness);

    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;

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
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title & Subtitle
            Text(
              'reviews.form.title'.tr(),
              textAlign: TextAlign.center,
              style: AppTypography.headlineLg(
                color: textColors.primaryDefault,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingXs),
            Text(
              'reviews.form.subtitle'.tr(),
              textAlign: TextAlign.center,
              style: AppTypography.bodyLg(color: textColors.primaryDisabled),
            ),
            const SizedBox(height: 40), // Spacing consistent with contact form
            // Name & Role Fields
            if (isMobile)
              Column(
                children: [
                  _buildTextField(
                    controller: _nameController,
                    label: 'reviews.form.name_label'.tr(),
                    hint: 'reviews.form.name_hint'.tr(),
                    textColors: textColors,
                    borderColors: borderColors,
                    bgColors: bgColors,
                  ),
                  const SizedBox(height: 40),
                  _buildTextField(
                    controller: _roleController,
                    label: 'reviews.form.role_label'.tr(),
                    hint: 'reviews.form.role_hint'.tr(),
                    textColors: textColors,
                    borderColors: borderColors,
                    bgColors: bgColors,
                  ),
                ],
              )
            else
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _nameController,
                      label: 'reviews.form.name_label'.tr(),
                      hint: 'reviews.form.name_hint'.tr(),
                      textColors: textColors,
                      borderColors: borderColors,
                      bgColors: bgColors,
                    ),
                  ),
                  const SizedBox(width: AppDimensions.spacing2xl),
                  Expanded(
                    child: _buildTextField(
                      controller: _roleController,
                      label: 'reviews.form.role_label'.tr(),
                      hint: 'reviews.form.role_hint'.tr(),
                      textColors: textColors,
                      borderColors: borderColors,
                      bgColors: bgColors,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 40),

            // Comment Field
            _buildTextField(
              controller: _commentController,
              label: '',
              hint: 'reviews.form.comment_hint'.tr(),
              maxLines: 4,
              textColors: textColors,
              borderColors: borderColors,
              bgColors: bgColors,
            ),
            const SizedBox(height: 40),

            // Rating Selector
            Text(
              'reviews.form.rating_label'.tr(),
              style: AppTypography.labelMd(
                color: textColors.primaryDisabled,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Wrap(
              spacing: AppDimensions.spacingSm,
              runSpacing: AppDimensions.spacingSm,
              children: List.generate(5, (index) {
                final starIndex = index + 1;
                return GestureDetector(
                  onTap: () => setState(() => _rating = starIndex.toDouble()),
                  child: Icon(
                    starIndex <= _rating
                        ? Icons.star_rounded
                        : Icons.star_border_rounded,
                    color: iconColors.primaryDefault,
                    size: isMobile ? AppDimensions.iconMd : AppDimensions.iconXl,
                  ),
                );
              }),
            ),
            const SizedBox(height: 40),

            // Footer Row: Notice + Submit Button
            if (isMobile)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'reviews.form.footer_notice'.tr(),
                    style: AppTypography.bodySm(
                      color: textColors.primaryDisabled,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppDimensions.spacingLg),
                  _buildSubmitButton(
                    bgColors,
                    textColors,
                    width: double.infinity,
                  ),
                ],
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'reviews.form.footer_notice'.tr(),
                    style: AppTypography.bodySm(
                      color: textColors.primaryDisabled,
                    ),
                  ),
                  _buildSubmitButton(bgColors, textColors),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    required dynamic textColors,
    required dynamic borderColors,
    required dynamic bgColors,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: AppTypography.labelMd(
              color: textColors.primaryDisabled,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSm),
        ],
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: AppTypography.bodyMd(color: textColors.primaryDefault),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTypography.bodyMd(
              color: isDark
                  ? AppColors.darkTextBrandDisabled
                  : AppColors.lightTextBrandDisabled,
            ),
            filled: true,
            fillColor: bgColors.primaryDefault,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 24,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark
                    ? AppColors.darkBorderPrimaryDisabled
                    : AppColors.lightBorderPrimaryDisabled,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark
                    ? AppColors.darkBgBrandSolid
                    : AppColors.lightBgBrandSolid,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
          ),
          validator: (value) =>
              value == null || value.trim().isEmpty ? '' : null,
        ),
      ],
    );
  }

  Widget _buildSubmitButton(
    dynamic bgColors,
    dynamic textColors, {
    double? width,
  }) {
    if (_isSubmitting) {
      final brandColor = bgColors.brandSolid;
      return Container(
        width: width,
        height: 56, // Matches PrimaryButton height
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: brandColor,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
          border: Border.all(
            color: brandColor,
            width: AppDimensions.borderWidthSm,
          ),
        ),
        child: const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        ),
      );
    }
    return PrimaryButton(
      label: 'reviews.form.submit_button'.tr(),
      onPressed: _submit,
      trailingIcon: Icons.arrow_forward_rounded,
      width: width,
    );
  }
}
