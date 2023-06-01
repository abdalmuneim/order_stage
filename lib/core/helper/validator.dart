import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:orderstage/feature/add_app/prisentations/controllers/apps_controller.dart';

enum ValidationType {
  phone,
  appName,
  cardNumber,
  notEmpty,
  email,
  ipAddress,
  password,
  validationCode
}

class AppValidator {
  static FilteringTextInputFormatter priceValueOnly() {
    return FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'));
  }

  static String? validateFields(
    String? value,
    ValidationType fieldType,
    BuildContext context, {
    int? length,
  }) {
    if (value == null) {
      return 'هذا الحقل مطلوب';
    } else if (fieldType == ValidationType.ipAddress) {
      if (value.isEmpty || value.length != length) {
        return 'تاكد من الرقم';
      }
    } else if (fieldType == ValidationType.notEmpty) {
      if (value.trim().isEmpty || value.isEmpty) {
        return 'هذا الحقل مطلوب';
      }
    } else if (fieldType == ValidationType.appName) {
      if (value.trim().isEmpty || value.isEmpty) {
        if (Get.find<AppsController>().checkAppIsAlreadyExists(value).value) {
          return 'التطبيق موجد بالفعل';
        }
        return 'هذا الحقل مطلوب';
      }
    } else if (fieldType == ValidationType.email) {
      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
        // return LocaleKeys.sur_EmailError.tr();
      }
    } /* else if (fieldType == ValidationType.phone) {
      if (value.length != AppConstant.phoneLength) {
        return LocaleKeys.enter_valid_phone.tr();
      }
    } */
    else if (fieldType == ValidationType.cardNumber) {
      if (value.length != 15) {
        // return LocaleKeys.validCardNumber.tr();
      }
      return null;
    } else if (fieldType == ValidationType.validationCode) {
      if (value.isEmpty || value.length != 4) {
        // return LocaleKeys.enter_valid_verification_code.tr();
      }
    }
    return null;
  }
}
