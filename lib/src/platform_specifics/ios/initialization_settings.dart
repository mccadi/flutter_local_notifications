part of f2f_notifications;

/// Plugin initialization settings for iOS
class IOSInitializationSettings {
  /// Request permission to display an alert. Default value is true.
  final bool requestAlertPermission;

  /// Request permission to play a sound. Default value is true.
  final bool requestSoundPermission;

  /// Request permission to badge app icon. Default value is true.
  final bool requestBadgePermission;

  /// Default setting that indiciates an alert should be displayed when a notification is triggered while app is in the foreground. Default value is true. iOS 10+ only
  final bool defaultPresentAlert;

  /// Default setting that indiciates if a sound should be played when a notification is triggered while app is in the foreground. Default value is true. iOS 10+ only
  final bool defaultPresentSound;

  /// Default setting that indicates if a badge value should be applied when a notification is triggered while app is in the foreground. Default value is true. iOS 10+ only
  final bool defaultPresentBadge;

  /// Indicates if this plugin should handle incoming notifications and their related actions. Default value is true.
  final bool registerUNUserNotificationCenterDelegate;

  const IOSInitializationSettings(
      {this.requestAlertPermission = true,
      this.requestSoundPermission = true,
      this.requestBadgePermission = true,
      this.defaultPresentAlert = true,
      this.defaultPresentSound = true,
      this.defaultPresentBadge = true,
      this.registerUNUserNotificationCenterDelegate = true});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'requestAlertPermission': requestAlertPermission,
      'requestSoundPermission': requestSoundPermission,
      'requestBadgePermission': requestBadgePermission,
      'defaultPresentAlert': defaultPresentAlert,
      'defaultPresentSound': defaultPresentSound,
      'defaultPresentBadge': defaultPresentBadge,
      'registerUNUserNotificationCenterDelegate':
          registerUNUserNotificationCenterDelegate
    };
  }
}
