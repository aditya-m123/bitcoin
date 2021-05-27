import 'package:myapp/services/networking.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

///ENTER YOUR API KEY
const api_Key = '********************';
const coinApi_Url = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future get_BitcoinPrice(String currency) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      var url = '$coinApi_Url/$crypto/$currency?apikey=$api_Key';
      NetworkHelper obj1 = NetworkHelper(url);
      var response_Api = await obj1.getData();

      double last_prices = response_Api["rate"];
      cryptoPrices[crypto] = last_prices.toStringAsFixed(0);

      ///btc = 124353
    }
    return cryptoPrices;
  }
}
