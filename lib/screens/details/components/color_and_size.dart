import 'package:flutter/material.dart';
import '../../../models/Product.dart';

import '../../../constants.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: kTextColor),
              children: [
                TextSpan(text: "Product Description\n"),
                TextSpan(
                  text: "${product.description}",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        // Expanded(
        //   child: RichText(
        //     text: TextSpan(
        //       style: TextStyle(color: kTextColor),
        //       children: [
        //         TextSpan(text: "Size\n"),
        //         TextSpan(
        //           text: "${product.description} cm",
        //           style: Theme.of(context)
        //               .textTheme
        //               .headline5
        //               .copyWith(fontWeight: FontWeight.bold),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
