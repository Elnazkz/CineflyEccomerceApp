import 'package:cinefly_internship_task/constants/app_strings.dart';
import 'package:cinefly_internship_task/features/cart/cart_controller.dart';
import 'package:cinefly_internship_task/features/cart/cart_list_item.dart';
import 'package:flutter/material.dart';
import '../models/product_dto.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  List<ProductDto> productList = [];
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: productList.isEmpty
            ? const Center(
                child: Text(Strings.noProductsInCartMsg),
              )
            : Column(children: [
                Expanded(
                    child: ListView.separated(
                        padding: const EdgeInsets.all(2.0),
                        separatorBuilder: (context, index) => const Divider(
                              color: Colors.black,
                            ),
                        itemCount: productList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CartListItem(
                            imageUrl: productList[index].imageUrl,
                            name: productList[index].name,
                            quantity: productList[index].quantity,
                            price: productList[index].price,
                            id: productList[index].id,
                            onQuantityChanged: (isAdded) {
                              isAdded
                                  ? productList[index].quantity += 1
                                  : productList[index].quantity -= 1;
                              if (!isAdded &&
                                  productList[index].quantity == 0) {
                                productList.removeAt(index);
                              }
                              reloadList();
                            },
                          );
                        })),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(Strings.total),
                        Text('\$${total.toStringAsFixed(2)}')
                      ],
                    ),
                  ),
                )
              ]));
  }

  //TODO Should move this to a viewmodel/a mediator not in view
  Future<void> loadProducts() async {
    var products = await CartController.loadCartFromSharedPref();
    //to update the member value in the statefulwidget
    setPageState(products);
  }

  Future<void> reloadList() async {
    var products = await CartController.saveCartToSharedPref(productList);
    //to update the member value in the statefulwidget
    setPageState(products);
  }

  void setPageState(products) {
    setState(() {
      productList = products;
      total = CartController.calculateTotal(productList);
    });
  }
}
