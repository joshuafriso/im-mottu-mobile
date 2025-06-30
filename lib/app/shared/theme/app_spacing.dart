class AppSpacing {
  AppSpacing._();

  // Base spacing unit
  static const double baseUnit = 4.0;

  // Spacing scale
  static const double xs = baseUnit; // 4px
  static const double sm = baseUnit * 2; // 8px
  static const double md = baseUnit * 3; // 12px
  static const double lg = baseUnit * 4; // 16px
  static const double xl = baseUnit * 5; // 20px
  static const double xxl = baseUnit * 6; // 24px
  static const double xxxl = baseUnit * 8; // 32px

  // Semantic spacing
  static const double elementSpacing = sm; // 8px
  static const double sectionSpacing = lg; // 16px
  static const double screenPadding = lg; // 16px
  static const double cardPadding = lg; // 16px
  static const double buttonPadding = md; // 12px
}
