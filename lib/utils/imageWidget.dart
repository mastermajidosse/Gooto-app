import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gooto/services/app_config.dart';

class UserImageWidget extends StatelessWidget {
  String image;
  double sizeimage;
  UserImageWidget(this.image, this.sizeimage);

  @override
  Widget build(BuildContext context) {
    // print(image);
    return CachedNetworkImage(
      height: sizeimage,
      width: sizeimage,
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: double.infinity,
        height: sizeimage,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(300),
          image: DecorationImage(
            image: AssetImage(AppConfig.defaultImg),
            fit: BoxFit.cover,
          ),
        ),
      ),
      imageUrl: image.toString(),
      imageBuilder: (context, imageProvider) => InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return imagePopProv(imageProvider);
              });
        },
        child: Container(
          width: double.infinity,
          height: sizeimage,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(300),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  static Dialog imagePopProv(ImageProvider imageProvider) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: 400.w,
        height: 500.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
