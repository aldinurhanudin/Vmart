part of '../services.dart';

class ProductService {
  String baseUrl =
      // 'http://10.0.2.2:8000/api';
      'https://vmart.abdimas.com/api';
      //  'http://103.31.39.159/api';
  // 'http://192.168.1.14:8000/api';
  // '';
  // 'http://127.0.0.1:8000/api';
  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}
