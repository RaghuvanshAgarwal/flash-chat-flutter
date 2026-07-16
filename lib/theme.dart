import 'dart:ui';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData buildTheme({
    required Color seedColor,
    Brightness brightness = Brightness.light,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: brightness,
    );

    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        prefixIconColor: colorScheme.onSurfaceVariant,
        suffixIconColor: colorScheme.onSurfaceVariant,
      ),
      textTheme: Typography.material2021().black.apply(
        bodyColor: colorScheme.onSurface,
      ),
      extensions: <ThemeExtension<dynamic>>[
        AppColors(
          brand: colorScheme.primary,
          accent: colorScheme.secondary,
          success: Colors.green.shade600,
          danger: Colors.red.shade600,
        ),
        AppSpacing(s1: 4, s2: 8, s3: 12, s4: 16, s5: 24),
      ],
    );
  }
}

class AppColors extends ThemeExtension<AppColors> {
  final Color? brand;
  final Color? accent;
  final Color? success;
  final Color? danger;

  AppColors({this.brand, this.accent, this.success, this.danger});

  @override
  AppColors copyWith({
    Color? brand,
    Color? accent,
    Color? success,
    Color? danger,
  }) {
    return AppColors(
      brand: brand ?? this.brand,
      accent: accent ?? this.accent,
      success: success ?? this.success,
      danger: danger ?? this.danger,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      brand: Color.lerp(brand, other.brand, t),
      accent: Color.lerp(accent, other.accent, t),
      success: Color.lerp(success, other.success, t),
      danger: Color.lerp(danger, other.danger, t),
    );
  }
}

class AppSpacing extends ThemeExtension<AppSpacing> {
  final double? s1;
  final double? s2;
  final double? s3;
  final double? s4;
  final double? s5;

  AppSpacing({this.s1, this.s2, this.s3, this.s4, this.s5});

  @override
  AppSpacing copyWith({
    double? s1,
    double? s2,
    double? s3,
    double? s4,
    double? s5,
  }) {
    return AppSpacing(
      s1: s1 ?? this.s1,
      s2: s2 ?? this.s2,
      s3: s3 ?? this.s3,
      s4: s4 ?? this.s4,
      s5: s5 ?? this.s5,
    );
  }

  @override
  AppSpacing lerp(ThemeExtension<AppSpacing>? other, double t) {
    if (other is! AppSpacing) return this;
    return AppSpacing(
      s1: lerpDouble(s1, other.s1, t),
      s2: lerpDouble(s2, other.s2, t),
      s3: lerpDouble(s3, other.s3, t),
      s4: lerpDouble(s4, other.s4, t),
      s5: lerpDouble(s5, other.s5, t),
    );
  }
}
