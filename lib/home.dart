import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'backdrop.dart';
import 'expanding_bottom_sheet.dart';
import 'model/app_state_model.dart';
import 'model/product.dart';
import 'supplemental/asymmetric_view.dart';

class ProductPage extends StatelessWidget {
  final Category category;

  const ProductPage({this.category = Category.all});

  @override
  Widget build(BuildContext context) {
    return AsymmetricView(
      products: Provider.of<AppStateModel>(context).getProducts(),
    );
  }
}

class HomePage extends StatelessWidget {
  final ExpandingBottomSheet expandingBottomSheet;
  final Backdrop backdrop;

  const HomePage({Key key, this.expandingBottomSheet, this.backdrop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        backdrop,
        Align(child: expandingBottomSheet, alignment: Alignment.bottomRight)
      ],
    );
  }
}
