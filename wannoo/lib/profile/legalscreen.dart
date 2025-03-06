import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../Constants.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Policies & Legal"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: HtmlWidget(
              '<h1>Wannoo Group LTD Terms and Conditions for Mobile App</h1> <p><strong>Last Updated: 11/11/24</strong></p> <h2>1. Introduction</h2> <p>These Terms and Conditions govern your use of the Wannoo mobile app (the "App") provided by Wannoo Group LTD ("we", "our", "us"). By downloading, installing, and using the App, you agree to these Terms. If you do not agree, you must not use the App.</p> <h2>2. Eligibility</h2> <p>Users must be over 13 years old to use the App. Users under 13 need parental permission. Users 13-16 can browse and sign in but not book services.</p> <h2>3. Services Provided</h2> <p>The App allows you to book tours, hotels, and experiences from third-party vendors. Refunds and cancellations are handled by the respective providers.</p> <h2>4. Third-Party Services and Payments</h2> <p>Payments and bookings may redirect to third-party providers. Wannoo is not responsible for their pricing, delivery, or refunds.</p> <h2>5. Mobile App Permissions</h2> <p>The App may request access to location, camera, notifications, and contacts. Users can manage these permissions in device settings.</p> <h2>6. Intellectual Property</h2> <p>All content in the App is owned by Wannoo Group LTD. Unauthorized use is prohibited.</p> <h2>7. Limitation of Liability</h2> <p>Wannoo is not liable for any loss resulting from the use of the App or third-party services.</p> <h2>8. Governing Law</h2> <p>These Terms are governed by the laws of the United Kingdom.</p> <h2>9. Changes to These Terms</h2> <p>We may update these Terms. Continued use of the App means acceptance of the updates.</p> <h2>10. Contact Us</h2> <p>Email: enquiries@wannoo.com</p> <p>Address: 27 Old Gloucester Street, Holborn, London, England, WC1N 3AX</p> <h1>Privacy Policy for the App</h1> <h2>Last Updated: 11/11/24</h2> <h2>1. Information We Collect</h2> <p>Personal data includes name, email, payment info, and location data if enabled.</p> <h2>2. How We Use Your Information</h2> <p>Data is used for bookings, customer service, and app improvements.</p> <h2>3. Data Sharing with Third Parties</h2> <p>Data may be shared with service providers for bookings and affiliate marketing.</p> <h2>4. Your Rights</h2> <p>Users have rights under GDPR, including access, correction, and deletion of data.</p> <h2>5. Data Security</h2> <p>We take precautions to protect user data but cannot guarantee complete security.</p> <h2>6. Contact Us</h2> <p>Email: enquiries@wannoo.com</p> <p>Address: 27 Old Gloucester Street, Holborn, London, England, WC1N 3AX</p> <h1>Cookie Policy</h1> <h2>Last Updated: 11/11/2024</h2> <h2>1. What Are Cookies?</h2> <p>Cookies are small files stored on your device for tracking and improving user experience.</p> <h2>2. Managing Cookies</h2> <p>Users can manage cookies via browser settings, but disabling may affect functionality.</p> <h1>Refund and Return Policy</h1> <h2>Last Updated: 11/11/24</h2> <h2>1. Third-Party Services</h2> <p>All refunds and returns must be processed through the third-party provider.</p> <h2>2. Non-Refundable Services</h2> <p>Some services may be non-refundable based on third-party terms.</p> <h1>Affiliate Disclosure</h1> <h2>Last Updated: 11/11/24</h2> <h2>1. Affiliate Links</h2> <p>Some links may be affiliate links, earning a commission at no extra cost to users.</p>',
              textStyle: CustomTextStyles.fontL1Medium,
            ),
          ),
        ),
      ),
    );
  }
}
