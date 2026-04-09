import 'dart:ui';

import 'package:bmp/core/localization/l10n.dart';
import 'package:bmp/shared/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalAccountScreen extends StatefulWidget {
  const PersonalAccountScreen({super.key});

  @override
  State<PersonalAccountScreen> createState() => _PersonalAccountScreenState();
}

class _PersonalAccountScreenState extends State<PersonalAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _documentNumberController =
      TextEditingController();

  String? _selectedDocumentType;

  List<String> get _documentTypes => [
    L10n.of(context).dni,
    L10n.of(context).passport,
    L10n.of(context).driverLicense,
    L10n.of(context).otherId,
  ];

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _documentNumberController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process form data
CustomSnackbar.show(context,        title: L10n.of(context).info,
        message: L10n.of(context).processingData,
        type: SnackbarType.info,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background with blurred gradients
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF1B1E43),
            ),
            child: Stack(
              children: [
                // Blue gradient shapes
                Positioned(
                  left: -60,
                  top: 80,
                  child: Container(
                    width: 300,
                    height: 220,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1929FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  left: -35,
                  top: 440,
                  child: Container(
                    width: 225,
                    height: 220,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1929FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                // Purple gradient shapes
                Positioned(
                  right: -25,
                  top: 440,
                  child: Container(
                    width: 330,
                    height: 225,
                    decoration: BoxDecoration(
                      color: const Color(0xFFA912BF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Positioned(
                  right: 7,
                  top: 150,
                  child: Container(
                    width: 225,
                    height: 225,
                    decoration: BoxDecoration(
                      color: const Color(0xFFA912BF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                // Central blue shadow
                Positioned(
                  left: 2,
                  top: 216,
                  child: Container(
                    width: 446,
                    height: 446,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4754FF).withOpacity(0.6),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Blur overlay
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 85, sigmaY: 85),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        Scaffold(
          // appBar: AppBar(
          //   title: Text(
          //     'Executive Power Magazine',
          //     style: GoogleFonts.roboto(
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.black,
          //     ),
          //   ),
          //   backgroundColor: Colors.white,
          //   elevation: 0,
          //   centerTitle: true,
          // ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    L10n.of(context).personalAccount,
                    style: GoogleFonts.roboto(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    L10n.of(context).provideIdentificationDetails,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Form Fields
                  _buildFirstNameField(),
                  const SizedBox(height: 20),
                  _buildMiddleNameField(),
                  const SizedBox(height: 20),
                  _buildLastNameField(),
                  const SizedBox(height: 20),
                  _buildDocumentTypeField(),
                  const SizedBox(height: 20),
                  _buildDocumentNumberField(),
                  const SizedBox(height: 40),

                  // Divider
                  const Divider(thickness: 1),
                  const SizedBox(height: 32),

                  // Next Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        L10n.of(context).next,
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFirstNameField() {
    return TextFormField(
      controller: _firstNameController,
      decoration: InputDecoration(
        labelText: L10n.of(context).firstName,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        // fillColor: Colors.grey[50],
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return L10n.of(context).pleaseEnterFirstName;
        }
        return null;
      },
    );
  }

  Widget _buildMiddleNameField() {
    return TextFormField(
      controller: _middleNameController,
      decoration: InputDecoration(
        labelText: L10n.of(context).middleNameOptional,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }

  Widget _buildLastNameField() {
    return TextFormField(
      controller: _lastNameController,
      decoration: InputDecoration(
        labelText: L10n.of(context).lastName,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return L10n.of(context).pleaseEnterLastName;
        }
        return null;
      },
    );
  }

  Widget _buildDocumentTypeField() {
    return DropdownButtonFormField<String>(
      initialValue: _selectedDocumentType,
      // initialValue: _selectedDocumentType,
      decoration: InputDecoration(
        labelText: L10n.of(context).idOrPassportType,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      items: _documentTypes.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedDocumentType = newValue;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return L10n.of(context).pleaseSelectDocumentType;
        }
        return null;
      },
    );
  }

  Widget _buildDocumentNumberField() {
    return TextFormField(
      controller: _documentNumberController,
      decoration: InputDecoration(
        labelText: L10n.of(context).documentNumber,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return L10n.of(context).pleaseEnterDocumentNumber;
        }
        return null;
      },
    );
  }
}
