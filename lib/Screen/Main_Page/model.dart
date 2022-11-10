import 'package:flutter/material.dart';
import 'package:green/Feature/Api/Email_Api.dart';
import 'package:green/Screen/Menu/Menu.dart';
import 'package:green/Screen/Price_list/price_list.dart';
import 'package:green/Screen/Reward/reward.dart';
import 'package:green/Screen/api/NewsApiScreen.dart';

import 'package:green/Screen/transaction/transaction.dart';

var listview = <Model>[
  Model(
    Image: "image/recycle_page.png",
    Sub_name: "Recycling",
    pagename: home(),
  ),
  Model(
    Image: "image/money.png",
    Sub_name: "Transaction",
    pagename: transaction(),
  ),
  Model(
    Image: "image/reward.png",
    Sub_name: "Reward",
    pagename: reward(),
  ),
  Model(
    Image: "image/news.png",
    Sub_name: "News",
    pagename: News(),
  ),
  Model(
    Image: "image/price_list.png",
    Sub_name: "Price List",
    pagename: price_list(),
  ),
];

class Model {
  String? Image;
  String? Sub_name;
  Widget pagename;

  Model({required this.Image, required this.Sub_name, required this.pagename});
}
