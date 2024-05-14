import 'package:flutter/material.dart';
import 'package:shoppingapp/models/product_model.dart';

class CustomCard extends StatefulWidget {
  CustomCard({super.key, required this.product});
  ProductModel product;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isClick = false;
  Color? favColor = Colors.grey;
  int showTitle = 2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'updateProductpageId',
            arguments: widget.product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  color: Colors.grey.shade200,
                  blurRadius: 5,
                  blurStyle: BlurStyle.normal,
                  offset: Offset(1, 1))
            ]),
            child: Card(
              elevation: 10,
              shadowColor: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isClick = !isClick;
                          if (isClick) {
                            showTitle = 10;
                          } else {
                            showTitle = 2;
                          }
                        });
                      },
                      child: Text(
                        widget.product.title,
                        maxLines: showTitle,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16, color: Colors.black.withOpacity(.7)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' + widget.product.price.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              color: const Color.fromARGB(231, 0, 0, 0)),
                        ),
                        IconButton(
                            tooltip: 'add to favorites',
                            onPressed: () {
                              int id = widget.product.id;
                              // Navigator.pushNamed(context, 'favorites',
                              //     arguments: widget.product);
                              setState(() {
                                isClick = !isClick;
                                if (isClick == true) {
                                  favColor = Colors.red;
                                } else
                                  favColor = Colors.grey;
                              });
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: favColor,
                              size: 26,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            right: 10,
            child: Image.network(
              widget.product.image,
              width: 100,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
