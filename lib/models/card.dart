class CardModule {
  final int id;
  final double price;
  final String productImg;
  final String location;
  final String productName;
  const CardModule({
    required this.id,
    required this.price,
    required this.productImg,
    required this.location,
    required this.productName,
  });

  CardModule copyWith(double newPrice) {
    return CardModule(
      id: this.id,
      price: newPrice,
      productImg: this.productImg,
      location: this.location,
      productName: this.productName,
    );
  }
}
