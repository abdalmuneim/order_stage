import 'package:flutter/material.dart';
import 'package:orderstage/core/utils/app_extensions.dart';
import 'package:orderstage/widgets/custom_text.dart';

class ChoosesColor extends StatelessWidget {
  const ChoosesColor({
    Key? key,
    required this.title,
    this.color,
    this.onPressed,
    this.isColor = true,
    this.style,
  }) : super(key: key);

  final String title;
  final TextStyle? style;
  final void Function()? onPressed;
  final bool isColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // color
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: title,
              style: isColor ? null : style,
            ),
            20.sw,
            isColor
                ? Container(
                    width: 20,
                    height: 20,
                    color: color,
                  )
                : const SizedBox(),
          ],
        ),
        TextButton(
          onPressed: onPressed,
          child: const CustomText(
            text: "chooses color",
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
