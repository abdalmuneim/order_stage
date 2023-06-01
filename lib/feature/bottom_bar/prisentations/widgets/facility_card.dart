// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/app_constant/app_urls.dart';
import 'package:orderstage/core/resources/app_strings.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/feature/bottom_bar/data/models/resturant_model.dart';
import 'package:orderstage/feature/theme/presintations/controller/dynamic_theme_controller.dart';

import 'package:sizer/sizer.dart';

class FacilityCard extends StatelessWidget {
  FacilityCard({
    Key? key,
    required this.rest,
    required this.delivryTypeEnum,
  }) : super(key: key);
  final Facility rest;
  final DelivryTypeEnum delivryTypeEnum;

  int colorIndex = 1;
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Container(
        width: Get.width,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 1),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsetsDirectional.only(
                              top: 4, start: 8),
                          width: 23.w,
                          height: 11.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: MyColors.primary),
                          ),
                          child: CachedNetworkImage(
                              imageUrl: '${AppUrls.resLogoURL}${rest.id}.png',
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => const Image(
                                    image: AssetImage(
                                        "assets/images/empty_logo.png"),
                                  )),
                        ),
                        if (rest.hasPromo!)
                          PositionedDirectional(
                              top: 0,
                              end: 1,
                              child: Image(
                                image: AssetImage(
                                    "assets/images/discount-tag-${Get.locale!.languageCode}.png"),
                                width: 6.w,
                              )),
                        /*    if (rest.hasPromo)
                          PositionedDirectional(
                              top: 8,
                              start: 2,
                              child: Text(
                                S.of(Get.context!).discount,
                                style: TextStyle(fontSize: 6.sp),
                              )), */
                      ],
                    ),
                    InkWell(
                      // onTap: () => Get.to(() => Evaluation(rest: rest)),
                      enableFeedback: true,
                      excludeFromSemantics: true,
                      child: Container(
                        width: 23.w,
                        color: MyColors.primary.withOpacity(0.4),
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                        margin: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 4, top: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: MyColors.secondary,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    child: Text(
                                      rest.overAllRating!
                                          .toStringAsPrecision(2),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.sp,
                                          color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    rest.overAllRatingString!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp,
                                        color: MyColors.secondary),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '9999${rest.commRate!.toInt()} ${AppStrings.comment}',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 8.sp,
                                  color: MyColors.secondary),
                            ),
                            /* RichText(
                            text: TextSpan(
                              text:
                                  "${rest.commRate.toStringAsPrecision(1)} ${S.of(Get.context!).comment}",
                              style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ), */
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    // color: Colors.green,
                    margin: const EdgeInsetsDirectional.only(
                        start: 8, end: 1, top: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width,
                          height: 40,
                          child: Stack(
                            children: [
                              Container(
                                  padding:
                                      const EdgeInsetsDirectional.only(top: 4),
                                  width: 40.w,
                                  // color: Colors.red,
                                  child: RichText(
                                    text: TextSpan(
                                        text: /* rest.id.toString() +
                                            "-" + */
                                            // (Get.locale!.languageCode == 'ar'
                                            //     ? rest.arFullName
                                            //     : rest.arFullName),
                                            'hjghjgjhgjhg', // rest.id.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10.sp,
                                          fontFamily: 'almarai',
                                          color:
                                              Get.find<DynamicThemeController>()
                                                  .secondaryColor
                                                  .value,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "\n${rest.mainCat}",
                                            style: TextStyle(
                                                height: 2,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 8.sp,
                                                color: MyColors.secondary),
                                          ),
                                        ]),
                                  )),
                              /*   if (rest.hasPromo)
                                PositionedDirectional(
                                    top: 0,
                                    start: 32.w,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/discount-tag-${Get.locale!.languageCode}.png"),
                                      width: 5.5.w,
                                    )), */
                              if (rest.loyaltySubscription!)
                                PositionedDirectional(
                                    top: 1,
                                    end: 16.w,
                                    child: InkWell(
                                      onTap: () {
                                        Get.defaultDialog(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 16, horizontal: 16),
                                          radius: 2,
                                          // cancel:
                                          title: '',
                                          titleStyle:
                                              const TextStyle(fontSize: 1),
                                          titlePadding: EdgeInsets.zero,
                                          content: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'المطعم مشترك بنقاط الولاء'
                                                    ':',
                                                    style: TextStyle(
                                                        fontSize: 11.sp,
                                                        wordSpacing: 1.1,
                                                        height: 2,
                                                        color:
                                                            MyColors.secondary,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  InkWell(
                                                    onTap: () => Get.back(),
                                                    child: const Icon(
                                                      Icons.close,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                ('${'كل' ' ' ''} تشتري بها من المطعم، ستحصل على رصيد (<BR>). يمكنك استخدامه في الشراء من نفس المطعم باستخدام نقاط الولاء')
                                                // 'كل 500  تكسبها ستحصل على رصيد (<br>) لدى المطعم.'
                                                ,
                                                /*.replaceAll(
                                                        "<BR>",
                                                         Misc.numberFormatter(rest
                                                                    .loyaltyDetails!
                                                                    .cashPerPts *
                                                                500)
                                                            .toString()), */
                                                style: TextStyle(
                                                    fontSize: 8.sp,
                                                    wordSpacing: 1.1,
                                                    color: MyColors.secondary,
                                                    height: 2,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          middleTextStyle: TextStyle(
                                              fontSize: 8.sp,
                                              wordSpacing: 1.1,
                                              height: 2,
                                              fontWeight: FontWeight.bold),
                                        );
                                      },
                                      child: Card(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32)),
                                        borderOnForeground: false,
                                        margin: EdgeInsets.zero,
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(12)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade200
                                                    .withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            FontAwesomeIcons.trophy,
                                            size: 16,
                                            color: MyColors.primary,
                                          ),
                                        ),
                                      ),
                                    )),
                              PositionedDirectional(
                                end: 1,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    if (isOpen)
                                      Text(
                                        isOpen
                                            ? AppStrings.open
                                            : '', //'S.of(Get.context!).closed',
                                        style: TextStyle(
                                            color: isOpen
                                                ? const Color(0xff00aa00)
                                                : const Color(0xffaa0000),
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: MyColors.gold,
                                          size: 18,
                                        ),
                                        Obx(
                                          () {
                                            return currentLat.value == 2
                                                ? SpinKitRipple(
                                                    color: MyColors.primary,
                                                  )
                                                : Builder(builder: (context) {
                                                    /* var distance = Geolocator
                                                            .distanceBetween(
                                                                currentLat
                                                                    .value,
                                                                currentLon
                                                                    .value,
                                                                rest.location
                                                                    .locationLat,
                                                                rest.location
                                                                    .locationLong) /
                                                        1000;
                                                    rest.distance = distance; */
                                                    return Text(
                                                      (rest.distance)
                                                          .toString(),
                                                      // .toPrecision(2)
                                                      // .toStringAsFixed(2),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10,
                                                          color: MyColors
                                                              .secondary),
                                                    );
                                                  });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              /*  PositionedDirectional(
                                top: 24,
                                child: Text(
                                  rest.mainCat,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 8.sp,
                                      color: MyColors.secondary),
                                ),
                              ) */
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //local
                                    SizedBox(
                                      height: 32,
                                      // width: 74,
                                      // color: Colors.red,
                                      child: Row(
                                        // scrollDirection: Axis.horizontal,
                                        // padding: EdgeInsets.zero,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/images/dining.svg",
                                            color: rest.isLocally!
                                                ? MyColors.primary
                                                : Colors.grey.withOpacity(0.3),
                                            // semanticsLabel: 'saif',
                                            width: 20,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 9),
                                            child: Text(
                                              AppStrings.local,
                                              style: TextStyle(
                                                fontSize: 9.sp,
                                                color: rest.isLocally!
                                                    ? MyColors.secondary
                                                    : Colors.grey
                                                        .withOpacity(0.3),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    //takeaway

                                    Container(
                                      height: 32,
                                      // width: 140,
                                      // color: Colors.blue,
                                      padding: EdgeInsets.zero,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          // scrollDirection: Axis.horizontal,
                                          // padding: EdgeInsets.zero,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/local.svg",
                                              color: rest.isBookTable!
                                                  ? MyColors.primary
                                                  : Colors.grey
                                                      .withOpacity(0.3),
                                              // semanticsLabel: 'saif',
                                              width: 20,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Container(
                                              width: 14.w,
                                              // color: Colors.green,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              child: Text(
                                                AppStrings.reserve
                                                    .replaceAll(
                                                        '(بدون طلب)', '')
                                                    .trim(),
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                  fontSize: 9.sp,
                                                  color: rest.isBookTable!
                                                      ? MyColors.secondary
                                                      : Colors.grey
                                                          .withOpacity(0.3),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 32,
                                      // width: 200,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1),
                                      // color: Colors.red,
                                      child: Row(
                                        // scrollDirection: Axis.horizontal,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/images/packet.svg",
                                            color: rest.isTakeAway!
                                                ? MyColors.primary
                                                : Colors.grey.withOpacity(0.3),
                                            // semanticsLabel: 'saif',
                                            width: 14,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: Text(
                                              AppStrings.takeaway,
                                              style: TextStyle(
                                                fontSize: 9.sp,
                                                color: rest.isTakeAway!
                                                    ? MyColors.secondary
                                                    : Colors.grey
                                                        .withOpacity(0.3),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 13,
                                    ),
                                    //delivery
                                    SizedBox(
                                      height: 22,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 0),
                                            margin: const EdgeInsets.only(
                                                bottom: 4),
                                            child: SvgPicture.asset(
                                              "assets/images/delivery.svg",
                                              color: rest.isDelivery!
                                                  ? MyColors.primary
                                                  : Colors.grey
                                                      .withOpacity(0.3),
                                              // semanticsLabel: 'saif',
                                              width: 23,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 0),
                                            child: Text(
                                              AppStrings.delivery,
                                              style: TextStyle(
                                                fontSize: 9.sp,
                                                color: rest.isDelivery!
                                                    ? MyColors.secondary
                                                    : Colors.grey
                                                        .withOpacity(0.3),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                              if (rest.isDelivery!)
                                Expanded(
                                  child: Center(
                                    child: Obx(
                                      () => currentLat.value < 1
                                          ? SpinKitRipple(
                                              color: MyColors.primary,
                                            )
                                          : Builder(builder: (context) {
                                              return Container(
                                                width: 20,
                                                height: 20,
                                                color: MyColors.gold,
                                              );
                                              /* String s = getDeliveryPrice();

                                              int l = s.split('\n').length;

                                              return DeliveryStickerWidget(
                                                rest: rest,
                                                colorIndex: colorIndex,
                                                l: l,
                                                s: s,
                                                delivryTypeEnum:
                                                    delivryTypeEnum, 
                                              );*/
                                            }),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            /* if (rest.isDelivery)
              PositionedDirectional(
                top: 50,
                end: 1,
                // start: 8,
                child: Center(
                  child: Obx(
                    () => controller.currentLat.value < 1
                        ? SpinKitRipple(
                            color: MyColors.primary,
                          )
                        : Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/sticky_${[
                                      'note',
                                      'green',
                                      'pink',
                                      'purp'
                                    ][colorIndex]}.png',
                                  ),
                                  /* colorFilter: ColorFilter.mode(
                                      [
                                        Colors.transparent,
                                        Colors.deepPurpleAccent.withOpacity(0.08),
                                        Colors.blue.withOpacity(0.08),
                                        Colors.green.withOpacity(0.08)
                                      ][Random().nextInt(3)],
                                      BlendMode.overlay),*/
                                  fit: BoxFit.fill),
                              // border: Border.all(color: Colors.black26.withOpacity(0.1)),
                              // color: Colors.deepPurpleAccent.withOpacity(0.08),
                            ),
                            width: 64,
                            height: 80,
                            margin: const EdgeInsetsDirectional.only(
                                bottom: 0, start: 0),
                            padding: const EdgeInsetsDirectional .only(
                              start: 8,
                                bottom: 8),
                            child: Center(
                              child: Text(
                                getDeliveryPrice(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 8,
                                  height: 1.3,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ), */
            if (rest.isFav!)
              PositionedDirectional(
                bottom: 0,
                end: 1,
                child: InkWell(
                  onTap: (() {
                    /* FavController ctrl = Get.find();
                    ctrl.addToFav({
                      'restId': rest.id,
                      'clientId': Misc.user!.id!,
                      'fav': false
                    }, isMeal: false).then((value) {
                      ctrl.favRest
                          .removeWhere((element) => element.id == rest.id);
                      // Get.off(() => const Favorites());
                    });*/
                  }),
                  child: Container(
                    color: Colors.white,
                    child: const Icon(
                      Icons.delete_outlined,
                      color: Colors.red,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  /* String getDeliveryPrice() {
    String s = '';
    String freeDlvFrom = '';
    double distance = rest.distance;

    if (rest.deliveryDet!.isFree) {
      s = S.of(Get.context!).free_dlv;
      delivryTypeEnum = DelivryTypeEnum.free;
    }
    //App delivery
    else if (!rest.deliveryDet!.restDlv && rest.deliveryDet!.appDlv) {
      s = '';

      if (rest.deliveryDet!.noDeduct) {
        s = S.of(Get.context!).delivery +
            ('\n${Misc.numberFormatter(Misc.appDelPrice)}');
      } else {
        if (rest.deliveryDet!.deductibleAmount > 0 &&
            Misc.appDelPrice - rest.deliveryDet!.deductibleAmount > 0) {
          s = '${'${S.of(Get.context!).delivery} ' + S.of(Get.context!).start_from}\n${Misc.numberFormatter((Misc.appDelPrice - rest.deliveryDet!.deductibleAmount).abs())}';
        } else {
          s = '${'${S.of(Get.context!).delivery} ' + S.of(Get.context!).start_from}\n${Misc.numberFormatter((Misc.appDelPrice).abs())}';
        }

        if (rest.deliveryDet!.minInvAmountFullDeduct > 0) {
          s +=
              '${(s.isEmpty ? '\n' : '\n\n') + S.of(Get.context!).free_dlv_from}\n${Misc.numberFormatter(rest.deliveryDet!.minInvAmountFullDeduct - 1)}';
        }
      }
      delivryTypeEnum = DelivryTypeEnum.app_dlv;

      return s;
    } else if (rest.deliveryDet!.restDlv) {
      double cost = /* distance < 5
          ? */
          rest.deliveryDet!.inDistCost < rest.deliveryDet!.outDistCost
              ? rest.deliveryDet!.inDistCost
              : rest.deliveryDet!.outDistCost;

      if (/* (rest.deliveryDet!.inDistCost == 0 &&
              rest.deliveryDet!.outDistCost == 0) ||
          (rest.deliveryDet!.minInDistInvAmount == 0 &&
              rest.deliveryDet!.minOutDistInvAmount == 0) || */
          rest.deliveryDet!.isFree) {
        s = S.of(Get.context!).free_dlv;
        delivryTypeEnum = DelivryTypeEnum.free;

        return s;
      }

      s = S.of(Get.context!).delivery;
      s = '${'$s ' + S.of(Get.context!).start_from.replaceAll(S.of(Get.context!).from, '')}\n${S.of(Get.context!).from} ${Misc.numberFormatter(cost)}';

      if (rest.deliveryDet!.isNotFreeOrder == false) {
        if (distance < 5 && rest.deliveryDet!.minInDistInvAmount > 0) {
          freeDlvFrom =
              '${S.of(Get.context!).free_dlv_from}\n${S.of(Get.context!).from}  ${(rest.deliveryDet!.minInDistInvAmount - 1).toStringAsFixed(0)}';
          delivryTypeEnum = DelivryTypeEnum.with_cond;

          return "${s + "\n\n" + S.of(Get.context!).free_dlv_according} " +
              S
                  .of(Get.context!)
                  .dlv_terms; /* +
            "\n\n${freeDlvFrom.replaceAll(S.of(Get.context!).from + ':', '\n'
            + S.of(Get.context!).from + ':')} ${Misc.country!.currency}"
                .replaceAll('"', '.'); */
        } else {
          if (rest.minOutDistInvAmount > 0) {
            freeDlvFrom =
                '${S.of(Get.context!).free_dlv_from}${S.of(Get.context!).from}  ${(rest.minOutDistInvAmount - 1).toStringAsFixed(0)}';
          }
          delivryTypeEnum = DelivryTypeEnum.with_cond;

          return "${s + "\n\n" + S.of(Get.context!).free_dlv_according} " +
              S.of(Get.context!).dlv_terms;

          /*  +
            (freeDlvFrom.isEmpty
                ? ''
                : "\n\n${freeDlvFrom.replaceAll('من:', '\n' 'من:')} ${Misc.country!.currency}"
                    .replaceAll('"', '.')) */
        }
      } else {
        delivryTypeEnum = DelivryTypeEnum.without_cond;
      }
    }
    {
      if (s.isEmpty) {
        s = S.of(Get.context!).free_dlv;
        delivryTypeEnum = DelivryTypeEnum.free;
      }
      return s;
    }
  }
 */
}

class DeliveryStickerWidget extends StatelessWidget {
  const DeliveryStickerWidget({
    Key? key,
    required this.colorIndex,
    required this.l,
    required this.s,
    required this.rest,
    required this.delivryTypeEnum,
  }) : super(key: key);

  final int colorIndex;
  final int l;
  final String s;
  final Facility rest;
  final DelivryTypeEnum delivryTypeEnum;

  @override
  Widget build(BuildContext context) {
    double height = 6.h;
    double padHor = 1.w;

    switch (delivryTypeEnum) {
      case DelivryTypeEnum.with_cond:
        height = 8.h;
        padHor = 1.w;
        break;
      case DelivryTypeEnum.without_cond:
        height = 4.h;
        padHor = 1.w;
        break;
      case DelivryTypeEnum.free:
        height = 5.h;
        padHor = 4.w;
        break;
      case DelivryTypeEnum.app_dlv:
        height = 4.h;
        padHor = 4.w;
        break;
      default:
    }
    return InkWell(
      onTap: (() {
        if (s.contains('\n\n') &&
            // !rest.deliveryDet!.appDlv &&
            rest.restDlv!) {
          String desc = "${AppStrings.indist_cond}\n${AppStrings.outdist_cond}";

          /* desc = desc.replaceAll('<br>', '4 ' + S.of(context).km);
          desc = desc.replaceAll('<br1>',
              Misc.numberFormatter((rest.minInDistInvAmount - 1).abs()));
          desc = desc.replaceAll(
              '<br2>',
              Misc.numberFormatter(
                  (rest.deliveryDet!.minOutDistInvAmount - 1).abs())); */
          Get.defaultDialog(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            radius: 2,
            // cancel:
            title: '',
            titleStyle: const TextStyle(fontSize: 1),
            titlePadding: EdgeInsets.zero,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.free_dlv_if,
                      style: TextStyle(
                          fontSize: 9.sp,
                          wordSpacing: 1.1,
                          height: 2,
                          color: MyColors.secondary,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Text(
                  desc,
                  style: TextStyle(
                      fontSize: 8.sp,
                      wordSpacing: 1.1,
                      color: MyColors.secondary,
                      height: 2,
                      fontWeight: FontWeight.bold),
                ),
                /* 
                Center(
                  child: SizedBox(
                    width: 15.w,
                    child: MaterialButton(
                      color: MyColors.primary,
                      onPressed: () => Get.back(),
                      splashColor: Colors.blueGrey,
                      child: Text(
                        S.of(context).close,
                        style: TextStyle(
                          color: MyColors.secondary,
                          fontSize: 8.sp,
                        ),
                      ),
                    ),
                  ),
                ),
               */
              ],
            ),
            middleTextStyle: TextStyle(
                fontSize: 8.sp,
                wordSpacing: 1.1,
                height: 2,
                fontWeight: FontWeight.bold),
          );
        }
      }),
      child: Container(
        decoration: const BoxDecoration(
            // color: Colors.red,
            ),
        width: 16.w,
        // height: l > 3 ? 10.h : 6.h,
        height: height,
        padding: EdgeInsetsDirectional.only(
            top: 0,
            start: Get.locale!.languageCode == 'ar' ? 8 : 0,
            end: Get.locale!.languageCode == 'ar' ? 0 : 8,
            bottom: 0),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 1,
              right: 1,
              child: Image(
                  width: 16.w,
                  height: height,
                  image: AssetImage(
                    // 'assets/images/sticky_pink.png'
                    'assets/images/sticky_${[
                      'note',
                      'green',
                      'blue',
                      'purple'
                    ][colorIndex]}.png',
                  ),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fill),
            ),
            if (s.contains('\n\n'))
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: (s.contains('\n\n') && rest.appDlv! && !rest.restDlv!)
                    ? Center(
                        child: Text(
                          s.split("\n\n")[0].replaceAll(':', '').trim(),
                          style: TextStyle(
                              fontFamily: 'almarai',
                              fontSize: 6.0.sp,
                              height: 1.2,
                              color: Colors.black87),
                        ),
                      )
                    : RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: s.split("\n\n")[0].replaceAll(':', ''),
                            style: TextStyle(
                                fontFamily: 'almarai',
                                fontSize: 6.0.sp,
                                height: 1.2,
                                color: Colors.black87),
                            children: [
                              TextSpan(
                                  text:
                                      (s.contains(AppStrings.free_dlv_according)
                                          ? ('\n\n${s.split('\n\n')[1]}')
                                          : ''),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold
                                      // color: Color.fromARGB(255, 18, 46, 230),
                                      // decoration: TextDecoration.underline
                                      )),
                            ])),
              )
            else
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: padHor),
                child: Text(
                  s.split("\n\n")[0].replaceAll(':', ''),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'almarai',
                      fontSize: 6.sp,
                      height: 1.2,
                      color: Colors.black87),
                ),
              ),
            /*  if (s.contains('\n\n'))
              PositionedDirectional(
                  end: -0.7.w,
                  bottom: 0.6.h,
                  child: Icon(
                    Icons.chevron_right,
                    size: 5.w,
                  )) */
          ],
        ),
      ),
    );
  }
}
