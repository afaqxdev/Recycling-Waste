import 'package:flutter/material.dart';
import 'package:green/Screen/Recycle_Category/Menu.dart';

var banklist = <Model>[
  Model(
    Image: "image/hbl.png",
    Sub_name: "Habib Bank Limited",
    pagename: home(),
  ),
  Model(
    Image: "image/easy.png",
    Sub_name: "Easy paisa",
    pagename: home(),
  ),
  Model(
    Image: "image/habib.png",
    Sub_name: "Habib Bank ",
    pagename: home(),
  ),
  Model(
    Image: "image/jazz.png",
    Sub_name: "Jazz Cash",
    pagename: home(),
  ),
  Model(
    Image: "image/mb.png",
    Sub_name: "Meezan Bank",
    pagename: home(),
  ),
  Model(
    Image: "image/mcb.png",
    Sub_name: "Muslim Comerical Bank",
    pagename: home(),
  ),
  Model(
    Image: "image/ubl.png",
    Sub_name: "United Bank Limited",
    pagename: home(),
  ),
  Model(
    Image: "image/alfa.png",
    Sub_name: "Bank Alfalah",
    pagename: home(),
  ),
  Model(
    Image: "image/allied.png",
    Sub_name: "Allied Bank",
    pagename: home(),
  ),
];

class Model {
  String? Image;
  String? Sub_name;
  Widget pagename;

  Model({required this.Image, required this.Sub_name, required this.pagename});
}
