// class Product {
//   final String name;
//   final double price;
//
//   Product({required this.name, required this.price});
//
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       name: json['name'],
//       price: json['price'].toDouble(),
//     );
//   }
// }
class Product {
  final String id;
  final String name;
  final String description;
  final dynamic price; // The price can be either a double or a formatted string, depending on the use case.

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['title'],
      description: json['description'],
      price: json['price']['formatted'],
    );
  }
}
