class ProductModel {
  String? id;
  String? categoryId;
  String? image;
  String name;
  double price;
  bool isLoved;
  

  ProductModel({
    this.id,
    required this.categoryId,
    required this.name,
    required this.image,
    required this.price,
    this.isLoved = false,
  });

  Map<String, dynamic> toJson() => {
    'categoryId': categoryId,
        'name': name,
        'image': 'assets/images/Item_1.png',
        'price': price,
        'isLoved': isLoved,
      };

  factory ProductModel.fromJson(String docId,Map<String, dynamic> json) => ProductModel(
        id: docId,  
        categoryId: json['categoriesId'],
        name: json['name'],
        image: json['image'],
        price: json['price'].toDouble(),
        isLoved: json['isLoved'],
      );
}
