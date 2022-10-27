class ProductModel {
  int id=1;
  String? title;
  double price=0.0;
  String? description;
  String? category;
  String? image;
  double? rate;
  int rateCount=0;
  int count=1;

  ProductModel({
    this.id=1,
    this.title,
    this.category,
    this.description,
    this.image,
    this.price=0.0,
    this.rate,
    this.rateCount=0,
    this.count=1,
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
  void addOne() async {
    this.count=this.count+1;
  }
  void minusOne(List<ProductModel> listCart) async {
    if(this.count==1)
      listCart.remove(this);
    else
      this.count=this.count-1;
  }


}
