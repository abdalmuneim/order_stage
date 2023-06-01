import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:orderstage/core/utils/app_extensions.dart';
import 'package:orderstage/feature/local_auth/data/enums/support_state_enum.dart';
import 'package:orderstage/feature/local_auth/prisentations/controllers/local_auth_controller.dart';
import 'package:orderstage/widgets/custom_text.dart';

class LocalAuthPage extends GetView<LocalAuthController> {
  const LocalAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: const Text('LocalAuthPage')),
        body: Center(
          child: Column(
            children: [
              10.sh,

              /// device id

              const CustomText(text: "Device ID"),
              5.sh,
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Device ID: ",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                    ),
                    TextSpan(
                      text: controller.deviceID.value,
                      style: const TextStyle(
                        color: MyColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              20.sh,
              const Divider(),

              /// Biometric
              const CustomText(text: "Biometric"),
              5.sh,
              // support Biometrics State
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(
                      text: "support Biometrics State: ",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                    ),
                    TextSpan(
                      text: controller.supportState.value.name,
                      style: const TextStyle(
                        color: MyColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              20.sh,

              // can Check Biometrics
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: [
                    TextSpan(
                      text: "can Check Biometrics: ",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                    ),
                    TextSpan(
                      text: controller.canCheckBiometrics.value.toString(),
                      style: const TextStyle(
                        color: MyColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              20.sh,

              /// authenticateWithCustomDialogMessages
              controller.supportState.value == SupportState.supported
                  ? controller.canCheckBiometrics.value
                      ? ElevatedButton(
                          onPressed: controller.authenticate,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(MyColors.primary),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                            ),
                          ),
                          child: const CustomText(
                            text: 'Authenticate',
                            color: MyColors.secondary,
                          ),
                        )
                      : TextButton(
                          onPressed: () => AppSettings.openSecuritySettings(),
                          child: const Text(
                            "Open Setting to active Biometric",
                          ),
                        )
                  : const SizedBox(),
              20.sh,
            ],
          ),
        ),
      ),
    );
  }
}
