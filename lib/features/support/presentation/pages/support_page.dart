import 'dart:convert';
import 'package:bmp/core/config/api_config.dart';
import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/core/network/api_client.dart';
import 'package:bmp/features/auth_onboarding/onBoardingScreens/Screens/OnBoardingScreen/widgets/DynamicHeader.dart';
// FinancePageWrapper import removed

import 'package:bmp/shared/utils/percentage_size_ext.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:bmp/shared/widgets/hide_keyboard.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _isLoading = false;
  int _subjectCharCount = 0;
  int _descriptionCharCount = 0;

  Future<void> _submitTicket() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Use ApiClient with JWT authentication
      final response = await ApiClient.request(
        path: ApiConfig.supportTicketUrl,
        method: 'POST',
        includeRsa: true,
        data: {
          'contactEmail': _emailController.text.trim(),
          'subject': _subjectController.text.trim(),
          'description': _descriptionController.text.trim(),
        },
      );

      if (mounted) {
        if (response.success) {
          // Parse response data
          final requestId = response.data?['requestId'];
          final status = response.data?['status'];

          CustomSnackbar.show(
            context,
            title: L10n.of(context).supportSuccessTitle,
            message: response.message ?? L10n.of(context).supportSuccessMessage,
            type: SnackbarType.success,
          );

          // Clear form fields
          _emailController.clear();
          _subjectController.clear();
          _descriptionController.clear();

          debugPrint('✅ Support ticket created - ID: $requestId, Status: $status');

          // Navigate back after a short delay to allow user to see the success message
          Future.delayed(const Duration(milliseconds: 1500), () {
            if (mounted) {
              Navigator.of(context).pop();
            }
          });
        } else {
          CustomSnackbar.show(
            context,
            title: L10n.of(context).supportErrorTitle,
            message: response.message ?? L10n.of(context).supportErrorMessage,
            type: SnackbarType.error,
          );
        }
      }
    } catch (e) {
      debugPrint('❌ Support ticket submission error: $e');
      if (mounted) {
        CustomSnackbar.show(
          context,
          title: L10n.of(context).supportErrorTitle,
          message: e.toString().replaceAll('Exception: ', ''),
          type: SnackbarType.error,
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // Add listeners to update character counts
    _subjectController.addListener(() {
      setState(() {
        _subjectCharCount = _subjectController.text.length;
      });
    });
    _descriptionController.addListener(() {
      setState(() {
        _descriptionCharCount = _descriptionController.text.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

        if (isKeyboardOpen) {
          FocusScope.of(context).unfocus();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF1B1C30),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: DynamicHeader(),
        ),
        body: HideKeyboardOnOutsideTap(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
              final availableHeight = constraints.maxHeight - keyboardHeight;
              
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.06,
                  vertical: context.screenHeight * 0.025,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: availableHeight - context.screenHeight * 0.05,
                  ),
                  child: IntrinsicHeight(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            L10n.of(context).supportPageTitle,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          SizedBox(height: context.screenHeight * 0.01),
                          Text(
                            L10n.of(context).supportPageSubtitle,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white70,
                                ),
                          ),
                          SizedBox(height: context.screenHeight * 0.04),
                          _buildLabel('Email'),
                          SizedBox(height: context.screenHeight * 0.01),
                          _buildEmailField(),
                          SizedBox(height: context.screenHeight * 0.03),
                          _buildLabel(L10n.of(context).supportSubjectLabel),
                          SizedBox(height: context.screenHeight * 0.01),
                          _buildSubjectField(),
                          SizedBox(height: context.screenHeight * 0.03),
                          _buildLabel(L10n.of(context).supportDescriptionLabel),
                          SizedBox(height: context.screenHeight * 0.01),
                          _buildDescriptionField(),
                          const Spacer(),
                          SizedBox(height: context.screenHeight * 0.03),
                          _buildSubmitButton(),
                          SizedBox(height: keyboardHeight > 0 
                            ? context.screenHeight * 0.03 
                            : context.screenHeight * 0.05),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ));
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: context.screenWidth * 0.04,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildSubjectField() {
    return TextFormField(
      controller: _subjectController,
      style: TextStyle(color: Colors.white, fontSize: context.screenWidth * 0.035),
      decoration: InputDecoration(
        hintText: L10n.of(context).supportSubjectHint,
        hintStyle: TextStyle(color: Colors.white38, fontSize: context.screenWidth * 0.035),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.screenWidth * 0.03),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.screenWidth * 0.03),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.screenWidth * 0.03),
          borderSide: const BorderSide(color: Color(0xFF3976F8)),
        ),
        counter: Text(
          L10n.of(context).supportCharacterCount(_subjectCharCount),
          style: TextStyle(color: Colors.white54, fontSize: context.screenWidth * 0.03),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return L10n.of(context).supportSubjectRequired;
        }
        return null;
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      controller: _descriptionController,
      maxLines: 5,
      style: TextStyle(color: Colors.white, fontSize: context.screenWidth * 0.035),
      decoration: InputDecoration(
        hintText: L10n.of(context).supportDescriptionHint,
        hintStyle: TextStyle(color: Colors.white38, fontSize: context.screenWidth * 0.035),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.screenWidth * 0.03),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.screenWidth * 0.03),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.screenWidth * 0.03),
          borderSide: const BorderSide(color: Color(0xFF3976F8)),
        ),
        counter: Text(
          L10n.of(context).supportCharacterCount(_descriptionCharCount),
          style: TextStyle(color: Colors.white54, fontSize: context.screenWidth * 0.03),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return L10n.of(context).supportDescriptionRequired;
        }
        if(value.length < 20) {
          return L10n.of(context).supportDescriptionMinLength;
        }
        return null;
      },
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: context.screenHeight * 0.07,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _submitTicket,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3976F8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.screenWidth * 0.04),
          ),
          elevation: 0,
        ),
        child: _isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                L10n.of(context).supportSubmitButton,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: context.screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      style: TextStyle(color: Colors.white, fontSize: context.screenWidth * 0.035),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your email address',
        hintStyle: TextStyle(color: Colors.white38, fontSize: context.screenWidth * 0.035),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.screenWidth * 0.03),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.screenWidth * 0.03),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.screenWidth * 0.03),
          borderSide: const BorderSide(color: Color(0xFF3976F8)),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Email is required';
        }
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(value.trim())) {
          return 'Enter a valid email address';
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _subjectController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
