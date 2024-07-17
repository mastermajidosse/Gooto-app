import 'package:bloc/bloc.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/services/api/getdata.dart';
import 'package:gooto/services/service/posts_repo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(BlogState());
  List<BlogModel>? blogModels = [];

  initBlog(context) async {
    emit(BlogState(loading: true));
    print("initBlog");
    try {
      blogModels = await Getdata().fetchQuestions();
      print("done");
      for (String url in blogModels!.map((e) => e.imgurl!).toList())
        precacheImage(CachedNetworkImageProvider(url), context);

      emit(BlogState(loading: false, stories: blogModels));
    } catch (e) {
      print(e);
      emit(BlogState(loading: false, errorMessage: e.toString()));
    }
  }
  // void _precacheImages() {
  //   for (String url in imageUrls) {
  //     precacheImage(CachedNetworkImageProvider(url), context);
  //   }
  // }
  // initBlog() async {
  //   emit(BlogState(loading: true));
  //   try {
  //     blogModels = await PostsRepo().getarticle();
  //     print("titke :  " + blogModels.first.title!);
  //     emit(BlogState(loading: false, stories: blogModels));
  //   } catch (e) {
  //     print(e);
  //     emit(BlogState(loading: false, errorMessage: e.toString()));
  //   }
  // }
}
