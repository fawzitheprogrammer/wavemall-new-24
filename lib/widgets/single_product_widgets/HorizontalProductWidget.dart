import 'package:wavemall/AppConfig/app_config.dart';
import 'package:wavemall/controller/settings_controller.dart';
import 'package:wavemall/model/Product/ProductModel.dart';
import 'package:wavemall/model/Product/ProductType.dart';
import 'package:wavemall/utils/format_price.dart';
import 'package:wavemall/utils/styles.dart';
import 'package:wavemall/view/products/product/product_details.dart';
import 'package:wavemall/widgets/StarCounterWidget.dart';
import 'package:wavemall/widgets/single_product_widgets/add_to_cart_icon.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorizontalProductWidget extends StatefulWidget {
  final ProductModel? productModel;
  HorizontalProductWidget({this.productModel});
  @override
  _HorizontalProductWidgetState createState() =>
      _HorizontalProductWidgetState();
}

class _HorizontalProductWidgetState extends State<HorizontalProductWidget> {
  final GeneralSettingsController currencyController =
      Get.put(GeneralSettingsController());

  double getPriceForCart() {
    return double.parse((widget.productModel!.hasDeal != null
            ? widget.productModel!.hasDeal!.discount! > 0
                ? currencyController.calculatePrice(widget.productModel!)
                : currencyController.calculatePrice(widget.productModel!)
            : currencyController.calculatePrice(widget.productModel!))
        .toString());
  }

  // int wishListId = 0;
  // bool checkWishList() {
  //   bool check;
  //   final LoginController _loginController = Get.put(LoginController());

  //   if (_loginController.loggedIn.value) {
  //     final MyWishListController _wishListController =
  //         Get.put(MyWishListController());

  //     _wishListController.wishListProducts.forEach((element) {
  //       if (element.id == widget.productModel.id) {
  //         wishListId = element.wishListId;
  //         check = true;
  //       } else {
  //         check = false;
  //       }
  //     });
  //   } else {
  //     check = false;
  //   }
  //   return check;
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (widget.productModel!.productType == ProductType.PRODUCT) {
          Get.to(() => ProductDetails(productID: widget.productModel!.id),
              preventDuplicates: false);
        }
      },
      child: Container(
        width: 170,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Color(0x1a000000),
              offset: Offset(0, 3),
              blurRadius: 6,
              spreadRadius: 0,
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        child: widget.productModel!.productType !=
                                ProductType.GIFT_CARD
                            ? widget.productModel!.product!
                                        .thumbnailImageSource !=
                                    null
                                ? FancyShimmerImage(
                                    imageUrl: AppConfig.assetPath +
                                        '/' +
                                        widget.productModel!.product!
                                            .thumbnailImageSource!,
                                    boxFit: BoxFit.contain,
                                    errorWidget: FancyShimmerImage(
                                      imageUrl:
                                          "${AppConfig.assetPath}/backend/img/default.png",
                                      boxFit: BoxFit.contain,
                                    ),
                                  )
                                : SizedBox()
                            : FancyShimmerImage(
                                imageUrl: AppConfig.assetPath +
                                    '/' +
                                    widget
                                        .productModel!.giftCardThumbnailImage!,
                                boxFit: BoxFit.contain,
                                errorWidget: FancyShimmerImage(
                                  imageUrl:
                                      "${AppConfig.assetPath}/backend/img/default.png",
                                  boxFit: BoxFit.contain,
                                ),
                              ),
                      ),
                      // widget.productModel!.productType == ProductType.GIFT_CARD
                      //     ? Positioned(
                      //         top: 0,
                      //         left: 0,
                      //         child: Align(
                      //           alignment: Alignment.topRight,
                      //           child: widget.productModel!.giftCardEndDate!
                      //                       .compareTo(DateTime.now()) >
                      //                   0
                      //               ? Container(
                      //                   padding: EdgeInsets.all(4),
                      //                   alignment: Alignment.center,
                      //                   decoration: BoxDecoration(
                      //                     borderRadius: BorderRadius.only(
                      //                         topLeft: Radius.circular(5)),
                      //                     color: AppStyles.pinkColor,
                      //                   ),
                      //                   child: Text(
                      //                     widget.productModel!.discountType ==
                      //                                 "0" ||
                      //                             widget.productModel!
                      //                                     .discountType ==
                      //                                 0
                      //                         ? '-${widget.productModel!.discount.toString()}% '
                      //                         : '${(widget.productModel!.discount! * currencyController.conversionRate.value).toStringAsFixed(2)}${currencyController.appCurrency.value} ',
                      //                     textAlign: TextAlign.center,
                      //                     style: AppStyles.appFontBook.copyWith(
                      //                       color: Colors.white,
                      //                       fontSize: 12,
                      //                     ),
                      //                   ),
                      //                 )
                      //               : SizedBox.shrink(),
                      //         ),
                      //       )
                      //     : Positioned(
                      //         top: 0,
                      //         left: 0,
                      //         child: Align(
                      //           alignment: Alignment.topRight,
                      //           child: widget.productModel!.hasDeal != null
                      //               ? widget.productModel!.hasDeal!.discount! > 0
                      //                   ? Container(
                      //                       padding: EdgeInsets.all(4),
                      //                       alignment: Alignment.center,
                      //                       decoration: BoxDecoration(
                      //                         borderRadius: BorderRadius.only(
                      //                             topLeft: Radius.circular(5)),
                      //                         color: AppStyles.pinkColor,
                      //                       ),
                      //                       child: Text(
                      //                         widget.productModel!.hasDeal!
                      //                                     .discountType ==
                      //                                 0
                      //                             ? '${widget.productModel!.hasDeal!.discount.toString()}% '
                      //                             : '${(widget.productModel!.hasDeal!.discount! * currencyController.conversionRate.value).toStringAsFixed(2)}${currencyController.appCurrency.value} ',
                      //                         textAlign: TextAlign.center,
                      //                         style: AppStyles.appFontBook
                      //                             .copyWith(
                      //                           color: Colors.white,
                      //                           fontSize: 12,
                      //                         ),
                      //                       ),
                      //                     )
                      //                   : Container()
                      //               : widget.productModel!.discountStartDate !=
                      //                           null &&
                      //                       currencyController.endDate
                      //                               .millisecondsSinceEpoch <
                      //                           DateTime.now()
                      //                               .millisecondsSinceEpoch
                      //                   ? Container()
                      //                   : widget.productModel!.discount! > 0
                      //                       ? Container(
                      //                           padding: EdgeInsets.all(4),
                      //                           alignment: Alignment.center,
                      //                           decoration: BoxDecoration(
                      //                             borderRadius:
                      //                                 BorderRadius.only(
                      //                                     topLeft:
                      //                                         Radius.circular(
                      //                                             5)),
                      //                             color: AppStyles.goldenYellowColor,
                      //                           ),
                      //                           child: Text(
                      //                             widget.productModel!
                      //                                         .discountType ==
                      //                                     "0"
                      //                                 ? '-${widget.productModel!.discount.toString()}% '
                      //                                 : '${(widget.productModel!.discount! * currencyController.conversionRate.value).toStringAsFixed(2)}${currencyController.appCurrency.value} ',
                      //                             textAlign: TextAlign.center,
                      //                             style: AppStyles.appFontBook
                      //                                 .copyWith(
                      //                               color: Colors.white,
                      //                               fontSize: 12,
                      //                             ),
                      //                           ),
                      //                         )
                      //                       : Container(),
                      //         ),
                      //       ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.productModel!.avgRating > 0
                            ? StarCounterWidget(
                                value:
                                    widget.productModel!.avgRating.toDouble(),
                                color: AppStyles.pinkColor,
                                size: 10,
                              )
                            : StarCounterWidget(
                                value: 0,
                                color: AppStyles.pinkColor,
                                size: 10,
                              ),
                        SizedBox(
                          width: 2,
                        ),
                        widget.productModel!.avgRating > 0
                            ? Text(
                                '(${widget.productModel!.avgRating.toString()})',
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.appFontBook.copyWith(
                                  color: AppStyles.greyColorDark,
                                  fontSize: 10,
                                ),
                              )
                            : Text(
                                '(0)',
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.appFontBook.copyWith(
                                  color: AppStyles.greyColorDark,
                                  fontSize: 10,
                                ),
                              ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Text(
                                widget.productModel!.productType ==
                                        ProductType.PRODUCT
                                    ? widget.productModel!.productName
                                        .toString()
                                    : widget.productModel!.giftCardName
                                        .toString(),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.appFontBold.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 5),
                              widget.productModel!.hasDeal != null
                                  ? widget.productModel!.hasDeal!.discount! > 0
                                      ? Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          alignment: WrapAlignment.start,
                                          runSpacing: 2,
                                          spacing: 2,
                                          runAlignment: WrapAlignment.start,
                                          children: [
                                            Text(
                                              '${currencyController.calculatePrice(widget.productModel!)}${currencyController.appCurrency.value}',
                                              overflow: TextOverflow.ellipsis,
                                              style: AppStyles.appFontBook
                                                  .copyWith(
                                                fontSize: 12,
                                                color: AppStyles.pinkColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              '${currencyController.calculateMainPrice(widget.productModel!)}',
                                              overflow: TextOverflow.ellipsis,
                                              style: AppStyles.appFontBook
                                                  .copyWith(
                                                fontSize: 12,
                                                color: AppStyles.greyColorDark,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ],
                                        )
                                      : Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          alignment: WrapAlignment.start,
                                          runSpacing: 2,
                                          spacing: 2,
                                          runAlignment: WrapAlignment.start,
                                          children: [
                                            Text(
                                              '${formatPrice(double.parse(currencyController.calculatePrice(widget.productModel!) ?? '0'), currencySymbol: currencyController.appCurrency.value)}',
                                              overflow: TextOverflow.ellipsis,
                                              style: AppStyles.appFontBook
                                                  .copyWith(
                                                fontSize: 12,
                                                color: AppStyles.pinkColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        )
                                  : Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      alignment: WrapAlignment.start,
                                      runSpacing: 2,
                                      spacing: 2,
                                      runAlignment: WrapAlignment.start,
                                      children: [
                                        Text(
                                          '${formatPrice(double.parse(currencyController.calculatePrice(widget.productModel!) ?? '0'), currencySymbol: currencyController.appCurrency.value)}',
                                          style: AppStyles.appFontBook.copyWith(
                                            fontSize: 12,
                                            color: AppStyles.goldenYellowColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          '${currencyController.calculateMainPrice(widget.productModel!)}',
                                          overflow: TextOverflow.ellipsis,
                                          style: AppStyles.appFontBook.copyWith(
                                            fontSize: 12,
                                            color: AppStyles.greyColorDark,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CartIcon(widget.productModel!),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
