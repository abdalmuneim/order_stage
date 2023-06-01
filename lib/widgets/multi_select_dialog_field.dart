import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:orderstage/core/resources/font_manager.dart';
import 'package:orderstage/core/resources/mycolors.dart';

class CustomMultiSelectDialogField<T> extends StatelessWidget {
  const CustomMultiSelectDialogField({
    Key? key,
    required this.items,
    required this.onConfirm,
    this.decoration,
    required this.title,
    this.multiKey,
    this.text,
    this.initSelected,
  }) : super(key: key);
  final List<MultiSelectItem<T>> items;
  final List<T>? initSelected;
  final void Function(List<T>) onConfirm;
  final BoxDecoration? decoration;
  final String? title;
  final String? text;
  final GlobalKey<FormFieldState<dynamic>>? multiKey;

  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField<T>(
      key: multiKey,
      initialValue: initSelected ?? [],

      /// container items selected
      chipDisplay: MultiSelectChipDisplay<T>(
        chipColor: MyColors.secondary,
        textStyle: const TextStyle(
            color: MyColors.primary, fontFamily: FontConstants.almarai),
      ),
      searchHint: 'بحث...',
      searchable: true,
      items: items,
      title: Text(title ?? ""),

      /// check box Selected in  selected
      selectedColor: MyColors.primary,

      confirmText: const Text(
        'تأكيد',
        style: TextStyle(
            fontFamily: FontConstants.almarai, color: MyColors.secondary),
      ),
      cancelText: const Text('ألغاء',
          style: TextStyle(
              fontFamily: FontConstants.almarai, color: MyColors.grey)),

      /// text style in dialog before select
      itemsTextStyle: const TextStyle(
        fontFamily: FontConstants.almarai,
      ),

      /// check box
      // checkColor: MyColors.primary,

      /// text style in dialog after select
      selectedItemsTextStyle: const TextStyle(
          fontFamily: FontConstants.almarai, color: MyColors.primary),

      decoration: decoration ??
          BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            border: Border.all(
              color: MyColors.primary,
              width: 2,
            ),
          ),
      buttonIcon: title == null
          ? const Icon(
              Icons.arrow_drop_down,
              color: MyColors.primary,
            )
          : null,
      buttonText: Text(
        text ?? "اختر من القائمة",
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeightManager.bold,
        ),
        textAlign: title != null ? TextAlign.center : null,
      ),
      onConfirm: onConfirm,
    );
  }
}
