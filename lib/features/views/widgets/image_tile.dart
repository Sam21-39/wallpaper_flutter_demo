import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageTile extends StatelessWidget {
  final String url;
  final String description;
  final int likes;
  const ImageTile({
    super.key,
    required this.url,
    required this.description,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.sp),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 2.sp,
            offset: Offset.fromDirection(
              pi / 2,
            ),
            color: Colors.black38,
          )
        ],
      ),
      margin: EdgeInsets.all(16.sp),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.sp),
            child: FadeInImage(
              height: 250.h,
              width: double.maxFinite,
              fit: BoxFit.fill,
              placeholderFit: BoxFit.cover,
              image: NetworkImage(url),
              placeholder: const AssetImage('assets/load.gif'),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 2,
                child: Column(),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.sp),
                      bottomRight: Radius.circular(12.sp),
                    ),
                    color: Colors.white54,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          description,
                          maxLines: 4,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'read more...',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
