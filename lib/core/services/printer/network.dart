import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart' as pa;
import 'package:orderstage/core/helper/webveiw_printer.dart/enums.dart';
import 'package:orderstage/core/helper/webveiw_printer.dart/papersize.dart';
import 'package:orderstage/core/helper/webveiw_printer.dart/printer_webview.dart';
import 'package:orderstage/core/helper/webveiw_printer.dart/printre.dart';
import 'package:orderstage/core/utils/toast_manager.dart';
import 'package:orderstage/feature/printer/data/models/blutooth_model.dart';

pa.PaperSize paperSizeI = pa.PaperSize.mm80;

void printArabicTextToWiFiPrinter(DeviceModel device,
    {required List<String> data,
    pa.PaperSize paperSize = pa.PaperSize.mm80}) async {
  final profile = await pa.CapabilityProfile.load();
  final NetworkPrinter printer = NetworkPrinter(paperSize, profile);
  paperSizeI = paperSize;

  // Replace with your printer's IP address and port
  String printerIp = device.address;
  const printerPort = 9100;

  final PosPrintResult res =
      await printer.connect(printerIp, port: printerPort);

  if (res != PosPrintResult.success) {
    print('Failed to connect to the printer. Error: ${res.msg}');
    ToastManager.showError(res.msg);
    return;
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
    await NetPrintPos().printReceiptText(
      printer,
      receiptText,
      paperSize: PaperSize.mm80,
      height: _getPaperHeight(data.length),
      useCut: false,
      useRaster: false,
      feedCount: 0,
    );
  } catch (e) {
    ToastManager.showError(e.toString());
    print('An error occurred while printing: $e');
  }

  printer.disconnect();
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
int get _imageSize => paperSizeI == pa.PaperSize.mm58 ? 120 : 170;
