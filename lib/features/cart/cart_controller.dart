import 'dart:convert';

import 'package:cinefly_internship_task/constants/app_strings.dart';
import 'package:cinefly_internship_task/models/product_dto.dart';
import 'package:cinefly_internship_task/services/storage_services.dart';

class CartController {
  static Future<List<ProductDto>> loadCartFromSharedPref() async {
    List<ProductDto> productListInCart = [];

    final prefs = await StorageUtils.loadSharedPref();
    //read the json string saved in prefs
    String jsonString = prefs.getString(Strings.cart) ?? "";
    // if not empty get the list of products
    if (jsonString != "") {
      final data = jsonDecode(jsonString);
      productListInCart =
          data.map<ProductDto>((item) => ProductDto.fromJson(item)).toList();
    }
    return productListInCart;
  }

  static Future<List<ProductDto>> saveCartToSharedPref(
      List<ProductDto> products) async {
    final prefs = await StorageUtils.loadSharedPref();
    //make products from DTO to json
    final jsonList = products.map((product) => product.toJson()).toList();
    // Convert the list to json string
    String jsonString = jsonEncode(jsonList);
    //save json to sharedpref
    prefs.setString(Strings.cart, jsonString);
    return products;
  }

  static void changeAmountInCart(ProductDto product, bool shouldAdd) async {
    // get the cart list from pref
    List<ProductDto> productList = await loadCartFromSharedPref();
    //find the item
    int index = productList.indexWhere((item) => item.id == product.id);

    // if item is available
    if (index != -1) {
      shouldAdd
          ? productList[index].quantity += 1
          : productList[index].quantity -= 1;
      if (productList[index].quantity == 0) {
        productList.removeAt(index);
      }
    } else {
      product.quantity += 1;
      productList.add(product);
    }
    // Save updated list to SharedPreferences
    await saveCartToSharedPref(
        productList);
  }

  static double calculateTotal(List<ProductDto> productsList) {
    double total = 0.0;
    for (var product in productsList) {
      total += (product.price * product.quantity);
    }
    return total;
  }
}
