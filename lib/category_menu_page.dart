// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'colors.dart';
import 'model/app_state_model.dart';
import 'model/product.dart';

class CategoryMenuPage extends StatelessWidget {
  final List<Category> _categories = Category.values;
  final VoidCallback onCategoryTap;

  const CategoryMenuPage({
    Key key,
    this.onCategoryTap,
  }) : super(key: key);

  Widget _buildCategory(Category category, BuildContext context) {
    final categoryString =
        category.toString().replaceAll('Category.', '').toUpperCase();
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Provider.of<AppStateModel>(context).setCategory(category);
        if (onCategoryTap != null) onCategoryTap();
      },
      child: Provider.of<AppStateModel>(context).selectedCategory == category
          ? Column(
                children: <Widget>[
                  SizedBox(height: 16.0),
                  Text(
                    categoryString,
                    style: theme.textTheme.body2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 14.0),
                  Container(
                    width: 70.0,
                    height: 2.0,
                    color: kShrinePink400,
                  ),
                ],
              )
          : Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                categoryString,
                style: theme.textTheme.body2
                    .copyWith(color: kShrineBrown900.withAlpha(153)),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 40.0),
        color: kShrinePink100,
        child: ListView(
          children: _categories.map((c) => _buildCategory(c, context)).toList(),
        ),
      ),
    );
  }
}
