import 'package:flutter/material.dart';
import 'package:green/Screen/Recycle_Category/Menu.dart';

var banklist = <Model>[
  Model(
    Image: "image/hbl.png",
    Sub_name: "Habib Bank Limited",
  ),
  Model(
    Image: "image/nbp.jpg",
    Sub_name: "National Bank Of Pakistan",
  ),
  Model(
    Image: "image/Faysal.png",
    Sub_name: "Faysal Bank",
  ),
  Model(
    Image: "image/silk.png",
    Sub_name: "Silk bank",
  ),
  Model(
    Image: "image/easy.png",
    Sub_name: "Easy paisa",
  ),
  Model(
    Image: "image/habib.png",
    Sub_name: "Habib Bank ",
  ),
  Model(
    Image: "image/jazz.png",
    Sub_name: "Jazz Cash",
  ),
  Model(
    Image: "image/mb.png",
    Sub_name: "Meezan Bank",
  ),
  Model(
    Image: "image/mcb.png",
    Sub_name: "Muslim Comerical Bank",
  ),
  Model(
    Image: "image/ubl.png",
    Sub_name: "United Bank Limited",
  ),
  Model(
    Image: "image/alfa.png",
    Sub_name: "Bank Alfalah",
  ),
  Model(
    Image: "image/allied.png",
    Sub_name: "Allied Bank",
  ),
];

class Model {
  String? Image;
  String? Sub_name;

  Model({
    required this.Image,
    required this.Sub_name,
  });
}
