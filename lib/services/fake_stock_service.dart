import '../core/models/stock_model.dart';

class FakeStockService {
  static List<StockModel> getStocks() {
    return [
      StockModel(
        name: 'Apple',
        price: 172.15,
        change: 1.2,
        image: 'assets/Onboarding/Group27.png',
      ),
      StockModel(
        name: 'Spotify',
        price: 401.67,
        change: -0.7,
        image: 'assets/Onboarding/Group32.png',
      ),
      StockModel(
        name: 'Netflix',
        price: 2501.23,
        change: 0.3,
        image: 'assets/Onboarding/Group111.png',
      ),
      StockModel(
        name: 'Amazon',
        price: 3300.55,
        change: -1.1,
        image: 'assets/Onboarding/Group31.png',
      ),
    ];
  }
}
