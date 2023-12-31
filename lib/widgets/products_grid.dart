import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import '../models/product.dart';
import './product_item.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  //final List<Product> loadedProducts;
  final bool showFas;
  ProductsGrid(this.showFas);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFas ? productsData.favouriteItems : productsData.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        // create: (c) => products[i],
        // builder: (c, i) => products[i],
        child: ProductItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl,
            ),
      ),
      itemCount: products.length,
      padding: const EdgeInsets.all(10),
    );
  }
}
