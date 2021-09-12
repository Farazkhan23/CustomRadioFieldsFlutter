import 'dart:math';

import 'package:custom_radio_test/Widgets/CustomRadioFields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLoginForm extends StatefulWidget {
  const MyLoginForm({Key? key}) : super(key: key);

  @override
  _MyLoginFormState createState() => _MyLoginFormState();
}

class _MyLoginFormState extends State<MyLoginForm> {

  dynamic selectedValue;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Form"),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomRadioField(
                  onChanged: (v){
                    print(v);
                    if(selectedValue == v){
                      setState(() {
                        selectedValue = null;
                      });
                    }else{
                      setState(() {
                        selectedValue = v;
                      });
                    }
                  },
                  onSaved: (v) {
                      selectedValue = v;

                  },
                  validator: (v) {
                    if(selectedValue == null){
                      return "You have not indicated your gender";
                    }else{
                      return null;
                    }
                  },
                  values: ["Male", "Female"],
                  groupValue: selectedValue,
                ),

                ElevatedButton(onPressed: (){
                  _formKey.currentState?.validate();
                }, child: Text("Submit Form")),


                ElevatedButton(onPressed: (){
                  setState(() {
                    selectedValue = null;
                  });
                }, child: Text("Reset Gender selection"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
