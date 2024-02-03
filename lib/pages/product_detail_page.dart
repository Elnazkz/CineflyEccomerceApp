import 'package:cinefly_internship_task/constants/app_strings.dart';
import 'package:cinefly_internship_task/features/cart/cart_controller.dart';
import 'package:cinefly_internship_task/models/product_dto.dart';
import 'package:cinefly_internship_task/utilities/helpers.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductDto product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<StatefulWidget> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.product.name),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 20,
                  ),
                  child: Image.network(
                    widget.product.imageUrl,
                    height: 300,
                    width: 300,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 3.0),
                        decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                        height: 300,
                        width: 250,
                        child: const Center(child: Text(Strings.imageErrorMsg)),
                      );
                    },
                  )),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  widget.product.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                child: Text(
                  widget.product.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Text(
                '\$${widget.product.price}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.green),
              ),
              CustomButton(
                margin: 20.0,
                text: Strings.addToCart,
                onPressed: () {
                  CartController.changeAmountInCart(widget.product, true);
                  Helper.showToast(Strings.itemAdded);
                },
              )
            ],
          ),
        ));
  }
}
