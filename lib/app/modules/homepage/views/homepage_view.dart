import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotelsgo/app/service/api_data.dart';

import '../../../custom_widget/backroun_screen/backroundscreen.dart';
import '../../../utils/style/text_style.dart';
import '../controllers/homepage_controller.dart';

class HomepageView extends GetView<HomepageController> {
  HomepageController homepageController = Get.put(HomepageController());

  HomepageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return BackrounScreen(
        body: FutureBuilder(
            future: ApiService().getfatchdata(),
            builder: (BuildContext context, snapshort) {
              if (snapshort.hasError) {
                return Center(
                  child: Text(
                    "Something wrong with message : ${snapshort.error
                        .toString()}",
                    textAlign: TextAlign.center,
                  ),
                );
              } else if (snapshort.connectionState == ConnectionState.done) {
                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      SizedBox(
                        height: 5,
                      ),
                  itemCount: controller.hoteldatainfo.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 10, right: 10, bottom: 15),
                      child: Container(
                          height: size.height / 2.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 15.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(
                                      -2.0,
                                      8.0,
                                    ))
                              ]),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                  child: Stack(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: snapshort.data![index].image,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        12),
                                                    topRight: Radius.circular(
                                                        12)),
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                        placeholder: (context, url) =>
                                            Center(
                                                child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 12, top: 15),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: CircleAvatar(
                                              radius: 28,
                                              backgroundColor: Colors.black26,
                                              child: Obx(() {
                                                return GestureDetector(
                                                    onTap: () {
                                                      controller.toogle(index);
                                                    },
                                                    child: controller
                                                        .plantantigensselected
                                                        .contains(index) ? Icon(
                                                      Icons.favorite_outline,
                                                      color: Colors.white,
                                                      size: 30,) : Icon(
                                                      Icons.favorite,
                                                      color: Colors.white,
                                                      size: 30,)
                                                );
                                              })
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          RatingBar.builder(
                                            initialRating: snapshort
                                                .data![index].starts
                                                .toDouble(),
                                            itemSize: 20,
                                            minRating: 0,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemBuilder: (context, _) =>
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 10,
                                                ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Text(
                                            "Hotel",
                                            style: textAppBarStyle(
                                                color: Colors.black,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        snapshort.data![index].name,
                                        style: textAppBarStyle(
                                            color: Colors.black,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 30.h,
                                            width: 50.w,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Center(
                                                child: Text(
                                                  snapshort.data![index]
                                                      .reviewScore
                                                      .toString(),
                                                  style: textAppBarStyle(
                                                      fontSize: 16.sp,
                                                      color: Colors.white),
                                                )),
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Text(
                                            snapshort.data![index].review,
                                            style: textAppBarStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Icon(
                                            Icons.location_on_sharp,
                                            size: 20,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            snapshort.data![index].address,
                                            style: textAppBarStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Container(
                                        height: 100.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                          border: Border.all(
                                              color: Colors.grey, width: 1.5),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 25.h,
                                                        width: size.width / 2.2,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .blue.shade300
                                                                .withOpacity(
                                                                0.4),
                                                            borderRadius:
                                                            BorderRadius
                                                                .all(Radius
                                                                .circular(
                                                                10))),
                                                        child: Center(
                                                          child: Text(
                                                            "Our lowest price",
                                                            style: textAppBarStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                fontSize: 16.sp,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 6),
                                                            child: Text(
                                                              "\$",
                                                              style: textAppBarStyle(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  fontSize:
                                                                  16.sp,
                                                                  color: Colors
                                                                      .green),
                                                            ),
                                                          ),
                                                          Text(
                                                            snapshort
                                                                .data![index]
                                                                .price
                                                                .toInt()
                                                                .toString(),
                                                            style: textAppBarStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                fontSize: 24.sp,
                                                                color: Colors
                                                                    .green),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 6),
                                                            child: Text(
                                                              snapshort
                                                                  .data![index]
                                                                  .currency,
                                                              style: textAppBarStyle(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  fontSize:
                                                                  18.sp,
                                                                  color: Colors
                                                                      .green),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Align(
                                                        alignment:
                                                        Alignment.topLeft,
                                                        child: Text(
                                                          "Renaissance",
                                                          style:
                                                          textAppBarStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              fontSize:
                                                              14.sp,
                                                              color: Colors
                                                                  .grey),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 1,
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "View Deal",
                                                        style: textAppBarStyle(
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 16.sp,
                                                            color:
                                                            Colors.black),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward_ios,
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "More prices",
                                          style: textAppBarStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      Divider(
                                        height: 1,
                                        indent: size.width / 1.53,
                                        endIndent: 1,
                                        thickness: 2,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    );
                  },
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
