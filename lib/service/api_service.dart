// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:practical_api_consumption/model/product.dart';
//
// class ApiService {
//   // static const String apiUrl = 'https://api.api-ninjas.com/v1/cars?limit=2&model=benz';
//   static const String apiUrl = 'https://api.chec.io/v1/products?limit=25';
//
//   // Future<List<Product>> getProducts() async {
//   //   try {
//   //     final response = await http.get(Uri.parse(apiUrl));
//   //     if (response.statusCode == 200) {
//   //       final List<dynamic> jsonResponse = json.decode(response.body);
//   //       return jsonResponse.map((productJson) => Product.fromJson(productJson)).toList();
//   //     } else {
//   //       throw Exception('Failed to load products');
//   //     }
//   //   } catch (e) {
//   //     throw Exception('Error: $e');
//   //   }
//   // }
//   Future<List<Product>> getProducts() async {
//     try {
//       final response = await http.get(Uri.parse(apiUrl));
//       print('API Response Body: ${response.body}');
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonResponse = json.decode(response.body);
//         final List<dynamic> productsData = jsonResponse['data'];
//         List<Product> products = productsData.map((productJson) => Product.fromJson(productJson)).toList();
//
//         products.forEach((product) {
//           print('Product ID: ${product.id}');
//           print('Product Name: ${product.name}');
//           print('Product Description: ${product.description}');
//           print('Product Price: ${product.price}');
//           print('---------------------------');
//         });
//
//         return products;
//       } else {
//         throw Exception('Failed to load products');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }
// }



import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practical_api_consumption/model/product.dart';

class ApiService {
  static const String apiUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
      );

      print('Response Status Code: ${response.statusCode}');
      print('API Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        List<Product> products = jsonResponse.map((productJson) => Product.fromJson(productJson)).toList();

        products.forEach((product) {
          print('Product ID: ${product.id}');
          print('Product Name: ${product.name}');
          print('Product Description: ${product.description}');
          print('Product Price: ${product.price}');
          print('---------------------------');
        });

        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
