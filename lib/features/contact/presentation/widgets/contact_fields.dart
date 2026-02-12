import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/features/contact/presentation/widgets/contact_text_field.dart';

class ContactFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;

  const ContactFields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.messageController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContactTextField(
          hintText: context.tr('contact.name_hint'),
          controller: nameController,
          validator: (value) => value == null || value.isEmpty ? 'Please enter your name' : null,
        ),
        const SizedBox(height: 40),
        ContactTextField(
          hintText: context.tr('contact.email_hint'),
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) return 'Please enter your email';
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) return 'Please enter a valid email';
            return null;
          },
        ),
        const SizedBox(height: 40),
        ContactTextField(
          hintText: context.tr('contact.message_hint'),
          controller: messageController,
          maxLines: 6,
          validator: (value) => value == null || value.isEmpty ? 'Please enter your message' : null,
        ),
      ],
    );
  }
}
