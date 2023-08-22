import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

BuildContext? getCurrentContext() => navigatorKey.currentContext;

Future navigateTo(
  BuildContext context, {
  required Widget destination,
}) {
  return Navigator.of(context).push(
    CupertinoPageRoute(builder: (_) => destination),
  );
}

Future navigateReplace(
  BuildContext context, {
  required Widget destination,
}) {
  return Navigator.of(context).pushReplacement(
    CupertinoPageRoute(builder: (_) => destination),
  );
}

Future navigateRemoveUntil(
  BuildContext context, {
  required Widget destination,
}) {
  return Navigator.of(context).pushAndRemoveUntil(
    CupertinoPageRoute(builder: (_) => destination),
    (route) => false,
  );
}

void navigateBack(BuildContext context) {
  return Navigator.pop(context);
}

void navigateBackResult(
  BuildContext context, {
  required result,
}) {
  return Navigator.of(context).pop(result);
}

dismiss(context) => Navigator.of(context).pop();

void dismissAllDialogs() {
  navigatorKey.currentState?.popUntil((route) => route.isFirst);
}
