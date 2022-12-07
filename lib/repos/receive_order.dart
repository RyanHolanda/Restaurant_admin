import 'dart:convert';

import 'package:admin_panel/models/orders_model.dart';
import 'package:http/http.dart' as http;

class ReceiveOrder {
  String url = 'https://black-beard-burguer-406f0.web.app/orders';
  Future<List<OrderModel>> getOrders() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        return result.map(((e) => OrderModel.fromjson(e))).toList();
      } else {
        print('error');
        return getOrders();
      }
    } catch (e) {
      print(e);
      return ReceiveOrder().getOrders();
    }
  }
}
