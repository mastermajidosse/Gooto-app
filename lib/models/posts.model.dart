import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gooto/models/blog_model.dart';

class Posts{
   String? time;
   String? name;
   String? image;
   String? imageprofile;
   String? local;
   String? description;
   List<Comments>? comments;
   int Like;
   int Rating;
   Color iconColor; 
   Posts({required this.name,required this.time,required this.image,required this.imageprofile,required this.local,required this.comments,required this.Like,required this.description,this.iconColor = Colors.black54,required this.Rating});
   Posts fromData(Map<String, dynamic> map){
    return Posts(
      name:  map['name'], 
    image: map['image'], 
    imageprofile:map[ 'imageprofile'],
    local: map['local'],
    comments: map['comments'], 
    description: map['description'],
    Like: map['like'],
    Rating: map['Rating'],
    time: map['time']);
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