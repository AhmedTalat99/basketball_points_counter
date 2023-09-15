import 'package:store/Models/product_model.dart';
import 'package:store/helper/api.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    // Note in url below , i must remove : which before $categoryName
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length;i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}
