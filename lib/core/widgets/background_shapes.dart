import 'package:flutter/material.dart';
import '../constants/app_assets.dart';
import '../style/app_size.dart';
import 'custom_svg.dart';

class BackgroundShapes {
  static List<Widget> get items => [
    Positioned(
      top: 0,
      left: -3,
      child: CustomSvg(
        svg: AppAssetsSvg.backgroundShape,
        width: AppSize.getWidth(80),
      ),
    ),
    Positioned(
      bottom: 0,
      right: -3,
      child: CustomSvg(
        svg: AppAssetsSvg.backgroundShape2,
        width: AppSize.getWidth(80),
      ),
    ),
  ];
}
