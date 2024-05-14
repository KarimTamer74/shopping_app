import 'package:shoppingapp/constants/constants.dart';
import 'package:shoppingapp/models/product_model.dart';
import 'package:shoppingapp/widgets/custom_card-widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//kemo@gmail.com
class HomePageUI extends StatelessWidget {
  HomePageUI({super.key});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    // addProducts();

    return StreamBuilder(
        stream: products.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> productsList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              productsList.add(ProductModel.fromJson(snapshot.data!.docs[i]));
            }
            return Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 80),
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: productsList.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 100,
                      crossAxisSpacing: 20,
                      childAspectRatio: .9),
                  itemBuilder: (context, index) {
                    return CustomCard(
                      product: productsList[index],
                    );
                  }),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 5,
            ),
          );
        });
  }

  void addProducts() {
    for (var i in productsList) {
      products.add(i);
    }
  }
}
// return Padding(
//               padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 100),
//               child: GridView.builder(
//                   physics: BouncingScrollPhysics(),
//                   itemCount: productList.length,
//                   clipBehavior: Clip.none,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 100,
//                       crossAxisSpacing: 20,
//                       childAspectRatio: .9),
//                   itemBuilder: (context, index) {
//                     return CustomCard(
//                       product: productList[index],
//                     );
//                   }),
//             );