import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/Models/product_model.dart';
import 'package:store/services/get_all_products.dart';

import '../widgets/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.grey),
        ),
        title: const Text(
          'New Trend',
          style: TextStyle(fontSize: 25, color: Colors.grey),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.brown,
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.brown,
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.brown,
              ),
              label: 'shopping cart'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.brown,
              ),
              label: 'favorite'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_3,
                color: Colors.brown,
              ),
              label: 'person'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsServices().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 10, // y-axis
                  mainAxisSpacing: 100, // x-axis
                ),
                itemBuilder: (context, index) {
                  return  CustomCard(product: products[index],);
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
