import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:orderstage/core/helper/webveiw_printer.dart/capability.dart';
import 'package:orderstage/core/helper/webveiw_printer.dart/generator.dart';
import 'package:orderstage/core/helper/webveiw_printer.dart/papersize.dart';
import 'package:orderstage/core/helper/webveiw_printer.dart/printer_webview.dart';
import 'package:qr_flutter/qr_flutter.dart';

class NetPrintPos {
  /// This method only for print text
  /// value and styling inside model [ReceiptSectionText].
  /// [feedCount] to create more space after printing process done
  /// [useCut] to cut printing process
  Future<void> printReceiptText(
    NetworkPrinter printer,
    ReceiptSectionText receiptSectionText, {
    int feedCount = 0,
    bool useCut = false,
    bool useRaster = false,
    double duration = 0,
    PaperSize paperSize = PaperSize.mm58,
    double? height,
  }) async {
    final Uint8List bytes = await contentToImage(
      content: receiptSectionText.content,
      duration: duration,
    );
    final List<int> byteBuffer = await _getBytes(
      bytes,
      paperSize: paperSize,
      feedCount: feedCount,
      useCut: useCut,
      useRaster: useRaster,
    );
    printer.rawBytes(byteBuffer);
  }

  /// This method only for print image with parameter [bytes] in List<int>
  /// define [width] to custom width of image, default value is 120
  /// [feedCount] to create more space after printing process done
  /// [useCut] to cut printing process
  Future<void> printReceiptImage(
    NetworkPrinter printer,
    List<int> bytes, {
    int width = 120,
    int feedCount = 0,
    bool useCut = false,
    bool useRaster = false,
    PaperSize paperSize = PaperSize.mm58,
  }) async {
    final List<int> byteBuffer = await _getBytes(
      bytes,
      customWidth: width,
      feedCount: feedCount,
      useCut: useCut,
      useRaster: useRaster,
      paperSize: paperSize,
    );
    printer.rawBytes(byteBuffer);
  }

  /// This method only for print QR, only pass value on parameter [data]
  /// define [size] to size of QR, default value is 120
  /// [feedCount] to create more space after printing process done
  /// [useCut] to cut printing process
  Future<void> printQR(
    NetworkPrinter printer,
    String data, {
    int size = 120,
    int feedCount = 0,
    bool useCut = false,
  }) async {
    final List<int> byteBuffer = await _getQRImage(data, size.toDouble());
    printReceiptImage(
      printer,
      byteBuffer,
      width: size,
      feedCount: feedCount,
      useCut: useCut,
    );
    printer.rawBytes(byteBuffer);
  }

  /// This method to convert byte from [data] into as image canvas.
  /// It will automatically set width and height based [paperSize].
  /// [customWidth] to print image with specific width
  /// [feedCount] to generate byte buffer as feed in receipt.
  /// [useCut] to cut of receipt layout as byte buffer.
  Future<List<int>> _getBytes(
    List<int> data, {
    PaperSize paperSize = PaperSize.mm58,
    int customWidth = 0,
    int feedCount = 0,
    bool useCut = false,
    bool useRaster = false,
  }) async {
    List<int> bytes = <int>[];
    final CapabilityProfile profile = await CapabilityProfile.load();
    final Generator generator = Generator(paperSize, profile);
    final img.Image resize = img.copyResize(
      img.decodeImage(data)!,
      width: customWidth > 0 ? customWidth : paperSize.width,
    );
    if (useRaster) {
      bytes += generator.imageRaster(resize);
    } else {
      bytes += generator.image(resize);
    }
    if (feedCount > 0) {
      bytes += generator.feed(feedCount);
    }
    if (useCut) {
      bytes += generator.cut();
    }
    return bytes;
  }

  /// Handler to generate QR image from [text] and set the [size].
  /// Using painter and convert to [Image] object and return as [Uint8List]
  Future<Uint8List> _getQRImage(String text, double size) async {
    try {
      final Image image = await QrPainter(
        data: text,
        version: QrVersions.auto,
        gapless: false,
        color: const Color(0xFF000000),
        emptyColor: const Color(0xFFFFFFFF),
      ).toImage(size);
      final ByteData? byteData =
          await image.toByteData(format: ImageByteFormat.png);
      assert(byteData != null);
      return byteData!.buffer.asUint8List();
    } on Exception catch (exception) {
      print('$runtimeType - $exception');
      rethrow;
    }
  }

  static Future<Uint8List> contentToImage({
    required String content,
    double duration = 0,
  }) async {
    final Map<String, dynamic> arguments = <String, dynamic>{
      'content': content,
      'duration': Platform.isIOS ? 2000 : duration,
    };
    Uint8List results = Uint8List.fromList(<int>[]);
    try {
      results = await _channel.invokeMethod('contentToImage', arguments) ??
          Uint8List.fromList(<int>[]);
    } on Exception catch (e) {
      log('[method:contentToImage]: $e');
      throw Exception('Error: $e');
    }
    return results;
  }

  static const MethodChannel _channel = MethodChannel('blue_print_pos');
}
