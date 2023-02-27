import 'dart:io';
import 'package:image_picker/image_picker.dart';


class Article{
  String id;
  String name;
  String description;
  String? category;
  File? file;
  PickedFile? imageFile ;
  List<String> selected_tages;
  bool status;
  bool privacy;
  Article({this.id='',required this.name,this.description='Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
   this.category=null,this.file=null,this.imageFile=null,this.selected_tages=const [],this.status=false,this.privacy=false});
}