import 'package:flutter/material.dart';

class VerifyPhoneScreen extends StatelessWidget {
  const VerifyPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Verify Phone',
          style: theme.textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Code is sent to 283 835 2999',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 30),

            // OTP Code Display
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                OTPDigitBox(digit: '3'),
                OTPDigitBox(digit: '1'),
                OTPDigitBox(digit: '7'),
                OTPDigitBox(digit: '0'),
              ],
            ),
            const SizedBox(height: 40),

            const Divider(height: 1),
            const SizedBox(height: 30),

            // Keypad
            Center(
              child: Text(
                'Verify and Create Account',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Number Pad
            Table(
              children: [
                TableRow(
                  children: [
                    _NumberButton(number: '1'),
                    _NumberButton(number: '2'),
                    _NumberButton(number: '3'),
                  ],
                ),
                TableRow(
                  children: [
                    _NumberButton(number: '4'),
                    _NumberButton(number: '5'),
                    _NumberButton(number: '6'),
                  ],
                ),
                TableRow(
                  children: [
                    _NumberButton(number: '7'),
                    _NumberButton(number: '8'),
                    _NumberButton(number: '9'),
                  ],
                ),
                TableRow(
                  children: [
                    const SizedBox.shrink(),
                    _NumberButton(number: '0'),
                    _SubmitButton(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OTPDigitBox extends StatelessWidget {
  final String digit;

  const OTPDigitBox({
    super.key,
    required this.digit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          digit,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class _NumberButton extends StatelessWidget {
  final String number;

  const _NumberButton({
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextButton(
        onPressed: () {
          // Handle number press
        },
        child: Text(
          number,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.check_circle, size: 40),
      color: Theme.of(context).colorScheme.primary,
      onPressed: () {
        Navigator.pushNamed(context, '/success');
      },
    );
  }
}