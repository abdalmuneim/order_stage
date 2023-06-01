import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/core/utils/app_extensions.dart';
import 'package:orderstage/feature/cashback/data/models/cashback_model.dart';
import 'package:orderstage/feature/cashback/prisentations/controllers/current_cashback_controller.dart';
import 'package:orderstage/injection.dart';
import 'package:orderstage/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class CurrentCashbackPage extends StatelessWidget {
  const CurrentCashbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentCashbackController(sl()),
      builder: (controller) {
        return Scaffold(
          backgroundColor: MyColors.secondary,
          appBar: AppBar(title: const Text('إداره العروض والتخفيضات')),
          body: Stack(
            children: [
              /// text current cashback
              Container(
                  color: MyColors.primary,
                  height: 30.h,
                  width: 100.w,
                  padding: EdgeInsets.only(top: 5.h, right: 10),
                  child: const CustomText(
                    text: "العروض الحالية",
                    color: MyColors.secondary,
                  )),

              /// list of cashback
              controller.currentCashback.isEmpty
                  ? const CircularProgressIndicator()
                  : Container(
                      width: 100.w,
                      margin: EdgeInsets.only(top: 10.h, left: 10, right: 10),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Obx(
                        () => SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...controller.currentCashback
                                  .map((CashbackData element) => SizedBox(
                                        width: 100.w,
                                        child: Card(
                                          elevation: 1.0,
                                          child: Column(
                                            children: [
                                              ///data
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    /// coupon
                                                    RichText(
                                                      text: TextSpan(
                                                        style:
                                                            GoogleFonts.almarai(
                                                          color: MyColors
                                                              .secondary,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        children: [
                                                          const TextSpan(
                                                            text:
                                                                "كود التخفيض:\t\t",
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                element.coupon,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    20.sh,

                                                    /// percentage
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        RichText(
                                                          text: TextSpan(
                                                            style: GoogleFonts
                                                                .almarai(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        9.sp),
                                                            children: [
                                                              const TextSpan(
                                                                text:
                                                                    "نسبة التخفيض:\t\t",
                                                              ),
                                                              TextSpan(
                                                                text: element
                                                                    .percentage
                                                                    .toString(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const Spacer(),

                                                        /// cashback title
                                                        Flexible(
                                                          child: Container(
                                                            color: MyColors
                                                                .primary,
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 20,
                                                              vertical: 20,
                                                            ),
                                                            child: RichText(
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              text: TextSpan(
                                                                style:
                                                                    GoogleFonts
                                                                        .almarai(
                                                                  color: MyColors
                                                                      .secondary,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      9.sp,
                                                                ),
                                                                children: [
                                                                  const TextSpan(
                                                                    text:
                                                                        "عنوان العرض:\t\t",
                                                                  ),
                                                                  TextSpan(
                                                                    text: element
                                                                        .description,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    20.sh,

                                                    /// start time
                                                    RichText(
                                                      text: TextSpan(
                                                        style:
                                                            GoogleFonts.almarai(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 9.sp),
                                                        children: [
                                                          const TextSpan(
                                                            text:
                                                                "بداية العرض:\t\t",
                                                          ),
                                                          TextSpan(
                                                            text: element
                                                                .startDate,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    10.sh,

                                                    /// end time
                                                    RichText(
                                                      text: TextSpan(
                                                        style:
                                                            GoogleFonts.almarai(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 9.sp),
                                                        children: [
                                                          const TextSpan(
                                                            text:
                                                                "نهاية العرض:\t\t",
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                element.endDate,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    10.sh,
                                                  ],
                                                ),
                                              ),

                                              /// buttons edit, delete and close
                                              Container(
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    /// edit
                                                    InkWell(
                                                      onTap: () => controller
                                                          .goToEdit(element),
                                                      child: Column(
                                                        children: [
                                                          const Icon(
                                                            Icons.edit,
                                                            color:
                                                                MyColors.gold,
                                                          ),
                                                          CustomText(
                                                            color:
                                                                MyColors.gold,
                                                            text: "تعديل",
                                                            fontSize: 9.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )
                                                        ],
                                                      ),
                                                    ),

                                                    /// delete
                                                    InkWell(
                                                      onTap: () => controller
                                                          .deleteCoupon(
                                                              element.id!),
                                                      child: Column(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .delete_outline,
                                                            color: Colors.red,
                                                          ),
                                                          CustomText(
                                                            text: "حزف",
                                                            fontSize: 9.sp,
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )
                                                        ],
                                                      ),
                                                    ),

                                                    /// enable
                                                    InkWell(
                                                      onTap: () => controller
                                                          .onChangeEnableCashback(
                                                              element),
                                                      child: Column(
                                                        children: [
                                                          Icon(
                                                            element.enabled!
                                                                ? Icons
                                                                    .lock_open
                                                                : Icons.lock,
                                                            color: element
                                                                    .enabled!
                                                                ? Colors.green
                                                                : Colors.grey,
                                                          ),
                                                          CustomText(
                                                            text: "تعطيل",
                                                            fontSize: 9.sp,
                                                            color: element
                                                                    .enabled!
                                                                ? MyColors
                                                                    .secondary
                                                                : Colors.grey,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Icon(
                                  Icons.add_circle,
                                ),
                              ),
                              const CustomText(
                                text: "إضافه تخفيض",
                              ),
                              10.sh,
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
