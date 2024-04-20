// ignore_for_file: public_member_api_docs, sort_constructors_first

class Product {
  int id;
  Product({
    required this.id,
  });
 factory Product.fromJson(Map<String, dynamic> json) {
    return Product(id:0);
}}
