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
  // Map<String, dynamic> productList = {
  //   "id": 12,
  //   "title":
  //       "WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive",
  //   "price": 114,
  //   "description":
  //       "Expand your PS4 gaming experience, Play anywhere Fast and easy, setup Sleek design with high capacity, 3-year manufacturer's limited warranty",
  //   "category": "electronics",
  //   "image": "https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_.jpg",
  //   "rating": {"rate": 4.8, "count": 400}
  // };

  @override
  Widget build(BuildContext context) {
    // products.add(productList);
    return StreamBuilder(
        stream: products.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> productsList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              productsList.add(ProductModel.fromJson(snapshot.data!.docs[i]));
            }
            return Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 50),
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: productsList.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 50,
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