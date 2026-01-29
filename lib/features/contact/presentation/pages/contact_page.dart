import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/utils/responsive_utils.dart';

/// Contact page - Contact form and information
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

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Implement form submission logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('contact.success_message')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('contact.title'),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: ResponsiveUtils.getMaxContentWidth(context),
          ),
          padding: EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context)),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FadeInDown(
                    child: Text(
                      'contact.subtitle',
                      style: theme.textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 200),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'contact.name_label',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Please enter your name' : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  FadeInRight(
                    delay: const Duration(milliseconds: 300),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'contact.email_label',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Please enter your email' : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  FadeInLeft(
                    delay: const Duration(milliseconds: 400),
                    child: TextFormField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        labelText: 'contact.message_label',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 5,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'Please enter a message' : null,
                    ),
                  ),
                  const SizedBox(height: 24),
                  FadeInUp(
                    delay: const Duration(milliseconds: 500),
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('contact.send_button'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
