import 'package:flutter/material.dart';
import 'package:shoppingapp/widgets/custom_text_form_field.dart';

class AddProduct extends StatefulWidget {
  AddProduct({
    super.key,
  });

  @override
  State<AddProduct> createState() => _AddProductState();
}

String? productName, productTitle, productDescription, productCategory;
num? productPrice, productId;

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        CustomTextFormField(
          hint: 'Product ID',
          onChanged: (data) {
            productId = int.parse(data);
          },
        ),
        CustomTextFormField(
          hint: 'Product Name',
          onChanged: (data) {
            productName = data;
          },
        ),
        CustomTextFormField(
          hint: 'Product title',
          onChanged: (data) {
            productTitle = data;
          },
        ),
        CustomTextFormField(
          hint: 'Product Description',
          onChanged: (data) {
            productDescription = data;
          },
        ),
        CustomTextFormField(
          hint: 'Product Price',
          onChanged: (data) {
            productPrice = double.parse(data);
          },
        ),
        CustomTextFormField(
          hint: 'Product Category',
          onChanged: (data) {
            productCategory = data;
          },
        ),
      ]),
    );
  }
}
