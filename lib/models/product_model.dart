class ProductModel {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel(this.id, this.title, this.price, this.description, this.category,
      this.image, this.rating);

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        jsonData['id'],
        jsonData['title'],
        jsonData['price'],
        jsonData['description'],
        jsonData['category'],
        jsonData['image'],
        RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel {
  final num rate;
  final int count;

  RatingModel( this.rate,  this.count);

  factory RatingModel.fromJson(jsonData) {
    return RatingModel( jsonData['rate'],  jsonData['count']);
  }
}
