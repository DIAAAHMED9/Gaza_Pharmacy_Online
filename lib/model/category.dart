class CategoryModel {
  final String categoryId;
  String name;
  String image;

  CategoryModel({
    required this.categoryId,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'image': image,
  };

  factory CategoryModel.fromJson(String docId,Map<String, dynamic> json) => CategoryModel(
    categoryId:   docId,
    name: json['name'], 
    image: json['image'],
  );
}