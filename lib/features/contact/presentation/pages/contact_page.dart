import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_dimensions.dart';
import 'package:portfolio/shared/widgets/page_shell.dart';
import 'package:portfolio/features/contact/presentation/widgets/contact_header.dart';
import 'package:portfolio/features/contact/presentation/widgets/contact_fields.dart';
import 'package:portfolio/features/contact/presentation/widgets/contact_send_button.dart';
import 'package:portfolio/features/contact/presentation/widgets/social_links_title.dart';
import 'package:portfolio/features/contact/presentation/widgets/social_links_icons.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppDimensions.breakpointTablet;

    return PageShell(
      currentRoute: '/contact',
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _getHorizontalPadding(width),
          vertical: isMobile ? 40 : 80,
        ),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ContactHeader(),
                  const SizedBox(height: 40),
                  ContactFields(
                    nameController: _nameController,
                    emailController: _emailController,
                    messageController: _messageController,
                  ),
                  const SizedBox(height: 40),
                  ContactSendButton(
                    formKey: _formKey,
                    nameController: _nameController,
                    emailController: _emailController,
                    messageController: _messageController,
                  ),
                  const SizedBox(height: 40),
                  const SocialLinksTitle(),
                  const SizedBox(height: 40),
                  const SocialLinksIcons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _getHorizontalPadding(double width) {
    if (width > AppDimensions.breakpointDesktop) return 40;
    if (width >= AppDimensions.breakpointTablet) return 40;
    return 24;
  }
}
