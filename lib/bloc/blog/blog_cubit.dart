import 'package:bloc/bloc.dart';
import 'package:gooto/models/blog_model.dart';
import 'package:gooto/services/api/getdata.dart';
import 'package:gooto/services/service/posts_repo.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit() : super(BlogState());
  List<BlogModel>? blogModels = [];

  initBlog() async {
    emit(BlogState(loading: true));
    print("initBlog");
    try {
      blogModels = await Getdata().fetchQuestions();
      print("done");
      emit(BlogState(loading: false, stories: blogModels));
    } catch (e) {
      print(e);
      emit(BlogState(loading: false, errorMessage: e.toString()));
    }
  }
}
