import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:orderstage/core/resources/mycolors.dart';
import 'package:sizer/sizer.dart';

class CustomMultiSelectDialogField<T> extends StatelessWidget {
  const CustomMultiSelectDialogField(
      {Key? key,
      required this.items,
      required this.onConfirm,
      this.decoration,
      required this.title,
      this.multiKey,
      this.text,
      this.icon})
      : super(key: key);
  final List<MultiSelectItem<T>> items;
  final void Function(List<T>) onConfirm;
  final BoxDecoration? decoration;
  final Icon? icon;
  final String title;
  final String? text;
  final GlobalKey<FormFieldState<dynamic>>? multiKey;

  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField<T>(
      key: multiKey,

      /// container items selected
      chipDisplay: MultiSelectChipDisplay<T>(
        chipColor: MyColors.secondary,
        textStyle: TextStyle(
            color: MyColors.primary, fontFamily: 'almarai', fontSize: 9.sp),
      ),
      searchHint: "search",
      searchable: true,
      items: items,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 10.sp,
        ),
      ),

      /// check box Selected in  selected
      selectedColor: MyColors.gold,

      confirmText: Text(
        'تأكيد',
        style: TextStyle(fontFamily: 'almarai', color: MyColors.secondary),
      ),
      cancelText: Text('ألغاء',
          style: TextStyle(fontFamily: 'almarai', color: MyColors.grey)),

      /// text style in dialog before select
      itemsTextStyle: TextStyle(fontFamily: 'almarai', fontSize: 10.sp),

      /// check box
      // checkColor: MyColors.primary,

      /// text style in dialog after select
      selectedItemsTextStyle: TextStyle(
          fontFamily: 'almarai', color: MyColors.primary, fontSize: 10.sp),

      decoration: decoration ??
          BoxDecoration(
            // color: Colors.blue.withOpacity(0.1),
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
          ),
      buttonIcon: icon ??
          Icon(
            Icons.arrow_drop_down,
            color: MyColors.secondary,
          ),
      buttonText: Text(
        text ?? "اختر من القائمة",
        style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.normal),
        textAlign: TextAlign.center,
      ),
      onConfirm: onConfirm,
    );
  }
}
