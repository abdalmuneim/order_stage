import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/core/utils/app_extensions.dart';
import 'package:orderstage/feature/add_new_meal/prisentations/controllers/add_new_meal_controller.dart';
import 'package:orderstage/widgets/custom_text.dart';

class AddNewMealView extends StatelessWidget {
  const AddNewMealView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewMealController>(
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  MyColors.primary,
                ),
                shape: MaterialStateProperty.all(
                  const CircleBorder(),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(10),
                ),
              ),
              child: const Icon(
                Icons.add,
                size: 40,
              ),
              onPressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: true, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'إضافة وجبة جديدة',
                        textAlign: TextAlign.center,
                      ),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            const Text(
                              textAlign: TextAlign.center,
                              'يمكن إضافة وجبة عن طريق نسخ البيانات من احدي الوجبات المتاحة وتحديثها لاحقا، او بإضافة وجبة جديدة',
                            ),
                            20.sh,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                /// button add new
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        MyColors.secondary),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: const BorderSide(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () => controller.addNew(),
                                  child: CustomText(
                                    text: "إضافة جديد",
                                    color: MyColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                /// button copy from last meal
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        MyColors.primary),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: const BorderSide(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () => controller.copyData(),
                                  child: const CustomText(
                                    text: "نسخ البيانات",
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      actionsAlignment: MainAxisAlignment.center,
                      actions: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                                side: const BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () => Get.back(),
                          child: const CustomText(
                            text: "إلغاء",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
