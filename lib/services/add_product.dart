import 'package:store/Models/product_model.dart';
import 'package:store/helper/api.dart';

class AddProduct {
  Future<ProductModel> addProduct(
      {required String title,
      required double price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        await Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    return ProductModel.fromJson(data);
  }
}
