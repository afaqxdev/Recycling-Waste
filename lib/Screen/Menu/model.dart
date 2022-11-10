import 'package:flutter/material.dart';
import 'package:green/Screen/Glass/Glass.dart';
import 'package:green/Screen/Organic/organic.dart';
import 'package:green/Screen/Paper/paper.dart';
import 'package:green/Screen/metel/matel.dart';
import 'package:green/Screen/Price_list/price_list.dart';

import '../Plastic/plastic.dart';

var all_data_list = <Model>[
  Model(
    Image: "image/plastics.png",
    Sub_name: "Plastics",
    pagename: plastic_page(),
  ),
  Model(
    Image: "image/organic.png",
    Sub_name: "Organic",
    pagename: Organic(),
  ),
  Model(
    Image: "image/glass.png",
    Sub_name: "Glass",
    pagename: glass(),
  ),
  Model(
    Image: "image/metal.png",
    Sub_name: "Metal",
    pagename: metal(),
  ),
  Model(
    pagename: paper(),
    Image: "image/paper.png",
    Sub_name: "Paper",
  ),
  Model(
    pagename: price_list(),
    Image: "image/other.png",
    Sub_name: "Price List",
  ),
];

class Model {
  String? Image;
  String? Sub_name;
  Widget pagename;

  Model({required this.Image, required this.Sub_name, required this.pagename});
}
