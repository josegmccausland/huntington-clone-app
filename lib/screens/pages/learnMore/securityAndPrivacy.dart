import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SecurityAndPrivacyScreen extends StatefulWidget {
  SecurityAndPrivacyScreen({Key? key}) : super(key: key);

  @override
  _SecurityAndPrivacyScreenState createState() =>
      _SecurityAndPrivacyScreenState();
}

class _SecurityAndPrivacyScreenState extends State<SecurityAndPrivacyScreen> {
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/full-text-logoldpi.png'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                child: Text(
                  'Security & Privacy',
                  style: TextStyle(
                    fontFamily: 'Apex New',
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(
                  'Huntington has always been, and always will be, commited to providing you with a safe and secure environment for online and mobile banking.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(
                  'We use a variety of technology and tools to help ensure the security and confidentiality of your personal and financial information. However, this isn\'t something we can completely take care of ourselves. Your vigilance plays an important role.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(
                  'Our Security Center will help you find ways to help protect yourself online and offline. So when you\'re ready, visit',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(
                  'We encourage you to take the time to click through the links and read the important information under each category. And as always, please feel free to contact us at 877-932-2265(BANK) with questions about your online security and banking activity.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Click to view our ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            _launchURL(
                                'https://www.huntington.com/Privacy-Security/privacy-policies');
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
