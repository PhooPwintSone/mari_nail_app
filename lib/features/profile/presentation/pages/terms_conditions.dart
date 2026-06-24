import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/appBar_style2.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle2(
        showNotification: false,
        hasUnreadNotification: false,
        onNotificationTap: () {},
        backButtonAction: () {
          Navigator.pop(context);
        },
        mainText: "Terms and Conditions",
        subText: " ",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Terms and Conditions', style: TextStyles.heading2Medium),
              SizedBox(height: 20),
              Text('Last Updated: June 2026'),
              Text(
                'Welcome to our application. By accessing or using this app,you agree to comply with and be bound by the following Terms and Conditions.',
              ),
              SizedBox(height: 20),

              Text('1. Acceptance of Terms'),

              Text(
                'By creating an account or using our services, you\nacknowledge that you have read, understood, and agreed to these Terms and Conditions.',
              ),
              SizedBox(height: 20),

              Text('2. User Account'),
              Text(
                'You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.',
              ),
              SizedBox(height: 20),
              Text('3. Acceptable Use'),
              Text('. User must not use the app for unlawful purposes.'),
              Text('. Attempt to gain unauthorized access to the system.'),
              Text(
                '. Upload or share harmful, misleading, or inappropriate\n  content.',
              ),
              Text('. Disrupt the operation of the application.'),
              SizedBox(height: 20),
              Text('4. User Information'),
              Text(
                'You agree to provide accurate and up-to-date information when creating or updating your account.',
              ),
              SizedBox(height: 20),
              Text('5. Intellectual Property'),
              Text(
                'All content, trademarks, logos, and materials within the application are owned by the company and may not be copied or distributed without permission.',
              ),
              SizedBox(height: 20),
              Text('6. Service Availability'),
              Text(
                'We strive to keep our services available at all times but do not guarantee uninterrupted access. Services may be modified, suspended, or discontinued without prior notice.',
              ),
              SizedBox(height: 20),
              Text('7. Limitation of Liability'),
              Text(
                'We are not responsible for any direct, indirect, incidental, or consequential damages resulting from the use of this application.',
              ),
              SizedBox(height: 20),
              Text('8. Termination'),
              Text(
                'We reserve the right to suspend or terminate accounts that violate these Terms and Conditions.',
              ),
              SizedBox(height: 20),
              Text('9. Changes to Terms'),
              Text(
                'We may update these Terms and Conditions from time to time. Continued use of the app after changes are posted constitutes acceptance of the revised terms.',
              ),
              SizedBox(height: 20),
              Text('10. Contact Us'),
              Text(
                'If you have any questions regarding these Terms and Conditions, please contact our support team.By using this application, you agree to these Terms and Conditions.',
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
