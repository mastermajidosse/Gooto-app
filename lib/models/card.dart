import 'package:gooto/models/comments.dart';

class CardModule {
  final int id;
  final double price;
  final String productImg;
  final String location;
  final String rating;
  final String productName;
  final List<String> previewImgs;
  final String description;
  final List<Comments> listcoments;
  const CardModule({
    required this.id,
    required this.price,
    required this.productImg,
    required this.location,
    required this.rating,
    required this.productName,
    required this.previewImgs,
    required this.description,
    required this.listcoments
  });

  CardModule copyWith(double newPrice) {
    return CardModule(
      id: this.id,
      price: newPrice,
      productImg: this.productImg,
      location: this.location,
      rating: this.rating,
      productName: this.productName,
      previewImgs: this.previewImgs,
      description: this.description,
      listcoments: this.listcoments
    );
  }
}
