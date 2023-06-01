import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/resources/app_strings.dart';
import 'package:orderstage/feature/bottom_bar/data/models/resturant_model.dart';
import 'package:orderstage/feature/bottom_bar/prisentations/controllers/main_bar_controller.dart';
import 'package:orderstage/feature/bottom_bar/prisentations/widgets/custom_dropdown.dart';
import 'package:orderstage/feature/bottom_bar/prisentations/widgets/facility_card.dart';

import 'package:orderstage/feature/theme/presintations/view/widgets/dynamic_theme.dart';

class MainBar extends GetView<MainBarController> {
  const MainBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((() {
      return DynamicTheme(
        child: Scaffold(
          drawer: const Drawer(),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppStrings.main,
            ),
            actions: [
              MyDropdownButton<String>(
                items: controller.items,
                onChanged: controller.selectFilter,
                value: controller.selectedFilter,
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextButton(
                onPressed: null,
                child: Text(AppStrings.chosesFromBranch),
              ),
              /* SizedBox(
                    height: 5.h,
                    width: 100.w,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 25.w,
                          height: 5.h,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: controller.selectedButton == index
                                ? MyColors.primary
                                : Colors.white,
                            borderRadius: controller.selectedButton == index
                                ? BorderRadius.circular(30)
                                : BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              controller.selectButton(index);
                            },
                            borderRadius: controller.selectedButton == index
                                ? BorderRadius.circular(30)
                                : BorderRadius.circular(10),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  if (index == 0) ...[
                                    CustomText(
                                      text: AppStrings.all,
                                      color: MyColors.secondary,
                                      fontSize: 16,
                                    ),
                                    const Icon(Icons.filter_alt),
                                  ],
                                  if (index == 1) ...[
                                    CustomText(
                                      text: AppStrings.orientalBreakfast,
                                      color: MyColors.secondary,
                                      fontSize: 16,
                                    ),
                                  ],
                                  if (index == 2) ...[
                                    CustomText(
                                      text: AppStrings.popularBreakfast,
                                      color: MyColors.secondary,
                                      fontSize: 16,
                                    ),
                                  ],
                                  if (index == 3) ...[
                                    CustomText(
                                      text: AppStrings.all,
                                      color: MyColors.secondary,
                                      fontSize: 16,
                                    ),
                                  ],
                                  if (index == 4) ...[
                                    CustomText(
                                      text: AppStrings.all,
                                      color: MyColors.secondary,
                                      fontSize: 16,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10), */
              Expanded(
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 8);
                  },
                  itemBuilder: (context, index) {
                    return FacilityCard(
                      rest: Facility(
                        id: index,
                        appDlv: true,
                        arFullName: '',
                        commRate: 2.3,
                        distance: 4.4,
                        enFullName: '',
                        hasPromo: false,
                        isBookTable: true,
                        isDelivery: true,
                        isFav: true,
                        isLocally: false,
                        isTakeAway: true,
                        loyaltySubscription: true,
                        mainCat: '',
                        minInDistInvAmount: 3,
                        minOutDistInvAmount: 4,
                        overAllRating: 5,
                        overAllRatingString: '',
                        restDlv: false,
                      ),
                      delivryTypeEnum: DelivryTypeEnum.app_dlv,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }));
  }
}
