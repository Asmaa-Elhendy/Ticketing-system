import 'package:flutter/material.dart';
import 'package:ticketing_system/controller/provider/theme_provider.dart';

import '../../model/customer_model.dart';
import '../../model/project_model.dart';


ProjectTile (width,height,Project project,ThemeProvider provider){

  return Container(
      padding: EdgeInsets.symmetric(horizontal: width*.04,vertical: height*.01),
      child: Column(children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: height*.015),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(project.name,style:  TextStyle(
                  fontFamily: 'SourceSansPro',
                  color: provider.primaryColorLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,

                )),
              ),Icon(Icons.more_vert,size: width*.055,color: provider.primaryColorLight,)
            ],
          ),
        ),
     SizedBox(height: height*.01,), Container(
            width: width*.9,
            height: 1,
            decoration: new BoxDecoration(
                color: Color(0xffe4eef3)
            )
        )
      ],)
  );

}
