import 'package:flutter/material.dart';
import 'package:providerbasis/modal/product.dart';

class ListViewDetail extends StatelessWidget {
  final Product provider;
  const ListViewDetail({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size  = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 300,
      decoration: BoxDecoration(
      color: Colors.white,
        image: DecorationImage(
          image: AssetImage("${provider.iamge}"),
        ),
      ),
    );
  }
}
