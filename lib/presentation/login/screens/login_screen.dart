import 'package:flutter/material.dart';
import 'package:loan/presentation/loan_registration/screens/loan_registration_screen.dart';
import 'package:loan/presentation/login/widgets/application_option.dart';
import 'package:loan/presentation/widgets/ui/button_outlined.dart';
import 'package:loan/presentation/widgets/form_fields/form_textfield.dart';
import 'package:loan/presentation/widgets/ui/text_links.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ThemeData? _themeData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeData = Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _themeData!.colorScheme.primaryContainer,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Header(),
                    _Login(),
                    const SizedBox(height: 24),
                    const _LoginButtons(),
                  ],
                ),
              ),
            ),

            // sticky footer
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _FooterLinks(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          child: Image.asset('assets/images/afn_logo.png'),
        ),
        const SizedBox(height: 50),
        const Text(
          "Welcome!",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A237E),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "Log in to your Borrower Portal",
          style: TextStyle(color: Color(0xFF1A237E)),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        // Email Field
        FormTextField(label: 'Email', initialValue: 'johndoe@email.com'),
        SizedBox(height: 12),

        // Password label and "Forgot Password?" aligned
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Password',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            Text(
              'Forgot Password?',
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
          ],
        ),
        // Password Field
        FormTextField(label: '', initialValue: '••••••••'),
      ],
    );
  }
}

class _LoginButtons extends StatelessWidget {
  const _LoginButtons();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        ButtonOutlined(
          label: "Login",
          onPressed: () {},
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: Colors.white,
        ),
        const SizedBox(height: 12),
        ButtonOutlined(
          label: "Apply Now",
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => _ApplicationTypeDialog(),
            );
          },
          backgroundColor: theme.colorScheme.onSecondary,
          foregroundColor: theme.colorScheme.primary,
          borderColor: theme.colorScheme.outline,
        ),
      ],
    );
  }
}

class _FooterLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextLinks(text: "Disclaimer"),
        Text(" | "),
        TextLinks(text: "Terms of Use"),
        Text(" | "),
        TextLinks(text: "Privacy Policy"),
      ],
    );
  }
}

class _ApplicationTypeDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      backgroundColor: theme.colorScheme.onSecondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // X Button
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.close, size: 24),
              ),
            ),
            const SizedBox(height: 12),

            // Header
            const Text(
              'What type of application are you applying for?',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // Subtitle
            Text(
              'Select an application type below to start your application process',
              style: TextStyle(fontSize: 12, color: theme.colorScheme.tertiary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Individual Option
            ApplicationOption(
              icon: Icons.person_outline,
              title: 'Individual',
              subtitle: 'I’m applying on my own',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoanRegistrationScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            // Multiple Borrower Option
            ApplicationOption(
              icon: Icons.groups_outlined,
              title: 'Multiple Borrower',
              subtitle: 'I’m applying with a co-borrower',
              onTap: () {
                Navigator.pop(context);
                // Handle multiple borrower selection here
              },
            ),
          ],
        ),
      ),
    );
  }
}
