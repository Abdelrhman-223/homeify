// ignore_for_file: public_member_api_docs, sort_constructors_first

class Category {
  int id;
  Category({
    required this.id,
  });
 factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id :0);
}}
