import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileGuaranteeScreen extends StatefulWidget {
  MobileGuaranteeScreen({Key? key}) : super(key: key);

  @override
  _MobileGuaranteeScreenState createState() => _MobileGuaranteeScreenState();
}

class _MobileGuaranteeScreenState extends State<MobileGuaranteeScreen> {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                  child: Text(
                    'Mobile Guarantee',
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
                    'So Secure, We Offer a Personal Guarantee.',
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
                    'At Huntington, we are committed to providing a secure and reliable online experience. You can be certain your money is safe and your payments will be sent on time. In fact, we guarantee it.',
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
                    'What we commit to do',
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
                    'In the event a problem arises with any transactions in Online Banking or Bill Pay, you’re protected by the Huntington Personal Online Guarantee. Here\'s our promise:',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    'We will replace funds that were not authorized to be removed from your account through Huntington Bill Pay when you notify us in a timely manner.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    'We will send your payments on time, every time. If an online banking transfer or bill payment is not sent on the date you\'ve requested, and you are charged a late fee as a result, we\'ll take care of it for you (as long as you schedule your payments on time* with available funds, enter the correct information and comply with the terms of our Online Banking Access and Bill Pay Agreement).',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    'For full details, please consult your Online Banking and Bill Pay Agreements.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    'Also, schedule your bill payments on time - at least two business days before payments sent electronically are due, and at least five business days before payments mailed via the U.S. Postal Service are due.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    'Please note that we send most bill payments electronically. However, for the payees unable to receive electronic payments, we send payments via the U.S. Postal Service. We mark these in our system with unique icons so you can tell which is which.',
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
                    'Any issues? Let us know.',
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
                    'As soon as you suspect fraud or notice a bill payment problem, let us know.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    'Call us: Costumer service is available at (800) 480-2265, 24 hours a day, 7 days a week. To speak to a representative, call between 6:00 am and midnight ET.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    'Write us: Huntington Customer Service Center, (EA5C42), P.O. Box 1558, Columbus, OH 43216',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    'For more information, please review the Huntington Online Services Agreement.',
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
                    'Still Have Questions?',
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
                    'If you can\'t find what you are looking for, let us know. We\'re ready to help in person, online or on the phone.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
