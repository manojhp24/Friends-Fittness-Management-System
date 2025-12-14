import 'package:flutter/material.dart';

class AppSnackBar {
  static void _show(
      BuildContext context, {
        required String message,
        required Color color,
        required Color textColor,
        required IconData icon,
        Duration duration = const Duration(seconds: 3),
        SnackBarAction? action,
        VoidCallback? onVisible,
      }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      duration: duration,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: color,
      elevation: 6,
      action: action,
      onVisible: onVisible,
      content: Row(
        children: [
          Icon(icon, color: textColor, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  /// Show a success snackbar with green theme
  static void success(
      BuildContext context,
      String message, {
        Duration duration = const Duration(seconds: 3),
        SnackBarAction? action,
        VoidCallback? onVisible,
      }) {
    final c = Theme.of(context).colorScheme;
    _show(
      context,
      message: message,
      color: c.primary,
      icon: Icons.check_circle,
      textColor: c.onPrimary,
      duration: duration,
      action: action,
      onVisible: onVisible,
    );
  }

  /// Show an error snackbar with red theme
  static void error(
      BuildContext context,
      String message, {
        Duration duration = const Duration(seconds: 4),
        SnackBarAction? action,
        VoidCallback? onVisible,
      }) {
    final c = Theme.of(context).colorScheme;
    _show(
      context,
      message: message,
      color: c.error,
      icon: Icons.error,
      textColor: c.onError,
      duration: duration,
      action: action,
      onVisible: onVisible,
    );
  }

  /// Show a warning snackbar with orange/amber theme
  static void warning(
      BuildContext context,
      String message, {
        Duration duration = const Duration(seconds: 3),
        SnackBarAction? action,
        VoidCallback? onVisible,
      }) {
    final c = Theme.of(context).colorScheme;
    _show(
      context,
      message: message,
      color: c.tertiary,
      icon: Icons.warning_amber,
      textColor: c.onTertiary,
      duration: duration,
      action: action,
      onVisible: onVisible,
    );
  }

  /// Show an info snackbar with blue theme
  static void info(
      BuildContext context,
      String message, {
        Duration duration = const Duration(seconds: 3),
        SnackBarAction? action,
        VoidCallback? onVisible,
      }) {
    final c = Theme.of(context).colorScheme;
    _show(
      context,
      message: message,
      color: c.secondary,
      icon: Icons.info,
      textColor: c.onSecondary,
      duration: duration,
      action: action,
      onVisible: onVisible,
    );
  }

  /// Show a custom snackbar with custom colors and icon
  static void custom(
      BuildContext context, {
        required String message,
        required Color backgroundColor,
        required Color textColor,
        required IconData icon,
        Duration duration = const Duration(seconds: 3),
        SnackBarAction? action,
        VoidCallback? onVisible,
      }) {
    _show(
      context,
      message: message,
      color: backgroundColor,
      icon: icon,
      textColor: textColor,
      duration: duration,
      action: action,
      onVisible: onVisible,
    );
  }

  /// Show a loading snackbar (infinite duration until dismissed)
  static void loading(BuildContext context, String message) {
    final c = Theme.of(context).colorScheme;
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      duration: const Duration(days: 365), // Effectively infinite
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: c.surfaceContainerHighest,
      elevation: 6,
      content: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(c.primary),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: c.onSurface,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }


  static void hide(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}