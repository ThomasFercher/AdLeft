import 'package:adleft/logic/firebase/auth_provider.dart';
import 'package:adleft/logic/objects/product.dart';
import 'package:adleft/logic/providers/productProvider.dart';
import 'package:adleft/overrides/appBarBuilder.dart';

import 'package:adleft/overrides/wishlist_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/layout/legend_scaffold.dart';
import 'package:legend_design_core/router/routeInfoProvider.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/utils/legend_utils.dart';
import 'package:legend_design_widgets/datadisplay/searchableList.dart/legend_searchable.dart';
import 'package:legend_design_widgets/datadisplay/searchableList.dart/legend_searchable_list.dart';
import 'package:legend_design_widgets/input/sortIcon/sortIcon.dart';
import 'package:legend_design_widgets/layout/customFlexLayout/legend_custom_flex_layout.dart';
import 'package:legend_design_widgets/legendButton/legendButton.dart';
import 'package:legend_design_widgets/legendButton/legendButtonStyle.dart';
import 'package:provider/src/provider.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RouteSettings? route = RouteInfoProvider.of(context)?.route;
    ThemeProvider theme = context.watch<ThemeProvider>();
    User? user = context.watch<AuthProvider>().getUser;

    List<Product> wishlistItems = [
      Product(
          name: "Produkt 2",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
          price: 12.99,
          link:
              "https://www.gamefuel.com/collections/shop-all/products/cherry-burst",
          uid: "2",
          imagePath: "./assets/images/product.png",
          category: "Technik"),
      Product(
          name: "Produkt 3",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
          price: 69,
          link:
              "https://www.gamefuel.com/collections/shop-all/products/cherry-burst",
          uid: "3",
          imagePath: "./assets/images/product.png",
          category: "Technik"),
      Product(
        name: "Produkt 4",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
        price: 24,
        link:
            "https://www.gamefuel.com/collections/shop-all/products/cherry-burst",
        uid: "3",
        imagePath: "./assets/images/product.png",
        category: "Clothing",
      ),
    ];

    List<SortableField> sortabelFields = [
      SortableField<double>(
        index: 2,
      ),
      SortableField<String>(
        index: 0,
      ),
    ];

    return LegendScaffold(
      pageName: "Wishlist",
      layoutType: LayoutType.FixedHeader,
      showAppBarMenu: true,
      appBarBuilder: (context) => AppBarBuilder(
        showUsername: true,
        showWishList: false,
      ),
      singlePage: true,
      contentBuilder: (context, size) {
        return Container(
          width: size.width,
          padding: EdgeInsets.all(
            theme.sizing.padding[0],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LegendText(
                text: "Wishlist",
                textStyle: theme.typography.h5,
              ),
              Expanded(
                child: LegendSearchableList(
                  buildHeader: (sort) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: LegendCustomFlexLayout(
                        height: 64,
                        item: LegendFlexItem.row(
                          childrenIndex: [0, 1, 2, 3],
                          childrenFlex: [6, 6, 6, 1],
                        ),
                        widgets: [
                          Row(
                            children: [
                              LegendText(
                                text: "Name",
                                textStyle: theme.typography.h4,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              LegendSortIcon(
                                onClicked: (status) {
                                  sort(sortabelFields[1], status);
                                },
                              )
                            ],
                          ),
                          Row(
                            children: [
                              LegendText(
                                text: "Preis",
                                textStyle: theme.typography.h4,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              LegendSortIcon(
                                onClicked: (status) {
                                  sort(sortabelFields[0], status);
                                },
                              )
                            ],
                          ),
                          LegendText(
                            text: "Kategorie",
                            textStyle: theme.typography.h4,
                          ),
                          Container(),
                        ],
                      ),
                    );
                  },
                  itemCount: wishlistItems.length,
                  itemWidgets: wishlistItems
                      .map((e) => WishlistItem(product: e))
                      .toList(),
                  sortableFields: sortabelFields,
                  filterHeight: 260,
                  customFilterLayout: LegendFlexItem.column(
                    childrenIndex: [
                      0,
                    ],
                    children: [
                      LegendFlexItem.row(
                        spacing: 16,
                        childrenIndex: [
                          1,
                          2,
                        ],
                      )
                    ],
                  ),
                  items: wishlistItems
                      .map(
                        (e) => LegendSearchable(
                          fields: [
                            LegendSearchableString(e.name),
                            LegendSearchableString(e.description),
                            LegendSearchableNumber(e.price),
                            LegendSearchableCategory(e.category),
                          ],
                        ),
                      )
                      .toList(),
                  filters: [
                    LegendSearchableFilterString(
                      displayName: "Search",
                    ),
                    LegendSearchableFilterRange(
                      displayName: "Select Price",
                      singleField: 2,
                      range: Tween(
                        begin: 0,
                        end: 100,
                      ),
                    ),
                    LegendSearchableFilterCategory(
                      displayName: "Categories",
                      singleField: 3,
                      categories: [
                        FilterCategoryData(
                          value: "Technik",
                          icon: Icons.account_tree_rounded,
                        ),
                        FilterCategoryData(
                          value: "Clothing",
                          icon: Icons.add_shopping_cart_sharp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
