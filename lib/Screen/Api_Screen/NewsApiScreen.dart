import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green/Feature/helper/custom_text.dart';
import 'package:green/Feature/helper/color.dart';
import 'package:green/Screen/Api_Screen/api_controller.dart';
import 'package:green/Screen/Api_Screen/news_detail.dart';
import 'package:shimmer/shimmer.dart';

class News extends StatelessWidget {
  News({super.key});

  Appcolor appcolor = Appcolor();
  ApiIntegration news_api = ApiIntegration();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Get.back();
            },
          ),
          backgroundColor: Colors.transparent,
          title: custom_Text(
            name: "News",
            color: appcolor.themegreen,
          ),
          centerTitle: true,
        ),
        backgroundColor: appcolor.themecolor,
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: FutureBuilder(
              future: news_api.NewsApi(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return ListView.builder(
                    itemCount: 14,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade700,
                        highlightColor: Colors.grey.shade100,
                        child: Column(children: [
                          ListTile(
                            leading: Container(
                              color: Colors.white,
                              height: 50.h,
                              width: 50.w,
                            ),
                            title: Container(
                              color: Colors.white,
                              height: 10.h,
                              width: 80.w,
                            ),
                            subtitle: Container(
                              height: 10.h,
                              width: 80.w,
                              color: Colors.white,
                            ),
                          )
                        ]),
                      );
                    },
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data['articles'].length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = snapshot.data["articles"][index];
                    return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return NewsApiDetails(
                              image: data["urlToImage"],
                              des: data["description"],
                              title: data["title"],
                              url: data["url"],
                              aut: data["author"],
                              sour: data['source']['name'],
                            );
                          }));
                        },
                        child: Card(
                          color: Colors.transparent,
                          child: Container(
                            height: 70.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: appcolor.themegreen),
                            ),
                            child: ListTile(
                              selectedColor: appcolor.themegreen,
                              leading: Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: Image.network(
                                  "${data["urlToImage"] == null ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyFZXxXWbEOZhU2k6hYB_PUFDOCQ8LBdbhLio9-N2iyA&s" : data["urlToImage"]}",
                                ),
                              ),
                              title: Text(
                                "${data["title"]}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: appcolor.themegreen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ));
                  },
                );
              }),
        ),
      ),
    );
  }
}
