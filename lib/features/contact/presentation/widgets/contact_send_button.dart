import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/shared/widgets/primary_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSendButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;

  const ContactSendButton({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.messageController,
  });

  Future<void> _submitForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final String name = nameController.text;
      final String email = emailController.text;
      final String message = messageController.text;
      
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'yosramohsen2@gmail.com',
        query: _encodeQueryParameters({
          'subject': 'Portfolio Message from $name',
          'body': 'Name: $name\nEmail: $email\n\nMessage:\n$message',
        }),
      );

      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('contact.error_message'.tr())),
          );
        }
      }
    }
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.key == 'body' ? e.value.replaceAll('\n', '%0A') : e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      label: context.tr('contact.send_button'),
      onPressed: () => _submitForm(context),
      trailingIcon: Icons.send_rounded,
      width: double.infinity,
    );
  }
}
