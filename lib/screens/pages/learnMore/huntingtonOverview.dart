import 'package:flutter/material.dart';

class HuntingtonOverviewScreen extends StatefulWidget {
  HuntingtonOverviewScreen({Key? key}) : super(key: key);

  @override
  _HuntingtonOverviewScreenState createState() =>
      _HuntingtonOverviewScreenState();
}

class _HuntingtonOverviewScreenState extends State<HuntingtonOverviewScreen> {
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
                    'Huntington Overview',
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
                    'Founded in 1866 as The Huntington National Bank, today Huntington Bancshares Incorporated still operates from the same Columbus, Ohio founding location in the heart of the Midwest. As of June 9, 2021, TCF National Bank joined The Huntington National Bank. The combined company has approximately \$175 billion in assets, \$142 billion in deposits, and \$116 billion in loans, based on March 31, 2021 balances. Huntington is a full-service banking provider primarily operating across an eleven-state banking franchise of Ohio, Colorado, Illinois, Indiana, Kentucky, Michigan, Minnesota, Pennsylvania, South Dakota, and West Virginia. Our “Welcome” philosophy centers around deep relationship-building capabilities to best meet each customer’s specific needs. We serve our customers through a banking network of over 1,100 full-service branches, including 11 Private Client Group offices, and over 1,700 ATM locations. Huntington Bancshares Incorporated provides: Full-service commercial, small business, and consumer banking services, Mortgage banking services, Treasury management and foreign exchange services, Equipment leasing Wealth and investment management services, Trust services, Brokerage services, Customized insurance brokerage and service programs. Through automotive dealership relationships within our primary franchise area and select other states, Huntington also provides commercial banking services to the automotive dealers and retail automobile financing for dealer customers.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
