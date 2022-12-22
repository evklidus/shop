import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shop/core/errors/exceptions.dart';
import 'package:shop/features/shops/data/models/shop_model.dart';

abstract class HttpService {
  Future<List<ShopModel>> getShops();
}

class HttpServiceImpl implements HttpService {
  final String _baseUrl =
      'shop-e05fd-default-rtdb.europe-west1.firebasedatabase.app';

  @override
  Future<List<ShopModel>> getShops() async {
    final url = Uri.https(_baseUrl, 'stores.json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<ShopModel> shops = [];
      final data = await json.decode(response.body);
      data.forEach(
        (product) => shops.add(ShopModel.fromJson(product)),
      );
      return shops;
    } else {
      throw ServerException();
    }
  }
}
