import 'services/networking.dart';

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
  List<dynamic> type_Values = [];
  Future<dynamic> get_BitcoinPrice(String currency) async {
    type_Values = [];
    print('hit api');
    for (String bitcoin_types in cryptoList) {
      var url = '$coinApi_Url/$bitcoin_types/$currency?apikey=$api_Key';
      NetworkHelper obj1 = NetworkHelper(url);
      var response_Api = await obj1.getData();
      var prices = response_Api["rate"];
      type_Values.add(prices);
      print('url is $url');
      print(prices);
    }
    return type_Values;
  }
}
