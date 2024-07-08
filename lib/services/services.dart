import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/errors.dart';
import '../model/productsmodel.dart';
import '../utils/constant.dart';

final class AuthService {
  const AuthService();
  Future<List<Product>> fetchProducts() async {
    try {
      final res = await http.get(Uri.parse(
          "$baseUrl?organization_id=$organizationId&Appid=$apiId&Apikey=$apiKey"));
      final body = json.decode(res.body);
      if (res.statusCode != 200) {
        final error = body['detail'] is String
            ? body['detail']
            : 'An error occured\nwhile fetching products!';
        throw ApiError(message: error);
      }

      final items = (body['items'] as List).cast<Map<String, dynamic>>();
      return items.map(Product.fromMap).toList();
    } catch (_) {
      rethrow;
    }
  }
}
