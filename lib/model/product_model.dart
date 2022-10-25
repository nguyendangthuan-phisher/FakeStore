class ProductModel {
  num? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  double? rate;
  num? rateCount;
  num? count;

  ProductModel({
    this.id,
    this.title,
    this.category,
    this.description,
    this.image,
    this.price,
    this.rate,
    this.rateCount,
    this.count
  });

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      image: json['image'],
      category: json['category'],
      description: json['description'],
      rate: json['rating']['rate'],
      rateCount: json['rating']['count'],
    );
  }


}
