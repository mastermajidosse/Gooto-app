import 'package:flutter/material.dart';

class LikeIcon extends StatelessWidget {
  Future<int> tempFuture() async {
    return await Future.delayed(Duration(seconds: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: tempFuture(),
        builder: (context, snapshot) =>
            snapshot.connectionState != ConnectionState.done
                ? Icon(Icons.favorite, size: 110)
                : SizedBox(),
      ),
    );
  }
}
