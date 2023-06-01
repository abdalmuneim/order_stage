import 'package:orderstage/core/helper/webveiw_printer.dart/collectionstyle.dart';
import 'package:orderstage/core/helper/webveiw_printer.dart/enums.dart';
import 'package:orderstage/core/helper/webveiw_printer.dart/receipttextstyle.dart';

class ReceiptText {
  ReceiptText(
    this.text, {
    this.textStyle = const ReceiptTextStyle(
      type: ReceiptTextStyleType.normal,
      size: ReceiptTextSizeType.medium,
    ),
    this.alignment = ReceiptAlignment.center,
  });

  final String text;
  final ReceiptTextStyle textStyle;
  final ReceiptAlignment alignment;

  String get html => '''
    <div class="$_alignmentStyleHTML ${textStyle.textSizeHtml}">
      <${textStyle.textStyleHTML}>$text</${textStyle.textStyleHTML}>
    </div>
    ''';

  String get _alignmentStyleHTML {
    if (alignment == ReceiptAlignment.left) {
      return CollectionStyle.textLeft;
    } else if (alignment == ReceiptAlignment.right) {
      return CollectionStyle.textRight;
    }
    return CollectionStyle.textCenter;
  }
}
