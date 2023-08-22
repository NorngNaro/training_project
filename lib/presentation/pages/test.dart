import 'package:flutter/material.dart';
import 'package:training_project/helper/helper_export.dart';

import '../presentation_export.dart';


class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          navigateTo(context, destination: New());
        },
        child: Text('Click Meee', style: defaultBoldTextPrimaryStyle,),
      )
    );
  }
}
