import 'package:base/constans/dictionary.dart';
import 'package:base/environments/environment.dart';
import 'package:flutter/cupertino.dart';

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  Slider(
      {@required this.sliderImageUrl,
      @required this.sliderHeading,
      @required this.sliderSubHeading});
}

final sliderArrayList = [
    Slider(
        sliderImageUrl: '${Environment.imageAssets}reservation.png',
        sliderHeading: Dictionary.SLIDER_HEADING_1,
        sliderSubHeading: Dictionary.SLIDER_DESC_1),
    Slider(
        sliderImageUrl: '${Environment.imageAssets}homecare.png',
        sliderHeading: Dictionary.SLIDER_HEADING_2,
        sliderSubHeading: Dictionary.SLIDER_DESC_2),
    Slider(
        sliderImageUrl: '${Environment.imageAssets}funding.png',
        sliderHeading: Dictionary.SLIDER_HEADING_3,
        sliderSubHeading: Dictionary.SLIDER_DESC_3),
  ];
