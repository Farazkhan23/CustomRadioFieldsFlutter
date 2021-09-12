import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRadioField extends FormField<dynamic> {

  ///Todo: We can manage validation here also but for now I kept it dynamic
  ///It will be changing based on what we require
  CustomRadioField(
      {required FormFieldSetter onSaved,
      required FormFieldValidator validator,
      required List values,
      dynamic groupValue,
      required Function(dynamic) onChanged,
      bool autovalidate = false})
      : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: groupValue,
            autovalidate: autovalidate,
            builder: (FormFieldState state) {
              print("State ${state.hasError}");
              return Container(
                // padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 6,horizontal: 8),
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.teal.withOpacity(.1)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${values[index]}",style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600
                              ),),
                              Radio(value: values[index], groupValue: groupValue, onChanged: onChanged)
                            ],
                          )
                        );
                      },
                      itemCount: values.length,
                    ),
                    state.hasError?
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                      child: Text(
                        state.errorText!,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12
                        )
                      ),
                    ) :
                    Container()
                  ],
                ),
              );
            });
}
