import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gooto/models/blog_model.dart';

class Posts{
   String? name;
   String? image;
   String? imageprofile;
   String? local;
   String? description;
   List<Comments>? comments;
   int Like;
   Color iconColor; 
   Posts({required this.name,required this.image,required this.imageprofile,required this.local,required this.comments,required this.Like,required this.description,this.iconColor = Colors.black54,});
   Posts fromData(Map<String, dynamic> map){
    return Posts(
      name:  map['name'], 
    image: map['image'], 
    imageprofile:map[ 'imageprofile'],
    local: map['local'],
    comments: map['comments'], 
    description: map['description'],
    Like: map['like']);
   }
Map<String,dynamic> tojson(){
return{
  'name':name,
  "image":image,
  'imageprofile':imageprofile,
  'local':local,
  'description':description,
  'comments':comments,
  'Like':Like
};
}


}