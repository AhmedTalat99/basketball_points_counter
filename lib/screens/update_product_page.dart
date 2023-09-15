import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/Models/product_model.dart';
import 'package:store/services/update_product_service.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              CustomTextField(
                hintText: 'Product Name',
                onChanged: (data) {
                  productName = data;
                },
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: 'Description',
                onChanged: (data) {
                  desc = data;
                },
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: 'Price',
                onChanged: (data) {
                  price = data;
                },
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: 'Image',
                onChanged: (data) {
                  image = data;
                },
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: CustomButton(
                  text: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      print('success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;

                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      title: productName == null ? product.title : productName!,
      id: product.id,
      price: price == null ? product.price : price!,
      description: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
