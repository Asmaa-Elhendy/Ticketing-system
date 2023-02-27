import 'package:flutter/material.dart';


class SubCategoriesProvider extends ChangeNotifier{
  String? selectedSubCategory;
  List<String> SubCategories=[];
  setSelectedSubCategory(String selected){
    selectedSubCategory=selected;
    notifyListeners();
  }
  setSubCategories( List<String> subcategories){
    SubCategories=subcategories;
    selectedSubCategory=SubCategories.length==0?null:SubCategories[0];
    notifyListeners();
  }

}