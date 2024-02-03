
class ProductDto {
  String id;
  String name;
  String description;
  double price;
  String imageUrl;
  int quantity;

  ProductDto(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.quantity = 0});

  //Object or dynamic
  factory ProductDto.fromJson(Map<String, dynamic> json) {
    try {
      return ProductDto(
        id: json['id'].toString(),
        name: json['name'].toString(),
        description: json['description'].toString(),
        price: json['price'] as double,
        imageUrl: json['imageUrl'].toString(),
        quantity: (json['quantity'] ?? 0) as int,
      );
    } catch (e) {
      print("FormatException Error");
      return ProductDto(
        id: json['id'].toString(),
        name: json['name'].toString(),
        description: json['description'].toString(),
        price: 0.0,
        imageUrl: json['imageUrl'].toString(),
        quantity: 0,
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'quantity': quantity
    };
  }
}
