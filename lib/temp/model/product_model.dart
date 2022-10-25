class ProductModel {
  num? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  ProductModel(
      {this.id,
      this.title,
      this.category,
      this.description,
      this.image,
      this.price});
  factory ProductModel.fromJson(Map<String,dynamic> json){
    return ProductModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price']
    );
  }
}
