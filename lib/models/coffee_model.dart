class CoffeeCategoryModel {
  final String? name;
  final List<CoffeeModel>? items;
  CoffeeCategoryModel({required this.name, required this.items});
}

class CoffeeModel {
  final String? title;
  final String? image;
  final String? extraIngredient;
  final String? description;
  final double? price;
  final double? rating;
  bool? isFavourite;

  CoffeeModel(
      {required this.title,
      required this.image,
      required this.extraIngredient,
      required this.description,
      required this.price,
      required this.rating,
      this.isFavourite = false});
}

final List<CoffeeCategoryModel> categories = [
  CoffeeCategoryModel(name: 'Cappuccino', items: [
    CoffeeModel(
        title: 'Cappuccino',
        image: 'assets/images/coffee_1.png',
        extraIngredient: 'with Chocolate',
        description:
            "A cappuccino: 150 ml (5 oz) with 25 ml espresso, 85 ml fresh milk, and a foamy top from steamed milk and foam. A timeless classic, offering a balanced blend of strong coffee and creamy finish in a small cup.",
        price: 4.53,
        rating: 4.8,
        isFavourite: false),
    CoffeeModel(
        image: 'assets/images/coffee_2.jpeg',
        title: 'Cappuccino',
        extraIngredient: 'with Oat Milk',
        description:
            "Oat Milk Cappuccino: 150 ml (5 oz) with 25 ml espresso, 85 ml oat milk, and a frothy top. Bold espresso meets creamy, nutty oat flavor—a delicious, dairy-free alternative with a classic cappuccino touch.",
        price: 3.90,
        rating: 4.9,
        isFavourite: false),
    CoffeeModel(
        image: 'assets/images/coffee_3.jpeg',
        title: 'Cappuccino',
        extraIngredient: 'with Oat Milk',
        description:
            "A 150 ml (5 oz) cappuccino with Oat Milk combines 25 ml of bold espresso, 85 ml of creamy oat milk, and frothy steamed oat milk and foam. This dairy-free variant offers a perfect balance of rich coffee and subtle sweetness from oats, catering to plant-based preferences while maintaining the classic cappuccino experience.",
        price: 3.90,
        rating: 4.5,
        isFavourite: false),
    CoffeeModel(
        image: 'assets/images/coffee_5.jpeg',
        title: 'Cappuccino',
        extraIngredient: 'with Hazelnut',
        description:
            "A 150 ml Hazelnut Chocolate Cappuccino blends 25 ml bold espresso, 85 ml oat milk, and frothy steamed oat milk. The hazelnut infusion adds rich, nutty flavor for a perfect balance of coffee richness and delightful sweetness. Ideal for hazelnut enthusiasts, it's a dairy-free twist on the classic cappuccino.",
        price: 3.93,
        rating: 4.5,
        isFavourite: false)
  ]),
  CoffeeCategoryModel(name: 'Machinato', items: [
    CoffeeModel(
        title: 'Machinato',
        image: 'assets/images/machinato_1.png',
        extraIngredient: 'with Espresso',
        description:
            "Machinato's 150 ml Espresso Blend cappuccino blends 25 ml premium espresso with 85 ml fresh milk. Its expertly crafted foamy top, created with equal parts steamed milk and milk foam, offers a visually appealing and creamy texture. Striking a perfect balance between robust coffee flavor and a creamy finish, it's a timeless choice for classic cappuccino enthusiasts.",
        price: 4.53,
        rating: 4.8,
        isFavourite: false),
    CoffeeModel(
        title: 'Machinato',
        image: 'assets/images/machinato_2.png',
        extraIngredient: 'with Caramel',
        description:
            "Machinato's 150 ml Espresso Blend cappuccino: 25 ml premium espresso, 85 ml fresh milk, a foamy top with equal parts steamed milk and foam. Perfect balance of robust coffee flavor and creaminess, ideal for classic cappuccino enthusiasts.",
        price: 4.53,
        rating: 4.8,
        isFavourite: false),
    CoffeeModel(
        title: 'Machinato',
        image: 'assets/images/machinato_3.jpeg',
        extraIngredient: 'with Hazelnut',
        description:
            "Machinato's 150 ml Hazelnut Mocha: 25 ml espresso, rich hazelnut, and cocoa flavors. A delightful, satisfying experience in a small cup for hazelnut and chocolate enthusiasts.",
        price: 4.53,
        rating: 4.8,
        isFavourite: false),
    CoffeeModel(
        title: 'Machinato',
        image: 'assets/images/machinato_4.png',
        extraIngredient: 'with Cinnamon',
        description:
            "Machinato's 150 ml Cinnamon Spice: 25 ml espresso infused with delightful cinnamon essence. A small cup with a distinctive, aromatic experience for those who enjoy a touch of spice in their coffee. Indulge in the rich, inviting flavors for a truly delightful coffee moment.",
        price: 4.53,
        rating: 4.8,
        isFavourite: false),
  ]),
  CoffeeCategoryModel(name: 'Latte', items: [
    CoffeeModel(
        title: 'Latte',
        image: 'assets/images/latte_1.png',
        extraIngredient: 'with Vanilla',
        description:
            "Machinato's 150 ml Latte Vanilla Dream: 25 ml espresso seamlessly blended with luscious vanilla. A harmonious, velvety experience in every sip, served in a small cup. Indulge in the delightful warmth and richness for a truly dreamlike coffee experience.",
        price: 4.53,
        rating: 4.8,
        isFavourite: false),
    CoffeeModel(
        title: 'Latte',
        image: 'assets/images/latte_2.jpeg',
        extraIngredient: 'with Caramel',
        description:
            "Machinato's 150 ml Latte Vanilla Dream: 25 ml espresso seamlessly blended with luscious vanilla. A harmonious, velvety experience in every sip, served in a small cup. Indulge in the delightful warmth and richness—an irresistible choice for a dreamlike coffee experience.",
        price: 4.53,
        rating: 4.8,
        isFavourite: false),
    CoffeeModel(
        title: 'Latte',
        image: 'assets/images/latte_3.png',
        extraIngredient: 'with Chai',
        description:
            "Machinato's 150 ml Spiced Chai Latte: 25 ml espresso blended with aromatic chai spices. A velvety delight in a small cup, offering a perfect blend of robust coffee and comforting spice. Immerse yourself in the rich aroma and elevate your coffee experience with Machinato's enticing Spiced Chai Latte—an escape to delightful flavors.",
        price: 4.53,
        rating: 4.8,
        isFavourite: false),
    CoffeeModel(
        title: 'Latte',
        image: 'assets/images/latte_4.jpeg',
        extraIngredient: 'with Peppermint',
        description:
            "Machinato's 150 ml Peppermint Joy Latte: 25 ml espresso blended with invigorating peppermint. In a small cup, harmonizing robust coffee with cool minty freshness—a quick and joyful escape. Elevate your coffee break with Machinato's delightful Peppermint Joy Latte—a celebration in every swift sip.",
        price: 4.53,
        rating: 4.8,
        isFavourite: false),
  ]),
  CoffeeCategoryModel(name: 'Americano', items: [
    CoffeeModel(
        title: 'Americano',
        image: 'assets/images/americano_1.png',
        extraIngredient: 'with Vanilla',
        description:
            "Machinato's 150 ml Vanilla Bliss Americano: 25 ml espresso blended with soothing vanilla essence. In a modest cup, it weaves rich coffee notes with gentle vanilla warmth—a serene celebration in every sip. Elevate your coffee break with Machinato's delightful Vanilla Bliss Americano, promising pure bliss in each moment.",
        price: 4.53,
        rating: 4.8,
        isFavourite: false),
    CoffeeModel(
        title: 'Americano',
        image: 'assets/images/americano_2.png',
        extraIngredient: 'with Zest',
        description:
            "Machinato's 150 ml Vanilla Bliss Americano: 25 ml espresso blended with soothing vanilla. In a modest cup, rich coffee notes weave with gentle vanilla warmth. Elevate your coffee break with Machinato's serene Vanilla Bliss Americano—a pure bliss celebration in every sip.",
        price: 4.53,
        rating: 4.8,
        isFavourite: false),
    CoffeeModel(
        title: 'Americano',
        image: 'assets/images/americano_3.png',
        extraIngredient: 'with Irish Cream ',
        description:
            "Machinato's 150 ml Irish Cream Euphoria Americano: 25 ml espresso blended with velvety Irish cream. In a modest cup, it elevates your coffee break with a rich fusion of bold coffee flavor and luxurious Irish cream. Savor the joy in every sip for a blissful celebration in each moment.",
        price: 4.53,
        rating: 4.8,
        isFavourite: false),
    CoffeeModel(
        title: 'Americano',
        image: 'assets/images/americano_4.png',
        extraIngredient: 'with Mocha Fusion',
        description:
            "Machinato's 150 ml Mocha Fusion Americano: 25 ml espresso blended with rich chocolate allure. In a modest cup, it transforms your coffee break with bold espresso and sweet chocolate decadence. Elevate your moment with Machinato's delightful Mocha Fusion Americano—a fusion in every sip.",
        price: 4.53,
        rating: 4.8,
        isFavourite: false),
  ])
];
