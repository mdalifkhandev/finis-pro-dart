import 'package:flutter/material.dart';

import 'home_screen.dart';
import '../widgets/onboarding/brand_logo.dart';
import '../widgets/onboarding/onboarding_action_button.dart';
import '../widgets/onboarding/onboarding_text_field.dart';
import '../widgets/onboarding/otp_code_input.dart';
import '../widgets/onboarding/social_auth_row.dart';
import '../widgets/onboarding/welcome_illustration.dart';

class OnboardingFlowScreen extends StatefulWidget {
  const OnboardingFlowScreen({super.key});

  @override
  State<OnboardingFlowScreen> createState() => _OnboardingFlowScreenState();
}

class _OnboardingFlowScreenState extends State<OnboardingFlowScreen> {
  late final PageController _pageController;

  int _currentPage = 0;
  bool _privacyAccepted = false;
  bool _termsAccepted = false;
  bool _rememberMe = true;
  bool _signUpAccepted = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Future<void>.delayed(const Duration(milliseconds: 1200), () {
      if (mounted && _currentPage == 0) {
        _goToPage(1);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  void _nextPage() => _goToPage(_currentPage + 1);

  void _openHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) => setState(() => _currentPage = value),
        children: [
          const _SplashPage(),
          _PolicyScreen(
            title: 'Privacy & Policy',
            intro: 'Last  updated on 23 August 2025',
            blocks: const [
              _PolicyBlock(
                body:
                    'We collect personal information that you voluntarily provide to us when you register on the [app/service], express an interest in obtaining information about us or our products and services.',
              ),
              _PolicyBlock(
                body:
                    'The personal information that we collect depends on the context of your interactions with us and the [app/service], the choices you make, and the products and features you use.',
              ),
              _PolicyBlock(
                title: '1.Information we collect',
                body:
                    'The personal information that we collect depends on the context of your interactions with us and the [app/service], the choices you make, and the products and features you use.',
              ),
              _PolicyBlock(
                title: '2.Information use collect',
                body:
                    'We process your personal information for these purposes in reliance on our legitimate business interests, in order to enter into or perform a contract with you,',
              ),
            ],
            accepted: _privacyAccepted,
            onAcceptedChanged: (value) =>
                setState(() => _privacyAccepted = value),
            onNext: _nextPage,
            onClose: () {},
          ),
          _PolicyScreen(
            title: 'Terms & Condition',
            intro: 'Welcome to Services App !',
            blocks: const [
              _PolicyBlock(
                body:
                    'Accessing or using our services, you agree to be bound by these Terms of Service. If you do not agree with any part of the terms, you must not use our services.',
              ),
              _PolicyBlock(
                title: '2. User Responsibilities As a user, you agree to:',
                bullets: [
                  'Use the service only for lawful purposes.',
                  'Provide accurate and complete information when required.',
                  'Maintain the confidentiality of your account password.',
                ],
              ),
              _PolicyBlock(
                title: '3. Intellectual Property',
                body:
                    'All content, trademarks, and data on this service, including but not limited to text, graphics, logos, and images, are the property of [Your Company Name]',
              ),
              _PolicyBlock(
                title: '4. Disclaimers',
                body:
                    'The service is provided on an "as is" and "as available" basis. [Your Company Name] makes no warranties, expressed or implied, regarding the operation.',
              ),
            ],
            accepted: _termsAccepted,
            onAcceptedChanged: (value) =>
                setState(() => _termsAccepted = value),
            onNext: _nextPage,
            onClose: () {},
          ),
          _WelcomeScreen(onGetStarted: _nextPage, onLogin: () => _goToPage(5)),
          _LocationScreen(onAllow: _nextPage),
          _LoginPage(
            rememberMe: _rememberMe,
            onRememberChanged: (value) => setState(() => _rememberMe = value),
            onLogin: _openHome,
            onForgotPassword: () => _goToPage(7),
            onSignUp: () => _goToPage(6),
            onBack: () => _goToPage(3),
          ),
          _SignUpPage(
            accepted: _signUpAccepted,
            onAcceptedChanged: (value) =>
                setState(() => _signUpAccepted = value),
            onSignUp: () => _goToPage(8),
            onBackToLogin: () => _goToPage(5),
            onBack: () => _goToPage(5),
          ),
          _ForgotPasswordPage(
            onSendCode: _nextPage,
            onBack: () => _goToPage(5),
          ),
          _OtpPage(
            onVerify: _nextPage,
            onBackToLogin: () => _goToPage(5),
            onBack: () => _goToPage(7),
          ),
          _ResetPasswordPage(
            onUpdatePassword: _openHome,
            onBackToLogin: () => _goToPage(5),
            onBack: () => _goToPage(8),
          ),
        ],
      ),
    );
  }
}

class _SplashPage extends StatelessWidget {
  const _SplashPage();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.white,
      child: SafeArea(child: Center(child: BrandLogo(size: 150))),
    );
  }
}

class _PolicyScreen extends StatelessWidget {
  const _PolicyScreen({
    required this.title,
    required this.intro,
    required this.blocks,
    required this.accepted,
    required this.onAcceptedChanged,
    required this.onNext,
    required this.onClose,
  });

  final String title;
  final String intro;
  final List<_PolicyBlock> blocks;
  final bool accepted;
  final ValueChanged<bool> onAcceptedChanged;
  final VoidCallback onNext;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: const Color(0xFFA6A6A6),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 28),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 360),
              padding: const EdgeInsets.fromLTRB(14, 16, 14, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF222222),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: onClose,
                        icon: const Icon(Icons.close, size: 18),
                        visualDensity: VisualDensity.compact,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            intro,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: const Color(0xFF666666),
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ...blocks.map((block) => block.build(context)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Checkbox(
                                  value: accepted,
                                  onChanged: (value) =>
                                      onAcceptedChanged(value ?? false),
                                  side: const BorderSide(
                                    color: Color(0xFF7E9AB2),
                                  ),
                                  activeColor: const Color(0xFF2B5876),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Wrap(
                                  children: [
                                    Text(
                                      'Accept ',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: const Color(0xFF4F4F4F),
                                          ),
                                    ),
                                    Text(
                                      'terms & conditions',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: const Color(0xFF2B5876),
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  OnboardingActionButton(
                    label: 'Next',
                    onPressed: accepted ? onNext : null,
                    isOutlined: true,
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

class _WelcomeScreen extends StatelessWidget {
  const _WelcomeScreen({required this.onGetStarted, required this.onLogin});

  final VoidCallback onGetStarted;
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            const WelcomeIllustration(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(28, 18, 28, 14),
                child: Column(
                  children: [
                    Text(
                      'Welcome to Finis',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF2E2E2E),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Connecting you with the best services, anytime, anywhere.\nExperience seamless support tailored just for you.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF7A7A7A),
                        height: 1.45,
                      ),
                    ),
                    const Spacer(),
                    OnboardingActionButton(
                      label: 'Get Started',
                      onPressed: onGetStarted,
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: onLogin,
                      child: RichText(
                        text: TextSpan(
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFF4F4F4F),
                          ),
                          children: const [
                            TextSpan(text: 'Already haven account? '),
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationScreen extends StatelessWidget {
  const _LocationScreen({required this.onAllow});

  final VoidCallback onAllow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: const Color(0xFFF9FBFD),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(flex: 5),
              Container(
                width: 58,
                height: 58,
                decoration: const BoxDecoration(
                  color: Color(0xFF285A78),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              const SizedBox(height: 26),
              Text(
                'Allow Location Access',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2B2B2B),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'To help you find the best service\nproviders near you, please share your\nlocation.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF7A7A7A),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 34),
              OnboardingActionButton(
                label: 'Allow location access',
                onPressed: onAllow,
              ),
              const Spacer(flex: 6),
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthScreenShell extends StatelessWidget {
  const _AuthScreenShell({
    required this.child,
    this.onBack,
    this.topCenterTitle,
  });

  final Widget child;
  final VoidCallback? onBack;
  final String? topCenterTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: const Color(0xFFF9FBFD),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
          child: Column(
            children: [
              SizedBox(
                height: 36,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: onBack,
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 18,
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                    if (topCenterTitle != null)
                      Text(
                        topCenterTitle!,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF111111),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(6, 0, 6, 18),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: const Color(0xFF222222),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _LoginPage extends StatelessWidget {
  const _LoginPage({
    required this.rememberMe,
    required this.onRememberChanged,
    required this.onLogin,
    required this.onForgotPassword,
    required this.onSignUp,
    this.onBack,
  });

  final bool rememberMe;
  final ValueChanged<bool> onRememberChanged;
  final VoidCallback onLogin;
  final VoidCallback onForgotPassword;
  final VoidCallback onSignUp;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _AuthScreenShell(
      onBack: onBack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 54),
          Text(
            'Welcome Back',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: const Color(0xFF202020),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Login to your account',
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF777777),
            ),
          ),
          const SizedBox(height: 52),
          const _FieldLabel('Enter Your E-mail Or Number'),
          const OnboardingTextField(hintText: 'E-mail address or number'),
          const SizedBox(height: 12),
          const _FieldLabel('Password'),
          const OnboardingTextField(
            hintText: '********',
            obscureText: true,
            prefixIcon: Icons.lock_outline,
            suffixIcon: Icons.visibility_off_outlined,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                rememberMe
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                size: 13,
                color: const Color(0xFFB6BEC8),
              ),
              const SizedBox(width: 4),
              Text(
                'Remember me',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF8A8A8A),
                  fontSize: 11,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onForgotPassword,
                child: Text(
                  'Forgot password?',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFFFF7B8D),
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          OnboardingActionButton(label: 'Login', onPressed: onLogin),
          const SizedBox(height: 18),
          const SocialAuthRow(label: 'Or Continue With', iconSize: 32),
          const SizedBox(height: 18),
          Center(
            child: RichText(
              text: TextSpan(
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF4F4F4F),
                  fontSize: 12.5,
                ),
                children: [
                  const TextSpan(text: "Don't have an account? "),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: GestureDetector(
                      onTap: onSignUp,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontWeight: FontWeight.w700,
                          fontSize: 12.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SignUpPage extends StatelessWidget {
  const _SignUpPage({
    required this.accepted,
    required this.onAcceptedChanged,
    required this.onSignUp,
    required this.onBackToLogin,
    this.onBack,
  });

  final bool accepted;
  final ValueChanged<bool> onAcceptedChanged;
  final VoidCallback onSignUp;
  final VoidCallback onBackToLogin;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _AuthScreenShell(
      onBack: onBack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 58),
          Text(
            'Sign Up',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: const Color(0xFF202020),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'It only takes a minute to create your\naccount',
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF8A8A8A),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 36),
          const OnboardingTextField(hintText: 'E-mail address or phone number'),
          const SizedBox(height: 10),
          const OnboardingTextField(hintText: 'Password', obscureText: true),
          const SizedBox(height: 10),
          const OnboardingTextField(
            hintText: 'Confirm Password',
            obscureText: true,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              SizedBox(
                width: 14,
                height: 14,
                child: Checkbox(
                  value: accepted,
                  onChanged: (value) => onAcceptedChanged(value ?? false),
                  side: const BorderSide(color: Color(0xFFBCC6D0)),
                  activeColor: const Color(0xFF285A78),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'Accept terms & conditions',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF666666),
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          OnboardingActionButton(
            label: 'Sign Up',
            onPressed: accepted ? onSignUp : null,
          ),
          const SizedBox(height: 18),
          const SocialAuthRow(label: 'Or Continue With', iconSize: 32),
          const SizedBox(height: 18),
          Center(
            child: GestureDetector(
              onTap: onBackToLogin,
              child: Text(
                'Already have an account? Login',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF111111),
                  fontSize: 12.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ForgotPasswordPage extends StatelessWidget {
  const _ForgotPasswordPage({required this.onSendCode, this.onBack});

  final VoidCallback onSendCode;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _AuthScreenShell(
      onBack: onBack,
      topCenterTitle: 'Forgot Password',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 58),
          Text(
            'Forgot Password?',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: const Color(0xFF202020),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Don't worry! Enter your registered email\nor phone number.",
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF8A8A8A),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 28),
          const _FieldLabel('Enter your email or phone number'),
          const OnboardingTextField(
            hintText: 'Enter your email or phone',
            prefixIcon: Icons.mail_outline,
          ),
          const SizedBox(height: 18),
          OnboardingActionButton(
            label: 'Send Reset Code',
            onPressed: onSendCode,
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'Remembered your password? Login',
              style: theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF666666),
                fontSize: 11.5,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              'Need Help?',
              style: theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF666666),
                fontSize: 11.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OtpPage extends StatelessWidget {
  const _OtpPage({
    required this.onVerify,
    required this.onBackToLogin,
    this.onBack,
  });

  final VoidCallback onVerify;
  final VoidCallback onBackToLogin;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _AuthScreenShell(
      onBack: onBack,
      topCenterTitle: 'Back to Login',
      child: Column(
        children: [
          const SizedBox(height: 54),
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              color: Color(0xFF285A78),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.verified_user_outlined,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Enter Verification Code',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: const Color(0xFF202020),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "We've sent a 6-digit code to j***@gmail.com",
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF8A8A8A),
            ),
          ),
          const SizedBox(height: 22),
          const OtpCodeInput(length: 6, activeIndex: 0),
          const SizedBox(height: 14),
          Text(
            'Paste Code',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF2B2B2B),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 18),
          OnboardingActionButton(label: 'Verify', onPressed: onVerify),
          const SizedBox(height: 20),
          Text(
            "Didn't receive the code? Resend",
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFFB0B0B0),
              fontSize: 11.5,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: onBackToLogin,
            child: Text(
              'Back to Login',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF202020),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResetPasswordPage extends StatelessWidget {
  const _ResetPasswordPage({
    required this.onUpdatePassword,
    required this.onBackToLogin,
    this.onBack,
  });

  final VoidCallback onUpdatePassword;
  final VoidCallback onBackToLogin;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _AuthScreenShell(
      onBack: onBack,
      topCenterTitle: 'Back to Login',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 118),
          Text(
            'Set a new password',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: const Color(0xFF202020),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Please set a new password for your account to\ncontinue',
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF8A8A8A),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 18),
          const OnboardingTextField(
            hintText: 'New Password',
            obscureText: true,
            suffixIcon: Icons.visibility_off_outlined,
          ),
          const SizedBox(height: 10),
          const OnboardingTextField(
            hintText: 'Confirm Password',
            obscureText: true,
            suffixIcon: Icons.visibility_off_outlined,
          ),
          const SizedBox(height: 16),
          OnboardingActionButton(
            label: 'Update Password',
            onPressed: onUpdatePassword,
          ),
        ],
      ),
    );
  }
}

class _PolicyBlock {
  const _PolicyBlock({this.title, this.body, this.bullets = const []});

  final String? title;
  final String? body;
  final List<String> bullets;

  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: const Color(0xFF222222),
                height: 1.45,
              ),
            ),
            const SizedBox(height: 6),
          ],
          if (body != null)
            Text(
              body!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: const Color(0xFF595959),
                height: 1.55,
              ),
            ),
          if (bullets.isNotEmpty) ...[
            for (final bullet in bullets)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  '• $bullet',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF595959),
                    height: 1.5,
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
