import 'package:cinefly_internship_task/constants/app_strings.dart';
import 'package:cinefly_internship_task/pages/product_detail_page.dart';
import 'package:flutter/material.dart';

import '../features/products/product_controller.dart';
import '../features/products/product_list_item.dart';
import '../models/product_dto.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<ProductDto> productList = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: productList.isEmpty
          ? const Center(
              child: Text(Strings.noProductAvailable),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(2.0),
              separatorBuilder: (context, index) => const Divider(
                    color: Colors.black,
                  ),
              itemCount: productList.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductListItem(
                  id: productList[index].id,
                  imageUrl: productList[index].imageUrl,
                  name: productList[index].name,
                  description: productList[index].description,
                  price: productList[index].price,
                  onItemClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                                  product: productList[index],
                                )));
                  },
                );
              }),
    );
  }

  //TODO Should move this to a viewmodel/a mediator not in view
  Future<void> loadProducts() async {
    var products = await ProductController.getProductListFromJson();
    //to update the member value in the statefulwidget
    setState(() {
      productList = products;
    });
  }
}
