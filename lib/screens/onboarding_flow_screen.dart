import 'package:flutter/material.dart';

import '../widgets/onboarding/brand_logo.dart';
import '../widgets/onboarding/onboarding_action_button.dart';
import '../widgets/onboarding/onboarding_card_scaffold.dart';
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
  static const int _totalSteps = 10;

  late final PageController _pageController;

  int _currentPage = 0;
  bool _privacyAccepted = true;
  bool _termsAccepted = true;
  bool _rememberMe = true;
  bool _signUpAccepted = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Future<void>.delayed(const Duration(milliseconds: 1400), () {
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
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
  }

  void _nextPage() {
    if (_currentPage < _totalSteps - 1) {
      _goToPage(_currentPage + 1);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _goToPage(_currentPage - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const _SplashPage(),
      _PolicyPage(
        step: 2,
        totalSteps: _totalSteps,
        title: 'Privacy & Policy',
        lastUpdated: 'Last updated on 23 August 2025',
        sections: const [
          _PolicySection(
            title:
                'We collect personal information that you voluntarily provide.',
            body:
                'This includes the data you share when you register, contact support, or access features inside the app.',
          ),
          _PolicySection(
            title:
                'The personal information that we collect depends on how you use the app.',
            body:
                'We may process profile details, device data, and interaction history to improve the experience and provide support.',
          ),
          _PolicySection(
            title:
                'We process your information for legitimate business interests.',
            body:
                'This helps us keep the app secure, personalize content, and deliver a smoother onboarding journey.',
          ),
        ],
        isAccepted: _privacyAccepted,
        checkboxLabel: 'Accept terms & conditions',
        onChanged: (value) {
          setState(() {
            _privacyAccepted = value;
          });
        },
        onNext: _nextPage,
      ),
      _PolicyPage(
        step: 3,
        totalSteps: _totalSteps,
        title: 'Terms & Conditions',
        lastUpdated:
            'Welcome to our service. Please review these terms carefully.',
        sections: const [
          _PolicySection(
            title: 'User responsibilities',
            body:
                'Use the service only for lawful purposes, keep your account credentials safe, and provide correct profile information.',
          ),
          _PolicySection(
            title: 'Intellectual property',
            body:
                'All content, trademarks, and in-app materials remain the property of their owners and may not be copied without permission.',
          ),
          _PolicySection(
            title: 'Disclaimers',
            body:
                'The service is provided as available. Some features may change, pause, or improve over time as the product evolves.',
          ),
        ],
        isAccepted: _termsAccepted,
        checkboxLabel: 'Accept terms & condition',
        onChanged: (value) {
          setState(() {
            _termsAccepted = value;
          });
        },
        onNext: _nextPage,
        onBack: _previousPage,
      ),
      _WelcomePage(
        step: 4,
        totalSteps: _totalSteps,
        onGetStarted: _nextPage,
        onLogin: () => _goToPage(5),
      ),
      _LocationPage(
        step: 5,
        totalSteps: _totalSteps,
        onAllow: _nextPage,
        onBack: _previousPage,
      ),
      _LoginPage(
        step: 6,
        totalSteps: _totalSteps,
        rememberMe: _rememberMe,
        onRememberChanged: (value) {
          setState(() {
            _rememberMe = value;
          });
        },
        onLogin: () {},
        onForgotPassword: () => _goToPage(7),
        onSignUp: () => _goToPage(6),
        onBack: _previousPage,
      ),
      _SignUpPage(
        step: 7,
        totalSteps: _totalSteps,
        accepted: _signUpAccepted,
        onAcceptedChanged: (value) {
          setState(() {
            _signUpAccepted = value;
          });
        },
        onSignUp: () {},
        onBackToLogin: () => _goToPage(5),
        onBack: _previousPage,
      ),
      _ForgotPasswordPage(
        step: 8,
        totalSteps: _totalSteps,
        onSendCode: _nextPage,
        onBack: () => _goToPage(5),
      ),
      _OtpPage(
        step: 9,
        totalSteps: _totalSteps,
        onVerify: _nextPage,
        onBackToLogin: () => _goToPage(5),
        onBack: _previousPage,
      ),
      _ResetPasswordPage(
        step: 10,
        totalSteps: _totalSteps,
        onUpdatePassword: () => _goToPage(5),
        onBackToLogin: () => _goToPage(5),
        onBack: _previousPage,
      ),
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF7F9FC), Color(0xFFE9EEF5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -120,
              right: -80,
              child: _BlurCircle(
                size: 260,
                color: const Color(0xFF285A78).withValues(alpha: 0.10),
              ),
            ),
            Positioned(
              bottom: -140,
              left: -100,
              child: _BlurCircle(
                size: 280,
                color: const Color(0xFF6AA9D2).withValues(alpha: 0.14),
              ),
            ),
            SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 430),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (value) {
                        setState(() {
                          _currentPage = value;
                        });
                      },
                      children: pages,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SplashPage extends StatelessWidget {
  const _SplashPage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(34),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF285A78).withValues(alpha: 0.14),
            blurRadius: 44,
            offset: const Offset(0, 22),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const BrandLogo(size: 118),
            const SizedBox(height: 24),
            Text(
              'Flater',
              style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: const Color(0xFF35556F),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Clean onboarding, auth, and setup flow for your app.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: const Color(0xFF6E7B8B),
                height: 1.5,
              ),
            ),
            const Spacer(),
            const CircularProgressIndicator(
              strokeWidth: 2.6,
              color: Color(0xFF285A78),
            ),
          ],
        ),
      ),
    );
  }
}

class _PolicyPage extends StatelessWidget {
  const _PolicyPage({
    required this.step,
    required this.totalSteps,
    required this.title,
    required this.lastUpdated,
    required this.sections,
    required this.isAccepted,
    required this.checkboxLabel,
    required this.onChanged,
    required this.onNext,
    this.onBack,
  });

  final int step;
  final int totalSteps;
  final String title;
  final String lastUpdated;
  final List<_PolicySection> sections;
  final bool isAccepted;
  final String checkboxLabel;
  final ValueChanged<bool> onChanged;
  final VoidCallback onNext;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OnboardingCardScaffold(
      step: step,
      totalSteps: totalSteps,
      title: title,
      subtitle: lastUpdated,
      onBack: onBack,
      children: [
        ...sections.map(
          (section) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  section.title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF243242),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  section.body,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF6D7886),
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ),
        CheckboxListTile(
          value: isAccepted,
          onChanged: (value) => onChanged(value ?? false),
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: const Color(0xFF285A78),
          title: Text(
            checkboxLabel,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF243242),
            ),
          ),
        ),
        const SizedBox(height: 8),
        OnboardingActionButton(
          label: 'Next',
          onPressed: isAccepted ? onNext : null,
        ),
      ],
    );
  }
}

class _WelcomePage extends StatelessWidget {
  const _WelcomePage({
    required this.step,
    required this.totalSteps,
    required this.onGetStarted,
    required this.onLogin,
  });

  final int step;
  final int totalSteps;
  final VoidCallback onGetStarted;
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OnboardingCardScaffold(
      step: step,
      totalSteps: totalSteps,
      title: 'Welcome to Flater',
      subtitle:
          'Everything you need for a cleaner onboarding and authentication flow.',
      children: [
        const WelcomeIllustration(),
        const SizedBox(height: 20),
        Text(
          'Build, test, and scale your app with a polished first impression.',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF6D7886),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 18),
        OnboardingActionButton(label: 'Get Started', onPressed: onGetStarted),
        const SizedBox(height: 12),
        TextButton(
          onPressed: onLogin,
          child: const Text('Already have an account? Login'),
        ),
      ],
    );
  }
}

class _LocationPage extends StatelessWidget {
  const _LocationPage({
    required this.step,
    required this.totalSteps,
    required this.onAllow,
    this.onBack,
  });

  final int step;
  final int totalSteps;
  final VoidCallback onAllow;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OnboardingCardScaffold(
      step: step,
      totalSteps: totalSteps,
      title: 'Allow Location Access',
      subtitle:
          'To help you find the best service providers nearby, please enable your location.',
      onBack: onBack,
      children: [
        const SizedBox(height: 18),
        Center(
          child: Container(
            width: 86,
            height: 86,
            decoration: BoxDecoration(
              color: const Color(0xFF285A78),
              borderRadius: BorderRadius.circular(43),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF285A78).withValues(alpha: 0.24),
                  blurRadius: 22,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: const Icon(
              Icons.location_on_rounded,
              color: Colors.white,
              size: 38,
            ),
          ),
        ),
        const SizedBox(height: 26),
        Text(
          'Your location improves discovery, recommendations, and local availability checks.',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF6D7886),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 22),
        OnboardingActionButton(
          label: 'Allow Location Access',
          onPressed: onAllow,
        ),
      ],
    );
  }
}

class _LoginPage extends StatelessWidget {
  const _LoginPage({
    required this.step,
    required this.totalSteps,
    required this.rememberMe,
    required this.onRememberChanged,
    required this.onLogin,
    required this.onForgotPassword,
    required this.onSignUp,
    this.onBack,
  });

  final int step;
  final int totalSteps;
  final bool rememberMe;
  final ValueChanged<bool> onRememberChanged;
  final VoidCallback onLogin;
  final VoidCallback onForgotPassword;
  final VoidCallback onSignUp;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OnboardingCardScaffold(
      step: step,
      totalSteps: totalSteps,
      title: 'Welcome Back',
      subtitle: 'Login to your account',
      onBack: onBack,
      children: [
        const OnboardingTextField(hintText: 'Enter your e-mail or number'),
        const SizedBox(height: 12),
        const OnboardingTextField(
          hintText: 'Password',
          obscureText: true,
          suffixIcon: Icons.visibility_outlined,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) => onRememberChanged(value ?? false),
                    activeColor: const Color(0xFF285A78),
                  ),
                  Text(
                    'Remember me',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: const Color(0xFF6D7886),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: onForgotPassword,
              child: const Text('Forgot password?'),
            ),
          ],
        ),
        const SizedBox(height: 4),
        OnboardingActionButton(label: 'Login', onPressed: onLogin),
        const SizedBox(height: 18),
        const SocialAuthRow(label: 'Or Continue With'),
        const SizedBox(height: 10),
        Center(
          child: TextButton(
            onPressed: onSignUp,
            child: const Text("Don't have an account? Sign Up"),
          ),
        ),
      ],
    );
  }
}

class _SignUpPage extends StatelessWidget {
  const _SignUpPage({
    required this.step,
    required this.totalSteps,
    required this.accepted,
    required this.onAcceptedChanged,
    required this.onSignUp,
    required this.onBackToLogin,
    this.onBack,
  });

  final int step;
  final int totalSteps;
  final bool accepted;
  final ValueChanged<bool> onAcceptedChanged;
  final VoidCallback onSignUp;
  final VoidCallback onBackToLogin;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OnboardingCardScaffold(
      step: step,
      totalSteps: totalSteps,
      title: 'Sign Up',
      subtitle: 'It only takes a minute to create your account',
      onBack: onBack,
      children: [
        const OnboardingTextField(hintText: 'E-mail address or phone number'),
        const SizedBox(height: 12),
        const OnboardingTextField(
          hintText: 'Password',
          obscureText: true,
          suffixIcon: Icons.visibility_outlined,
        ),
        const SizedBox(height: 12),
        const OnboardingTextField(
          hintText: 'Confirm password',
          obscureText: true,
          suffixIcon: Icons.visibility_outlined,
        ),
        CheckboxListTile(
          value: accepted,
          onChanged: (value) => onAcceptedChanged(value ?? false),
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: const Color(0xFF285A78),
          title: Text(
            'I accept terms & conditions',
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF6D7886),
            ),
          ),
        ),
        const SizedBox(height: 8),
        OnboardingActionButton(
          label: 'Sign Up',
          onPressed: accepted ? onSignUp : null,
        ),
        const SizedBox(height: 18),
        const SocialAuthRow(label: 'Or Continue With'),
        const SizedBox(height: 10),
        Center(
          child: TextButton(
            onPressed: onBackToLogin,
            child: const Text('Already have an account? Login'),
          ),
        ),
      ],
    );
  }
}

class _ForgotPasswordPage extends StatelessWidget {
  const _ForgotPasswordPage({
    required this.step,
    required this.totalSteps,
    required this.onSendCode,
    this.onBack,
  });

  final int step;
  final int totalSteps;
  final VoidCallback onSendCode;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return OnboardingCardScaffold(
      step: step,
      totalSteps: totalSteps,
      title: 'Forgot Password?',
      subtitle:
          'Enter your email or phone number and we will send you a reset code.',
      onBack: onBack,
      children: [
        const SizedBox(height: 12),
        const OnboardingTextField(hintText: 'Enter your email or phone'),
        const SizedBox(height: 18),
        OnboardingActionButton(label: 'Send Reset Code', onPressed: onSendCode),
        const SizedBox(height: 18),
        const Center(child: Text('Need help? Contact support')),
      ],
    );
  }
}

class _OtpPage extends StatelessWidget {
  const _OtpPage({
    required this.step,
    required this.totalSteps,
    required this.onVerify,
    required this.onBackToLogin,
    this.onBack,
  });

  final int step;
  final int totalSteps;
  final VoidCallback onVerify;
  final VoidCallback onBackToLogin;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OnboardingCardScaffold(
      step: step,
      totalSteps: totalSteps,
      title: 'Enter Verification Code',
      subtitle: 'We sent a 6-digit code to your registered email address.',
      onBack: onBack,
      children: [
        const Center(
          child: CircleAvatar(
            radius: 28,
            backgroundColor: Color(0xFFEAF2F8),
            child: Icon(Icons.verified_user_outlined, color: Color(0xFF285A78)),
          ),
        ),
        const SizedBox(height: 22),
        const OtpCodeInput(length: 5),
        const SizedBox(height: 10),
        Center(
          child: Text(
            'Paste code',
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF6D7886),
            ),
          ),
        ),
        const SizedBox(height: 16),
        OnboardingActionButton(label: 'Verify', onPressed: onVerify),
        const SizedBox(height: 12),
        Center(
          child: TextButton(
            onPressed: onBackToLogin,
            child: const Text('Back to Login'),
          ),
        ),
      ],
    );
  }
}

class _ResetPasswordPage extends StatelessWidget {
  const _ResetPasswordPage({
    required this.step,
    required this.totalSteps,
    required this.onUpdatePassword,
    required this.onBackToLogin,
    this.onBack,
  });

  final int step;
  final int totalSteps;
  final VoidCallback onUpdatePassword;
  final VoidCallback onBackToLogin;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return OnboardingCardScaffold(
      step: step,
      totalSteps: totalSteps,
      title: 'Set a New Password',
      subtitle: 'Please create a new password for your account to continue.',
      onBack: onBack,
      children: [
        const OnboardingTextField(
          hintText: 'New password',
          obscureText: true,
          suffixIcon: Icons.visibility_outlined,
        ),
        const SizedBox(height: 12),
        const OnboardingTextField(
          hintText: 'Confirm password',
          obscureText: true,
          suffixIcon: Icons.visibility_outlined,
        ),
        const SizedBox(height: 18),
        OnboardingActionButton(
          label: 'Update Password',
          onPressed: onUpdatePassword,
        ),
        const SizedBox(height: 12),
        Center(
          child: TextButton(
            onPressed: onBackToLogin,
            child: const Text('Back to Login'),
          ),
        ),
      ],
    );
  }
}

class _PolicySection {
  const _PolicySection({required this.title, required this.body});

  final String title;
  final String body;
}

class _BlurCircle extends StatelessWidget {
  const _BlurCircle({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
