import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gal/gal.dart';
import 'package:wallpaper_flutter_demo4/core/utils/log.dart';
import 'package:wallpaper_flutter_demo4/core/widgets/base_scaffold.dart';

class ImageDetailsPage extends StatelessWidget {
  final String url;
  final String description;
  final int likes;
  const ImageDetailsPage({
    super.key,
    required this.url,
    required this.description,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Details',
      colors: const [
        Colors.white,
        Colors.black,
      ],
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16.sp),
          // color: Colors.amber,
          child: Stack(
            children: [
              _mainUI(),
              _fab(context),
            ],
          ),
        ),
      ),
    );
  }

  _fab(BuildContext context) => Align(
        alignment: const FractionalOffset(0.99, 0.99),
        child: GestureDetector(
          onTap: () async {
            try {
              // Download Image
              final imagePath =
                  '${Directory.systemTemp.path}/wallpaper_demo.jpg';
              await Dio().download(url, imagePath);
              await Gal.putImage(imagePath);
            } catch (e) {
              Log.showLog(e.toString());
            }
          },
          child: SizedBox.square(
            dimension: 60.sp,
            child: Container(
              padding: EdgeInsets.all(16.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.blue,
              ),
              child: const Icon(
                Icons.download_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );

  _mainUI() => SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.sp),
              child: FadeInImage(
                width: double.maxFinite,
                fit: BoxFit.fill,
                placeholderFit: BoxFit.cover,
                image: NetworkImage(url),
                placeholder: const AssetImage('assets/load.gif'),
              ),
            ),
            SizedBox(
              height: 16.sp,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.sp,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.favorite_rounded,
                        color: Colors.red,
                      ),
                      Text(
                        likes.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      );
}
