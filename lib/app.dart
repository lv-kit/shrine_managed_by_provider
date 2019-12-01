import './home.dart';
import './login.dart';
import './colors.dart';
import './backdrop.dart';
import './category_menu_page.dart';
import './expanding_bottom_sheet.dart';
import 'package:flutter/material.dart';
import './supplemental/cut_corners_border.dart';

class ShrineApp extends StatefulWidget {
  @override
 _ShrineAppState createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 450),
      value: 1.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shrine',
      home: HomePage(
        backdrop: Backdrop(
          frontLayer: ProductPage(),
          backLayer:
              CategoryMenuPage(onCategoryTap: () => _animationController.forward()),
          frontTitle: Text('SHRINE'),
          backTitle: Text('MENU'),
          controller: _animationController,
        ),
        expandingBottomSheet: ExpandingBottomSheet(hideController: _animationController),
      ),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: _kShrineTheme,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  if (settings.name != '/login') {
    return null;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (context) => LoginPage(),
    fullscreenDialog: true,
  );
}

final ThemeData _kShrineTheme = _buildShrineTheme();

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: kShrineBrown900);
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: kShrineColorScheme,
    accentColor: kShrineBrown900,
    primaryColor: kShrinePink100,
    buttonColor: kShrinePink100,
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    buttonTheme: const ButtonThemeData(
      colorScheme: kShrineColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconTheme(base.iconTheme),
    inputDecorationTheme: 
      const InputDecorationTheme(border: CutCornersBorder()),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
    .copyWith(
      headline: base.headline.copyWith(fontWeight: FontWeight.w500),
      title: base.title.copyWith(fontSize: 18.0),
      caption: base.caption.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      ),
      body2: base.body2.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
      button: base.button.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      ),
    )
    .apply(
      fontFamily: 'Rubik',
      displayColor: kShrineBrown900,
      bodyColor: kShrineBrown900,
    );
}

const ColorScheme kShrineColorScheme = ColorScheme(
  primary: kShrinePink100,
  primaryVariant: kShrineBrown900,
  secondary: kShrinePink50,
  secondaryVariant: kShrineBrown900,
  surface: kShrineSurfaceWhite,
  background: kShrineBackgroundWhite,
  error: kShrineErrorRed,
  onPrimary: kShrineBrown900,
  onSecondary: kShrineBrown900,
  onSurface: kShrineBrown900,
  onBackground: kShrineBrown900,
  onError: kShrineSurfaceWhite,
  brightness: Brightness.light,
);
