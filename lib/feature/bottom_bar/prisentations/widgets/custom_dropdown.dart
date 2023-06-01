import 'package:flutter/material.dart';
import 'package:orderstage/widgets/custom_text.dart';

class MyDropdownButton<T> extends StatelessWidget {
  const MyDropdownButton({
    super.key,
    required this.items,
    this.value,
    this.hint,
    this.onChanged,
  });
  final List<T> items;
  final T? value;
  final String? hint;
  final void Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: DropdownButton<T>(
        dropdownColor: Colors.white,
        icon: Icon(
          Icons.filter_list_alt,
          color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
        ),
        underline: Container(),
        value: value,
        items: items
            .map<DropdownMenuItem<T>>((T e) => DropdownMenuItem<T>(
                  value: e,
                  child: CustomText(
                    text: e.toString(),
                    color:
                        Theme.of(context).appBarTheme.actionsIconTheme?.color,
                  ),
                ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
