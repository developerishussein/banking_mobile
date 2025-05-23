import 'package:flutter/material.dart';
import '../../models/stock_model.dart';
import '../../../services/fake_stock_service.dart';

class StockList extends StatelessWidget {
  final List<StockModel> stocks = FakeStockService.getStocks();

   StockList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          stocks.map((stock) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Card(
                color: Color.fromARGB(21, 211, 211, 211),
                child: ListTile(
                  onTap: () {},
                  leading: Image.asset(stock.image),
                  title: Text(
                    stock.name,
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '\$${stock.price.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    '${stock.change >= 0 ? '+' : ''}${stock.change.toStringAsFixed(2)}%',
                    style: TextStyle(
                      color: stock.change >= 0 ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
