import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selected_Currency = 'USD';
  double rate1 = 0.0, rate2 = 0.00, rate3 = 0.00;
  CoinData obj1 = CoinData();

  DropdownButton<String> android_Currencylist() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency_Name in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency_Name),
        value: currency_Name,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selected_Currency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selected_Currency = value as String;
          hitApi(selected_Currency);
        });
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hitApi(selected_Currency);
  }

  CupertinoPicker iosPicker() {
    List<Text> pickerItems = [];
    for (String currency_Name in currenciesList) {
      pickerItems.add(Text(currency_Name));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(children: <Widget>[
            CryptoClass(
                selected_crypto: 'BTC',
                rate: rate1,
                selected_Currency: selected_Currency),
            CryptoClass(
                selected_crypto: 'ETH',
                rate: rate2,
                selected_Currency: selected_Currency),
            CryptoClass(
                selected_crypto: 'LTC',
                rate: rate3,
                selected_Currency: selected_Currency),
          ]),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosPicker() : android_Currencylist(),
          ),
        ],
      ),
    );
  }

  void hitApi(String currencyName) async {
    selected_Currency = currencyName;
    List<dynamic> searchedCoin = await obj1.get_BitcoinPrice(selected_Currency);
    setState(() {
      rate1 = searchedCoin[0].roundToDouble();
      rate2 = searchedCoin[1].roundToDouble();
      rate3 = searchedCoin[2].roundToDouble();
    });
  }
}

class CryptoClass extends StatelessWidget {
  CryptoClass({
    required this.selected_crypto,
    required this.rate,
    required this.selected_Currency,
  });

  final double rate;
  final String selected_Currency, selected_crypto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 5.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $selected_crypto = $rate $selected_Currency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
