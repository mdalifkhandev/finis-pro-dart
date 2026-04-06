import 'package:flutter/material.dart';
import '../widgets/company/create_company_widgets.dart';

class CreateCompanyScreen extends StatelessWidget {
  const CreateCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 380),
              padding: const EdgeInsets.fromLTRB(12, 14, 12, 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 126,
                        height: 126,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Color(0xFFF0F3F5), Color(0xFFD9E1E8)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 76,
                          color: Color(0xFF394C5D),
                        ),
                      ),
                      Positioned(
                        right: -2,
                        bottom: 8,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFF808080),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const CompanyFormField(hintText: 'Company name'),
                  const SizedBox(height: 14),
                  const CompanyDropdownField(hintText: 'Select industry'),
                  const SizedBox(height: 14),
                  const CompanyFormField(
                    hintText: 'Brief description of the company...',
                    maxLines: 4,
                  ),
                  const SizedBox(height: 14),
                  const CompanyFormField(hintText: '+1 (555)000-00000'),
                  const SizedBox(height: 14),
                  const CompanyFormField(hintText: 'abc@company.com'),
                  const SizedBox(height: 14),
                  const CompanyFormField(hintText: 'Website link'),
                  const SizedBox(height: 14),
                  const CompanyFormField(hintText: 'Business address'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(56),
                        backgroundColor: const Color(0xFF2A5977),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Create Company',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
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
