import 'package:flutter/material.dart';


class ProjectsProvider extends ChangeNotifier{
  String? selectedProject;
  List<String> projects=[];
  setSelectedProject(String selected){
    selectedProject=selected;
    notifyListeners();
  }
  setProjects( List<String> projectss){
    projects=projectss;
    selectedProject=projects.length==0?null:projects[0];
    notifyListeners();
  }



}