import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/resources/app_strings.dart';
import 'package:orderstage/core/utils/app_extensions.dart';
import 'package:orderstage/feature/theme/presintations/controller/theme_controller.dart';
import 'package:orderstage/feature/theme/presintations/view/widgets/choooses_color.dart';
import 'package:orderstage/widgets/custom_text.dart';
import 'package:sizer/sizer.dart' as sz;

class ThemeView extends StatelessWidget {
  const ThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (ThemeController controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                50.sh,
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Center(
                    child: SizedBox(
                      height: 90.h,
                      width: 100.w,
                      child: Scaffold(
                        backgroundColor: controller.backgroundColor,
                        drawer: const Drawer(),
                        body: Column(
                          children: [
                            /// app bar
                            InkWell(
                              // onTap: () => controller.selectPrimaryColor(),
                              child: Container(
                                alignment: Alignment.center,
                                width: 100.w,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: controller.primaryColor),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    /// drawer
                                    IconButton(
                                      onPressed: () {
                                        controller.globalKey.currentState!
                                            .openDrawer();
                                      },
                                      color: controller.secondaryColor,
                                      icon: const Icon(
                                        Icons.menu,
                                      ),
                                    ),

                                    /// title and back
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        /*  InkWell(
                                          onTap: () =>
                                              controller.selectPrimaryColor(),
                                          child: Text(
                                            'Change Head color',
                                            style: TextStyle(
                                                color:
                                                    controller.secondaryColor,
                                                fontSize: 15),
                                          ),
                                        ),
                                        10.sh, */
                                        InkWell(
                                          // onTap: () =>
                                          // controller.selectHeadTitleColor(),
                                          child: Text(
                                            'Head title',
                                            style: TextStyle(
                                                color:
                                                    controller.secondaryColor,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),

                                    /// actions
                                    IconButton(
                                        onPressed: () {},
                                        // controller.selectActionColor(),
                                        icon: Icon(
                                          Icons.preview,
                                          color: controller.secondaryColor,
                                        )),
                                  ],
                                ),
                              ),
                            ),

                            /// body
                            Expanded(
                              child: Scaffold(
                                backgroundColor: controller.backgroundColor,
                                key: controller.globalKey,
                                drawer: Drawer(
                                  backgroundColor:
                                      controller.drawerBackgroundColor,
                                  child: Center(
                                    child: InkWell(
                                      onTap: () => controller
                                          .selectDrawerBackgroundColor(),
                                      child: const Text(
                                        'Change drawer color',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                body: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8),
                                    child: Column(
                                      children: <Widget>[
                                        /// components
                                        Column(
                                          children: [
                                            ChoosesColor(
                                                color: controller.primaryColor,
                                                title: 'Main color',
                                                onPressed: () {
                                                  controller
                                                      .selectPrimaryColor();
                                                }),

                                            20.sh,

                                            // secondary
                                            ChoosesColor(
                                                color:
                                                    controller.secondaryColor,
                                                title: 'Secondary color',
                                                onPressed: () {
                                                  controller
                                                      .selectSecondaryColor();
                                                }),

                                            20.sh,

                                            /// scaffold
                                            ChoosesColor(
                                                color:
                                                    controller.backgroundColor,
                                                title: 'background color',
                                                onPressed: () {
                                                  controller
                                                      .selectBackgroundColor();
                                                }),

                                            20.sh,

                                            /// font family
                                            /*   Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('font family',
                                                    style: controller
                                                        .fontFamily.value),
                                                TextButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          content:
                                                              SingleChildScrollView(
                                                            child: SizedBox(
                                                              width: double
                                                                  .maxFinite,
                                                              child: FontPicker(
                                                                showInDialog:
                                                                    true,
                                                                initialFontFamily:
                                                                    'Cairo',
                                                                showFontInfo:
                                                                    false,
                                                                showFontVariants:
                                                                    false,
                                                                onFontChanged:
                                                                    controller
                                                                        .selectFontFamily,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Text(
                                                      'Chooses font family',
                                                      style: controller
                                                          .fontFamily.value),
                                                ),
                                              ],
                                            ),
 */
                                            // 20.sh,

                                            /// bottom bar
                                            ChoosesColor(
                                              title: 'bottom bar color',
                                              onPressed: () {
                                                controller
                                                    .selectBottomBarColor();
                                              },
                                              color: controller.bottomBarColor,
                                            ),
                                            20.sh,

                                            /// button

                                            /*   Container(
                                                height: 6.h,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                decoration: BoxDecoration(
                                                  color: controller.buttonColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    5,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () => controller
                                                          .selectButtonTextColor(),
                                                      child: Text(
                                                        'Change Text Color',
                                                        style: TextStyle(
                                                            color: controller
                                                                .buttonTextColor),
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    InkWell(
                                                      onTap: () => controller
                                                          .selectButtonColor(),
                                                      child: Text(
                                                        'Change button Color',
                                                        style: TextStyle(
                                                            color: controller
                                                                .buttonTextColor),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                            20.sh, */
                                          ],
                                        ),

                                        ///
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        floatingActionButton: FloatingActionButton(
                          onPressed: () {},
                          /* {
                            Get.dialog(Center(
                              child: Container(
                                width: 90.w,
                                height: 30.h,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ChoosesColor(
                                        title: 'Background color',
                                        onPressed: () {} // controller
                                        // .selectFloatingButtonColor(),
                                        // color: controller.floatingButtonColor,
                                        ),
                                    ChoosesColor(
                                        title: 'font color',
                                        onPressed: () {} // controller
                                        // .selectFloatingButtonTextColor(),
                                        // color: controller.floatingButtonTextColor,
                                        ),
                                    20.sh,
                                    Row(
                                      children: [
                                        const Spacer(),
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        20.sw,
                                        ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text('Ok')),
                                        const Spacer()
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ));
                          }, */
                          backgroundColor: controller
                              .primaryColor, //controller.floatingButtonColor,
                          child: Text(
                            'floating',
                            style: TextStyle(
                              color: controller
                                  .secondaryColor, //controller.floatingButtonTextColor,
                            ),
                          ),
                        ),
                        bottomNavigationBar: BottomNavigationBar(
                          backgroundColor: controller.bottomBarColor,
                          type: BottomNavigationBarType.fixed,
                          showUnselectedLabels: true,
                          showSelectedLabels: true,
                          unselectedItemColor: controller.unselectedItemColor,
                          selectedItemColor: controller.selectedItemColor,
                          onTap: controller.onItemTapped,
                          items: [
                            BottomNavigationBarItem(
                              icon: const Icon(Icons.home_work_outlined),
                              label: AppStrings.main,
                            ),
                            BottomNavigationBarItem(
                              icon: const Icon(Icons.restaurant),
                              label: AppStrings.myOrder,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                10.sh,

                /// save theme
                ElevatedButton(
                  onPressed: () => controller.saveTheme(),
                  child: const CustomText(
                    text: 'Save',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
