import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/theme/text_styles.dart';
import 'package:mari_nail_app/core/widgets/appBar_style2.dart';

class PrivacySecurity extends StatelessWidget {
  const PrivacySecurity({super.key});

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
        mainText: "Privacy and Security",
        subText: " ",
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Privacy & Security', style: TextStyles.heading2Medium),
              SizedBox(height: 20),
              Text(
                'Your privacy and security are important to us. We are committed to protecting your personal information and ensuring a safe experience while using our application.Information We Collect We may collect information such as your name, email address, phone number, and other account details necessary to provide our services.',
              ),
              SizedBox(height: 20),
              Text('How We Use Your Information'),
              SizedBox(height: 20),
              Text('Your information is used to:'),
              Text('. Provide and improve our services.'),
              Text('. Send important updates and notifications.'),
              Text('. Respond to customer support requests.'),
              SizedBox(height: 20),
              Text('Data Protection'),
              Text(
                'We implement appropriate security measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction.',
              ),
              SizedBox(height: 20),
              Text('Account Security'),
              Text('To help keep your account secure:'),
              Text('.Use a strong password.'),
              Text('Keep your login credentials confidential.'),
              Text('Update your information regularly.'),
              Text('Report any suspicious activity immediately.'),
              SizedBox(height: 20),
              Text('Third-Party Services'),
              Text(
                'We may use trusted third-party services to support our application. These providers are required to protect your information and use it only for authorized purposes.Your Rights You may review, update, or request the deletion of your personal information in accordance with applicable laws and regulations.',
              ),

              SizedBox(height: 20),

              Text('Policy Updates'),
              Text(
                'We may update our Privacy & Security practices from time to time. Any changes will be reflected within the application.',
              ),

              SizedBox(height: 20),
              Text('Contact Us'),
              Text(
                'If you have any questions regarding privacy or security, please contact our support team.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
