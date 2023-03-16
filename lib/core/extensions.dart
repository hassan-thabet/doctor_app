import 'dart:ui';
extension Sizer on num {
  // Calculates the height depending on the device's screen size
  //
  //  20.h -> will take 20% of the screen's height
  double get h => this *  window.physicalSize.height /  window.devicePixelRatio / 100 ;

  // Calculates the width depending on the device's screen size
  //
  //  20.w -> will take 20% of the screen's width
  double get w => this *  window.physicalSize.width /  window.devicePixelRatio / 100 ;
}
