part of '../services.dart';


class TransactionService {
  String baseUrl = 
  // 'https://shamo-backend.buildwithangga.id/api';
  // 'https://bwabank.my.id/api';
  'http://10.0.2.2:8000/api';

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode(
      {
        'address': 'Marsemoon',
        'items': carts
            .map(
              (cart) => {
                'id': cart.product!.id,
                'quantity': cart.quantity,
              },
            )
            .toList(),
        'status': "PENDING",
        'total_price': totalPrice,
        'shipping_price': 0,
      },
    );

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan Checkout!');
    }
  }

    Future<String> topUp(TopupFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse(
          '$baseUrl/top_ups',
        ),
        headers: {
          'Authorization': token,
        },
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

}
