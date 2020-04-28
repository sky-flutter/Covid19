import 'package:covid19/utils/imports.dart';

navigatorPush(context, widget, {isReplaced: false}) {
  if (isReplaced) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));
  } else {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => widget));
  }
}
