import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final double price;
  final String description;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });

  // Factory method to create a Product object from a JSON object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
    );
  }

  // Convert a Product object to a JSON object
  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
        'description': description,
        'image': image,
      };

  @override
  List<Object?> get props => [
        name,
        price,
        description,
        image,
      ];
}
