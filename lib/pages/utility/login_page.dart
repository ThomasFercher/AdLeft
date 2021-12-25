import 'package:adleft/logic/objects/product.dart';
import 'package:adleft/logic/providers/productProvider.dart';
import 'package:adleft/overrides/productCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/layout/legend_scaffold.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/utils/legend_utils.dart';
import 'package:legend_design_widgets/datadisplay/card/legendCard.dart';
import 'package:legend_design_widgets/datadisplay/carousel/legendCarousel.dart';
import 'package:legend_design_widgets/input/form/legendForm.dart';
import 'package:legend_design_widgets/input/form/legendFormField.dart';
import 'package:legend_design_widgets/input/text/legendInputDecoration.dart';
import 'package:legend_design_widgets/input/text/legendTextField.dart';
import 'package:legend_design_widgets/layout/grid/legendGrid.dart';
import 'package:legend_design_widgets/layout/grid/legendGridSize.dart';
import 'package:legend_design_widgets/legendButton/legendButton.dart';
import 'package:legend_design_widgets/legendButton/legendButtonStyle.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    ThemeProvider theme = context.watch<ThemeProvider>();

    return LegendScaffold(
      singlePage: true,
      verticalChildrenSpacing: 0,
      disableContentDecoration: true,
      contentBuilder: (context, size) {
        return Container(
          width: size.width,
          height: size.height,
          color: Colors.deepOrange[100],
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 120),
                  child: Container(
                    width: 320,
                    height: 420,
                    child: Card(
                      color: theme.colors.cardBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: theme.sizing.borderRadius[0],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          24,
                        ),
                        child: Column(
                          children: [
                            LegendText(
                              text: "Login",
                              textStyle: theme.typography.h5,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: LegendForm(
                                      showSubmitButton: false,
                                      buildSubmitButton: (key) {
                                        return LegendButton(
                                          text: LegendText(
                                            text: "Anmelden",
                                          ),
                                          onPressed: () {
                                            key.currentState?.validate();
                                          },
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 8,
                                          ),
                                          style: LegendButtonStyle.confirm(
                                            height: 42,
                                            color: theme.colors.primaryColor,
                                            activeColor:
                                                theme.colors.selectionColor,
                                            textColor:
                                                theme.colors.textColorLight,
                                          ),
                                        );
                                      },
                                      children: [
                                        Expanded(child: Container()),
                                        LegendFormField.text(
                                          title: "Email",
                                          isRequired: true,
                                          text: LegendTextField(
                                            decoration: LegendInputDecoration(
                                              prefixIcon: const Icon(
                                                Icons.email_outlined,
                                              ),
                                              textColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                        LegendFormField.text(
                                          title: "Password",
                                          isRequired: true,
                                          text: LegendTextField(
                                            decoration: LegendInputDecoration(
                                              prefixIcon: const Icon(
                                                Icons.password_outlined,
                                              ),
                                              textColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(child: Container()),
                                            LegendButton(
                                              text: LegendText(
                                                text: "Passwort vergessen?",
                                              ),
                                              onPressed: () {
                                                print("password");
                                              },
                                              style: LegendButtonStyle.text(
                                                activeColor:
                                                    theme.colors.selectionColor,
                                                color:
                                                    theme.colors.textColorLight,
                                                height: 34,
                                                width: LegendUtils.calcTextSize(
                                                      "Passwort vergessen?",
                                                      theme.typography.h1,
                                                    ).width +
                                                    16,
                                                textStyle: theme.typography.h1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(child: Container()),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: LegendButton(
                                      text: RichText(
                                        text: TextSpan(
                                          text: 'oder ',
                                          style: theme.typography.h1,
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: 'Registrieren',
                                              style:
                                                  theme.typography.h1.copyWith(
                                                color:
                                                    theme.colors.primaryColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onPressed: () {
                                        print("password");
                                      },
                                      style: LegendButtonStyle.text(
                                        activeColor:
                                            theme.colors.selectionColor,
                                        color: theme.colors.primaryColor,
                                        height: 34,
                                        width: LegendUtils.calcTextSize(
                                              "Passwort vergessen?",
                                              theme.typography.h1,
                                            ).width +
                                            16,
                                        textStyle: theme.typography.h1,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      layoutType: LayoutType.Content,
      pageName: "Login",
    );
  }
}
