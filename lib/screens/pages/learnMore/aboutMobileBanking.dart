import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMobileBankingScreen extends StatefulWidget {
  AboutMobileBankingScreen({Key? key}) : super(key: key);

  @override
  _AboutMobileBankingScreenState createState() =>
      _AboutMobileBankingScreenState();
}

class _AboutMobileBankingScreenState extends State<AboutMobileBankingScreen> {
  _launchURL() async {
    const url = 'https://www.huntington.com/Personal/mobile-banking';
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
                  'Mobile Banking',
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
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'With our new range of mobile features, there are more ways than ever to stay in control of your finances, wherever you are. Whether you want to receive bank account info by text message, sign up for Alerts, use our Apps or access your account through your mobile phone\'s web browser, we\'ve got you covered. So start exploring ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'online',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            _launchURL();
                          },
                      ),
                      TextSpan(
                        text:
                            ' and see how you can put our new features to work for you.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
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
