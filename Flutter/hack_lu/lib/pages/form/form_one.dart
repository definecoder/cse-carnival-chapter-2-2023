import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hack_lu/pages/form/form_four.dart';
import 'package:hack_lu/pages/form/form_two.dart';
import 'package:hack_lu/widgets/map_screen.dart';

class FormOne extends StatefulWidget {
  @override
  _FormOneState createState() => _FormOneState();
}

class _FormOneState extends State<FormOne> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String name = "";
  String email = "";
  String location = "";
  String phone = "";
  String origin_country = "";
  String college = "";
  double heighting= 35.0;
  int flag=0;
  final List<String> expertDatas=[];

  void _submit() {
    // print(name);
    // print(email);
    // print(phone);
    // print(origin_country);
    // print(college);

    expertDatas.add(name);
    expertDatas.add(email);
    expertDatas.add(phone);
    expertDatas.add("0");
    expertDatas.add("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrZVChHHPaNq7xP7wAxq-ML_BTSAysHyu06Hz7xImRXJ1lFKUApQGaUr8kw-svEvPooWM&usqp=CAU");
    expertDatas.add(origin_country);
    expertDatas.add(college);
    expertDatas.add("Kamal Bazar");
    expertDatas.add("24.869251, 91.804760");

  }

  @override
  Widget contenti= Text("Location", style: TextStyle(fontSize: 12,
      fontWeight: FontWeight.bold));

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expert's Personal Information",


        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(

            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                          //expertDatas.add(value);
                        });
                      },
                    ),
                    SizedBox(
                      height: heighting,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                          //expertDatas.add(value);
                        });
                      },
                    ),
                    SizedBox(
                      height: heighting,
                    ),
                    contenti,
                    ElevatedButton(onPressed: (){

                      setState(() {
                        //expertDatas.add("Kamal Bazar");
                        //expertDatas.add("24.869251, 91.804760");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=>MapScreen()));

                        contenti= Row(
                          children: [
                            Text("Location",  style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.bold)),
                            SizedBox(width: 15,),
                            Icon(Icons.location_on),
                            Text("Kamal Bazar (24.869251, 91.804760)")
                          ],
                        );


                      });

                    },
                      child: Text("Set Current Location")),

                    TextFormField(
                      decoration: InputDecoration(labelText: 'Phone'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          phone = value;

                        });
                      },
                    ),
                    SizedBox(
                      height: heighting,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Origin Country'),
                      onChanged: (value) {
                        setState(() {
                          origin_country = value;

                        });
                      },
                    ),
                    SizedBox(
                      height: heighting,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'College'),
                      onChanged: (value) {
                        setState(() {
                          college = value;

                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        ElevatedButton(
                          onPressed: (){
                            _submit();

                            // expertDatas.forEach((item) {
                            //   print(item);
                            // });

                            //_submit();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context)=>FormFour(exparties: expertDatas,)));
                          },
                          child: Text("Next"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}