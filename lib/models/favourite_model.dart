class FavouriteModel {
  final String? title;
  final String? image;
  final String? extraIngredient;
  final double? price;
  bool isFavourite;
  FavouriteModel(
      {required this.title,
      required this.image,
      required this.extraIngredient,
      required this.price,
      this.isFavourite = false});
}
