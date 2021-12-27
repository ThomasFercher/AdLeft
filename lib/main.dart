import 'package:adleft/logic/firebase/auth_provider.dart';
import 'package:adleft/logic/objects/product.dart';
import 'package:adleft/logic/providers/productProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legend_design_core/legend_design_app.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/typography/typography.dart';
import 'package:provider/provider.dart';
import 'styles/appConfig.dart';
import 'styles/layoutConfig.dart';
import 'firebase_options.dart';

void main() {
  /* TODO:

  give ThemeProvider a basic typrography (fontFamily, Weight, Sacing, etc, Color and Size (overiides))
  also create Typography Color System

  if Color not specifed give Colors over theme ColorTheme; 
 them same  TextStyle Sizing and the Sizing Themes
*/
  List<Product> products = [
    Product(
      name: "Produkt 2",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
      price: 4.99,
      link:
          "https://www.gamefuel.com/collections/shop-all/products/cherry-burst",
      uid: "1",
      imagePath: "./assets/images/product.png",
    ),
    Product(
      name: "Produkt 2",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
      price: 12.99,
      link:
          "https://www.gamefuel.com/collections/shop-all/products/cherry-burst",
      uid: "2",
      imagePath: "./assets/images/product.png",
    ),
    Product(
      name: "Produkt 3",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
      price: 69,
      link:
          "https://www.gamefuel.com/collections/shop-all/products/cherry-burst",
      uid: "3",
      imagePath: "./assets/images/product.png",
    ),
    Product(
      name: "Produkt 4",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
      price: 120,
      link:
          "https://www.gamefuel.com/collections/shop-all/products/cherry-burst",
      uid: "4",
      imagePath: "./assets/images/product.png",
    ),
  ];

  runApp(
    LegendApp(
      drawerRoutes: AppConfig.drawerRoutes,
      menuOptions: AppConfig.menuOptions,
      routes: AppConfig.routes,
      title: "Ad Left",
      logo: null,
      theme: ThemeProvider(
        darkTheme: AppConfig.darkColorTheme,
        lightTheme: AppConfig.lightColorTheme,
        sizingTheme: AppConfig.sizingTheme,
        themeType: LegendColorThemeType.DARK,
        typography: LegendTypography(
          //   base: GoogleFonts.nunito(),
          h6: GoogleFonts.lobsterTwo(),
        ),
      ),
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(
            products: products,
            wishlist: [],
          ),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
      globalFooter: LayoutInfo.footer,
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      splashScreen: Container(
        color: AppConfig.darkColorTheme.scaffoldBackgroundColor,
        child: Center(
          child: SizedBox(
            height: 64,
            width: 64,
            child: CircularProgressIndicator(
              color: AppConfig.darkColorTheme.primaryColor,
            ),
          ),
        ),
      ),
    ),
  );
}
