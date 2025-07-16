//
// class Product {
//   final int id;
//   final String title;
//   final String description;
//   final double price;
//   final String thumbnail;
//   final double rating;
//   final double? discountPercentage;
//   final int ?stock;
//   final String ?brand;
//
//   Product( {
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.thumbnail,
//     required this.rating,
//     this.discountPercentage,  this.stock, this.brand,
//   });
//
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       title: json['title'],
//       description: json['description'],
//       price: (json['price'] as num).toDouble(),
//       thumbnail: json['thumbnail'],
//       rating: (json['rating'] as num).toDouble(),
//       discountPercentage:json['discountPercentage'].toDouble(),
//       stock: json['stock'],
//       brand: json['brand'],
//
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'title': title,
//     'description': description,
//     'price': price,
//     'thumbnail': thumbnail,
//     'rating':rating,
//     'discountPercentage':discountPercentage,
//     'stock':stock,
//     'brand':brand
//   };
// }
//
//
//
//
//
class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String thumbnail;
  final double rating;
  final double? discountPercentage;
  final int? stock;
  final String? brand;
  final String? category; // ✅ Added

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.thumbnail,
    required this.rating,
    this.discountPercentage,
    this.stock,
    this.brand,
    this.category, // ✅ Added
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      thumbnail: json['thumbnail'],
      rating: (json['rating'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      stock: json['stock'],
      brand: json['brand'],
      category: json['category'], // ✅ Added
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'price': price,
    'thumbnail': thumbnail,
    'rating': rating,
    'discountPercentage': discountPercentage,
    'stock': stock,
    'brand': brand,
    'category': category, // ✅ Added
  };
}
