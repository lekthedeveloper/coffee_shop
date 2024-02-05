class CartModel {
  final String? title;
  final String? imageLink;
  final String? extra;
  int quatity;
  final String? size;
  final double? price;

  CartModel(
      {required this.title,
      required this.imageLink,
      required this.extra,
      required this.size,
      required this.quatity,
      required this.price});
}
