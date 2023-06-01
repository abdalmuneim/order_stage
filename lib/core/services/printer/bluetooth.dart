import 'package:blue_print_pos/blue_print_pos.dart';
import 'package:blue_print_pos/models/connection_status.dart';
import 'package:blue_print_pos/receipt/receipt.dart';
import 'package:esc_pos_utils_plus/src/enums.dart';
import 'package:orderstage/core/utils/toast_manager.dart';
import 'package:orderstage/feature/printer/data/models/blutooth_model.dart';

PaperSize paperSizeI = PaperSize.mm58;
void printArabicTextToBluetoothPrinter(DeviceModel device,
    {List<String> data = const [],
    PaperSize paperSize = PaperSize.mm58}) async {
  paperSizeI = paperSize;
  final BluePrintPos bluePrintPos = BluePrintPos.instance;

  bluePrintPos.connect(device).then((ConnectionStatus status) async {
    if (status != ConnectionStatus.connected) {
      ToastManager.showError('${status.name} - something wrong');
    }
    ToastManager.showSuccess('تم الاتصال بنجاح جاري تحميل البيانات');
    try {
      final ReceiptSectionText receiptText = ReceiptSectionText();
      receiptText.addText(
        'فاتورة ضريبية مبسطة',
        alignment: ReceiptAlignment.center,
        size: ReceiptTextSizeType.large,
        style: ReceiptTextStyleType.bold,
      );
      List.generate(
          data.length,
          (index) => receiptText.addText(
                data[index],
                alignment: ReceiptAlignment.center,
                size: ReceiptTextSizeType.large,
                style: ReceiptTextStyleType.bold,
              ));
      receiptText.addSpacer(count: 2);

      /// print data
      await bluePrintPos.printReceiptText(
        receiptText,
        height: _getPaperHeight(data.length),
        paperSize: paperSize,
        useCut: false,
        useRaster: false,
        feedCount: 0,
      );
    } catch (e) {
      ToastManager.showError(e.toString());
      print('An error occurred while printing: $e');
    }
  });
}

/// paper height
double _getPaperHeight(int l) {
  int logoAndQrHeightForMM58 = 90;
  int logoAndQrHeightForMM72 = 120;
  int logoAndQrHeightForMM80 = 140;
  int headerAndFooterRowCount = 20;
  int rowHeight = 50;
  double height;

  double basicCalc =
      (headerAndFooterRowCount * rowHeight + l * rowHeight).toDouble();

  if (paperSizeI == PaperSize.mm80) {
    height = (logoAndQrHeightForMM80 + basicCalc);
  } else if (paperSizeI == PaperSize.mm58) {
    height = (logoAndQrHeightForMM58 + basicCalc);
  } else {
    height = (logoAndQrHeightForMM72 + basicCalc);
  }

  return height;
}

/// get time
String _getTime() {
  final dbTimeKey = DateTime.now()
      .toString()
      .replaceRange(19, 26, '')
      .replaceAll(' ', '     ');
  return dbTimeKey;
}

/// image size on paper
int get _imageSize => paperSizeI == PaperSize.mm58
    ? 120
    : paperSizeI == PaperSize.mm72
        ? 120
        : 170;
