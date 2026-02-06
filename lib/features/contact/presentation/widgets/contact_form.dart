import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/core/theme/app_typography.dart';
import 'package:portfolio/shared/widgets/custom_text_field.dart';
import 'package:portfolio/shared/widgets/primary_button.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Simulate submission
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('contact.success_message'.tr())),
      );
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColors = AppColors.textColors(Theme.of(context).brightness);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'contact.name_label'.tr(),
            style: AppTypography.bodyLg(
              color: textColors.primaryDefault,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingMd),
          CustomTextField(
            placeholder: 'contact.name_label'.tr(),
            controller: _nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: AppDimensions.spacing2xl),
          Text(
            'contact.email_label'.tr(),
            style: AppTypography.bodyLg(
              color: textColors.primaryDefault,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingMd),
          CustomTextField(
            placeholder: 'contact.email_label'.tr(),
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: AppDimensions.spacing2xl),
          Text(
            'contact.message_label'.tr(),
            style: AppTypography.bodyLg(
              color: textColors.primaryDefault,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingMd),
          CustomTextArea(
            placeholder: 'contact.message_label'.tr(),
            controller: _messageController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          const SizedBox(height: AppDimensions.spacing4xl),
          PrimaryButton(
            label: 'contact.send_button'.tr(),
            onPressed: _submitForm,
            variant: ButtonVariant.filled,
          ),
        ],
      ),
    );
  }
}
