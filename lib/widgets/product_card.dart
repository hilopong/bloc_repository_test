import 'package:flutter/material.dart';

import '../Models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    Key? key, required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: 150,
          child: Image.network(
            product.NVC_ImgName,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 60,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 80,
            decoration: BoxDecoration(
                color: Colors.black.withAlpha(50)
            ),
          ),
        ),
        Positioned(
          top: 65,
          left: 5,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5 - 10,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.NVC_prdName,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
                        ),
                        Text(
                          product.I_discountPrice.toString()+"원",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}