import 'package:flutter/material.dart';


class Ticket{
  String id;
  String title;
  String status;
  String date;
  String description;
  String? category;
  String? sub_category;
  String? project;
  Ticket({this.id='',required this.title,required this.status,this.description='Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    required this.date,this.category=null,this.sub_category='lc',this.project=null});
}