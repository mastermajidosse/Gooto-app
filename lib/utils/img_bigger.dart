// import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:ui';

class ImageBigger {
  // static Dialog imagePop(String img) {
  //   return Dialog(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //     child: CachedNetworkImage(
  //       height: 400,
  //       width: 400,
  //       placeholder: (context, url) => Center(
  //         child: CircularProgressIndicator(
  //           color: Colors.black87,
  //         ),
  //       ),
  //       errorWidget: (context, url, error) => Center(
  //         child: Icon(Icons.error),
  //       ),
  //       imageUrl: img,
  //       imageBuilder: (context, imageProvider) => Container(
  //         decoration: BoxDecoration(
  //           image: DecorationImage(
  //             image: imageProvider,
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  static Dialog imagePopAss(String img) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InteractiveViewer(
        panEnabled: false, // Set it to false
        boundaryMargin: EdgeInsets.all(100),
        minScale: 0.5,
        maxScale: 2,
        child: PhotoView(
          imageProvider: AssetImage(
            img,
          ),
        ),
      ),
    );
  }

  static imagePopAssNet(String img, context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Adjust the blur intensity
            child: Container(
              color: Colors.white
                  .withOpacity(0.0), // Adjust the opacity to control the background darkness
            ),
          ),
          InteractiveViewer(
            panEnabled: false,
            boundaryMargin: EdgeInsets.all(100),
            minScale: 0.5,
            maxScale: 2,
            child: PhotoView(
              imageProvider: NetworkImage(img),
              backgroundDecoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.5),
                child: Icon(Icons.close, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // static Dialog imagePop(XFile img) {
  //   return Dialog(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //     child: InteractiveViewer(
  //       panEnabled: false, // Set it to false
  //       boundaryMargin: EdgeInsets.all(100),
  //       minScale: 0.5,
  //       maxScale: 2,
  //       child: Container(
  //           height: 500,
  //           width: 500,
  //           decoration: BoxDecoration(
  //               image: DecorationImage(
  //             image: FileImage(
  //               File(img.path),
  //             ),
  //             fit: BoxFit.cover,
  //           ))),
  //     ),
  //   );
  // }

  static Dialog imagePopImage(Image img) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InteractiveViewer(
        panEnabled: false, // Set it to false
        boundaryMargin: EdgeInsets.all(100),
        minScale: 0.5,
        maxScale: 2,
        child: Container(
            height: 500,
            width: 500,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: img.image,
              fit: BoxFit.cover,
            ))),
      ),
    );
  }
}
