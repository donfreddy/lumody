import 'package:logger/logger.dart';

class AppLogger {
  static const String _tag = 'AppLogger';

  static void log(dynamic message, {bool isError = false}) {
    final loggerNoStack = Logger(
      printer: PrettyPrinter(methodCount: 0),
    );

    isError ? loggerNoStack.e(message) : loggerNoStack.d(message);
    //debugPrint('${tag ?? _tag}: $message');
  }
}
