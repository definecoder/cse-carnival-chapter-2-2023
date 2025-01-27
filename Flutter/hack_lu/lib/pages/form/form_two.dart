import 'package:flutter/material.dart';
import 'package:hack_lu/pages/form/form_three.dart';

class FormTwo extends StatefulWidget {
  const FormTwo({
    super.key,
    required this.exparties,


  });
  final List<String> exparties;

  @override
  _FormTwoState createState() => _FormTwoState();
}

class _FormTwoState extends State<FormTwo> {
  final GlobalKey<FormState> _formKey2 = GlobalKey();
  String cur_uni = "";
  String present_country = "";
  String state = "";
  String study_field= "";
  String degree = "Bsc";
  String session = "";
  double heighting= 35.0;


  void _formTwoSubimt() {
    // print(cur_uni);
    // print(state);
    // print(present_country);
    // print(study_field);
    // print(degree);
    // print(session);

    widget.exparties.add(cur_uni);
    widget.exparties.add(state);
    widget.exparties.add(present_country);
    widget.exparties.add(study_field);
    widget.exparties.add(degree);
    widget.exparties.add(session);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Academic Information"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey2,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Current University'),
                      onChanged: (value) {
                        setState(() {
                          cur_uni = value;
                         // print(value);
                        });
                      },
                    ),
                    SizedBox(
                      height: heighting,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Country'),
                      onChanged: (value) {
                        setState(() {
                          present_country = value;
                        //  print(value);
                        });
                      },
                    ),
                    SizedBox(
                      height: heighting,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'State'),
                      onChanged: (value) {
                        setState(() {
                          state = value;
                          //  print(value);
                        });
                      },
                    ),
                    SizedBox(
                      height: heighting,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Field of Study'),
                      //keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          study_field = value;
                         // print(value);
                        });
                      },
                    ),
                    SizedBox(
                      height: heighting,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Degree'),
                      onChanged: (value) {
                        setState(() {
                          degree = value;
                         // print(value);
                        });
                      },
                    ),
                    SizedBox(
                      height: heighting,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Session'),
                      onChanged: (value) {
                        setState(() {
                          session = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: heighting,
                    ),


                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        ElevatedButton(
                          onPressed: (){

                            _formTwoSubimt();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context)=>FormThree(exparties: widget.exparties,)));
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