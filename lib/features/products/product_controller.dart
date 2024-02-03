import 'package:cinefly_internship_task/constants/app_strings.dart';
import 'package:cinefly_internship_task/services/storage_services.dart';
import '../../models/product_dto.dart';

class ProductController {
  static Future<List<ProductDto>> getProductListFromJson() async {
    List<ProductDto> productList = [];

    //read the json file
    var jsonData = await StorageUtils.loadJsonAsset(Strings.productsCataloguePath);
    //if there is data in the file
    if (jsonData != null && jsonData['products'] != null) {
      for (var product in jsonData['products']) {
        productList.add(ProductDto.fromJson(product));
      }
    }

    return productList;
  }
}
