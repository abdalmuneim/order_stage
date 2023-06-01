import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/feature/add_app/data/models/add_app_model.dart';
import 'package:orderstage/feature/add_app/prisentations/controllers/apps_controller.dart';
import 'package:orderstage/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class AppsView extends GetWidget<AppsController> {
  const AppsView({super.key});
  // final AddAppController controller = Get.find<AddAppController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      <AddAppController>() {
        return Scaffold(
          appBar: AppBar(title: const Text('التطبيقات')),
          body: Wrap(
            alignment: controller.appsList.isNotEmpty
                ? WrapAlignment.start
                : WrapAlignment.center,
            children: [
              /// list of apps
              ///
              if (controller.isLoading.value) ...[
                const CircularProgressIndicator(
                  color: MyColors.secondary,
                )
              ] else if (controller.appsList.isEmpty) ...[
                const Center(
                  child: CustomText(
                    text: "لا يوجد تطبيقات حتي الان اضف واحد",
                  ),
                )
              ] else ...[
                ...controller.appsList
                    .map(
                      (AppModel e) => InkWell(
                        onTap: () => controller.goToAddAppEdit(e),
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          width: 20.w,
                          height: 20.w,
                          color: MyColors.secondary.withOpacity(.2),
                          child: CustomText(
                            text: e.appName ?? "",
                            color: MyColors.secondary,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],

              /// add new app button
              InkWell(
                onTap: () => controller.goToAddApp(),
                child: Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: 20.w,
                  height: 20.w,
                  color: MyColors.secondary.withOpacity(.2),
                  child: const Icon(
                    Icons.add,
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
