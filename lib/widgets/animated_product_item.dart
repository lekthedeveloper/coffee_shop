import 'package:coffee_shop/business_logic/cart_provider.dart';
import 'package:coffee_shop/widgets/animated_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../business_logic/category_provider.dart';
import '../routes_controller.dart';

class ProductItemListing extends StatefulWidget {
  final List listType;
  const ProductItemListing({super.key, required this.listType});

  @override
  State<ProductItemListing> createState() => _ProductItemListingState();
}

class _ProductItemListingState extends State<ProductItemListing> {
  final List<bool> _isTappedList = List.filled(10, false);
  onTap(int index) {
    if (mounted) {
      setState(() {
        _isTappedList[index] = true;
      });
    }

    Future.delayed(const Duration(seconds: 3), (() {
      if (mounted) {
        setState(() {
          _isTappedList[index] = false;
        });
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Consumer<CoffeeCategoryProvider>(
        builder: (context, value, child) => GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: widget.listType.length,
          padding: const EdgeInsets.all(0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              childAspectRatio: 0.65,
              mainAxisSpacing: 0),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RouteManager.detailsScreen, arguments: {
                      'title': widget.listType[index].title,
                      'price': widget.listType[index].price,
                      'extra': widget.listType[index].extraIngredient,
                      'image': widget.listType[index].image,
                      'description': widget.listType[index].description,
                      'rating': widget.listType[index].rating,
                      'isFavourite': widget.listType[index].isFavourite
                    });
                  },
                  child: AnimatedProductITem(
                    listType: value.getCappuccinoItems(value.name)[index],
                    isTapped: _isTappedList[index],
                    tap: () {
                      onTap(index);
                    },
                    toastTap: () {
                      context
                          .read<CartProvider>()
                          .getITemTitle(widget.listType[index].title);
                      if (context
                          .read<CartProvider>()
                          .itemName
                          .contains(widget.listType[index].extraIngredient)) {
                        context.read<CartProvider>().itemNotinCartAnimation();
                      } else {
                        context.read<CartProvider>().startCartAnimation();
                      }
                    },
                  )),
            );
          },
        ),
      ),
    );
  }
}
