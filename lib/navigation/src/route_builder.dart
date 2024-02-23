import 'package:auto_route/auto_route.dart';
import 'package:banking_client/core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class RouteBuilder {
  static Route<T> withoutAnimation<T>(
    _,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return PageRouteBuilder<T>(
      settings: page,
      pageBuilder: (_, __, ___) => child,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }

  static Route<T> dismissibleDialog<T>(
    _,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return PageRouteBuilder<T>(
      settings: page,
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: true,
      opaque: false,
      fullscreenDialog: false,
      pageBuilder: (BuildContext context, Animation<double> animation, ___) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.DIALOG_SCREEN_EDGE_PADDING_X,
            vertical: AppDimens.DIALOG_SCREEN_EDGE_PADDING_Y,
          ),
          child: Center(
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          ),
        );
      },
      transitionDuration: AppDimens.DIALOG_TRANSITION_DURATION,
      reverseTransitionDuration: AppDimens.DIALOG_REVERSE_TRANSITION_DURATION,
    );
  }

  static Route<T> modalDialog<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return PageRouteBuilder<T>(
      settings: page,
      barrierColor: Colors.amber,
      opaque: false,
      fullscreenDialog: true,
      pageBuilder: (_, __, ___) => child,
      transitionDuration: AppDimens.DIALOG_TRANSITION_DURATION,
      reverseTransitionDuration: AppDimens.DIALOG_REVERSE_TRANSITION_DURATION,
      barrierDismissible: true,
    );
  }
}
