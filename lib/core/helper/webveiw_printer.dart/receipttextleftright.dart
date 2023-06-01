import 'package:orderstage/core/helper/webveiw_printer.dart/enums.dart';
import 'package:orderstage/core/helper/webveiw_printer.dart/receipttextstyle.dart';

class ReceiptTextLeftRight {
  ReceiptTextLeftRight(
    this.leftText,
    this.rightText, {
    this.leftTextStyle = const ReceiptTextStyle(
      type: ReceiptTextStyleType.normal,
      useSpan: true,
    ),
    this.rightTextStyle = const ReceiptTextStyle(
      type: ReceiptTextStyleType.normal,
      useSpan: true,
    ),
  });

  final String leftText;
  final String rightText;
  final ReceiptTextStyle leftTextStyle;
  final ReceiptTextStyle rightTextStyle;

  String get html => '''
    <p class="full-width inline-block">
      <${leftTextStyle.textStyleHTML} class="left ${leftTextStyle.textSizeHtml}">$leftText</${leftTextStyle.textStyleHTML}>
      <${rightTextStyle.textStyleHTML} class="right ${rightTextStyle.textSizeHtml}">$rightText</${rightTextStyle.textStyleHTML}>
    </p>
  ''';
}
