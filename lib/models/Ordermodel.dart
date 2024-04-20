// ignore_for_file: public_member_api_docs, sort_constructors_first

class Order {
  int id;
  Order({
    required this.id,
  });
 factory Order.fromJson(Map<String, dynamic> json) {
    return Order(id:0);
}}
