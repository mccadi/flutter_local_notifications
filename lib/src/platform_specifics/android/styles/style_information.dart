part of f2f_notifications;

/// Abstract class for defining an Android notification style
abstract class StyleInformation {
  StyleInformation();

  Map<String, dynamic> toMap();
}
