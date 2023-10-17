import 'export_config.dart';

const String prompt = "Prompt";

// * Dynamic size
class AppFontSizeDynamic {
  static double small = 6.sp;
  static double mediumS = 8.sp;
  static double mediumM = 10.sp;
  static double mediumL = 12.sp;
  static double largeS = 14.sp;
  static double largeM = 16.sp;
  static double largeL = 18.sp;
  static double largeXL = 24.sp;
}

// * Dynamic Height size
class AppFontSizeHeightDynamic {
  static double small = 5.h;
  static double mediumS = 8.h;
  static double mediumM = 10.h;
  static double mediumL = 12.h;
  static double largeS = 14.h;
  static double largeM = 16.h;
  static double largeL = 18.h;
  static double largeXL = 24.h;
}

// * Dynamic Width size
class AppFontSizeWidthDynamic {
  static double small = 6.w;
  static double mediumS = 8.w;
  static double mediumM = 10.w;
  static double mediumL = 12.w;
  static double largeS = 14.w;
  static double largeM = 16.w;
  static double largeL = 18.w;
  static double largeXL = 24.w;
}

// * Fix size
class AppFontSize {
  static double small = 12;
  static double mediumS = 14;
  static double mediumM = 16;
  static double mediumL = 18;
  static double largeS = 20;
  static double largeM = 22;
  static double largeL = 24;
  static double largeXL = 34;

  static void setFontSize() {
    small = 12;
    mediumS = 14;
    mediumM = 16;
    mediumL = 18;
    largeS = 20;
    largeM = 22;
    largeL = 24;
    largeXL = 34;
  }

  static void setFont(String? languageCode) {
    setFontSize();
  }
}
