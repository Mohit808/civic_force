import 'package:civic_force/common_widget/app_bar.dart';
import 'package:civic_force/common_widget/text_common.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  TermsAndConditionsScreen({super.key});


  String s="""
# Terms and Conditions

**Effective Date:** [Insert Date]

Welcome to **Social Fabric** ("App", "Platform", "we", "our", "us"). These Terms and Conditions ("Terms") govern your access to and use of the Social Fabric mobile application, website, and related services (collectively, the "Services"). By accessing or using Social Fabric, you agree to be bound by these Terms.

If you do not agree with these Terms, please do not use the Services.

---

## 1. Eligibility

You must be at least **13 years of age** (or the minimum age required by law in your jurisdiction) to use Social Fabric. By using the Services, you represent and warrant that you meet this requirement.

---

## 2. Account Registration

* You may be required to create an account to access certain features.
* You are responsible for maintaining the confidentiality of your login credentials.
* You agree to provide accurate, current, and complete information.
* You are responsible for all activities that occur under your account.

---

## 3. User Conduct

You agree **not to**:

* Post or share unlawful, harmful, abusive, harassing, defamatory, obscene, or hateful content.
* Impersonate another person or misrepresent your affiliation.
* Upload viruses, malware, or any code intended to disrupt the Services.
* Use the Services for spam, fraud, or commercial solicitation without authorization.
* Violate any applicable local, national, or international law.

We reserve the right to remove content or suspend accounts that violate these rules.

---

## 4. User Content

* You retain ownership of the content you post (text, images, audio, video, files).
* By posting content, you grant Social Fabric a **non-exclusive, worldwide, royalty-free license** to host, store, display, reproduce, and distribute such content for the purpose of operating and improving the Services.
* You are solely responsible for your content and confirm that you have the right to share it.

---

## 5. Messaging & Media Sharing

* Social Fabric allows users to exchange messages and media (images, videos, audio, documents).
* You agree not to send content that is illegal, explicit, or violates the rights of others.
* We may apply size, format, or usage limits for media uploads.

---

## 6. Privacy

Your use of Social Fabric is also governed by our **Privacy Policy**, which explains how we collect, use, and protect your data. By using the Services, you consent to our data practices.

---

## 7. Intellectual Property

* All trademarks, logos, designs, and platform content (excluding user content) are owned by or licensed to Social Fabric.
* You may not copy, modify, distribute, or create derivative works without prior written consent.

---

## 8. Third-Party Services

The Services may contain links to third-party websites or services. We are not responsible for the content, policies, or practices of third parties. Your interactions with third-party services are at your own risk.

---

## 9. Termination

We may suspend or terminate your access to Social Fabric at any time, with or without notice, if you violate these Terms or if required by law. You may stop using the Services at any time.

---

## 10. Disclaimer of Warranties

Social Fabric is provided **"as is"** and **"as available"**. We do not guarantee that the Services will be uninterrupted, secure, or error-free.

To the maximum extent permitted by law, we disclaim all warranties, express or implied.

---

## 11. Limitation of Liability

To the extent permitted by law, Social Fabric shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising out of or related to your use of the Services.

---

## 12. Indemnification

You agree to indemnify and hold harmless Social Fabric and its affiliates from any claims, damages, losses, or expenses arising from your use of the Services or violation of these Terms.

---

## 13. Changes to Terms

We may update these Terms from time to time. Continued use of the Services after changes means you accept the updated Terms.

---

## 14. Governing Law

These Terms shall be governed by and construed in accordance with the laws of **India**, without regard to conflict of law principles.

---

## 15. Contact Us

If you have questions or concerns about these Terms, please contact us at:

**Email:** [[support@socialfabric.app](mailto:support@socialfabric.app)]

---

By using Social Fabric, you acknowledge that you have read, understood, and agree to these Terms and Conditions.

          """;

  @override
  Widget build(BuildContext context) {
    var lines=s.split("\n");
    return Scaffold(
      appBar: AppBarCommon(title: "Terms and conditions",),
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(spacing: 0,crossAxisAlignment: CrossAxisAlignment.start,children: [
              for (final line in lines)
                Builder(
                  builder: (_) {
                    final text = line.replaceAll('#', '').trim();

                    if (line.startsWith('## ')) {
                      return SmallText(
                        text: text,
                        fontWeight: FontWeight.w600,
                        size: 16,
                      );
                    }

                    if (line.startsWith('# ')) {
                      return SmallText(
                        text: text,
                        fontWeight: FontWeight.w600,
                        size: 24,
                      );
                    }

                    return Builder(
                        builder: (context) {
                          var splt=line.split("**");
                          return RichText(text: TextSpan(children: [
                            for(var x in splt)
                              TextSpan(text: x,style: TextStyle(color: Colors.black87,fontWeight: splt.indexOf(x).isOdd?FontWeight.w600:null))
                          ]));
                        }
                    );
                  },
                )
            ],),
      )
      ),
    );
  }

}
