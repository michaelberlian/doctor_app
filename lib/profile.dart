import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  DateTime _date;

  String chosenTitle;
  List listTitle = [
    "Dr","Prof"
  ];
  String chosenSex;
  List listSex = [
    "Male","Female"
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Profile',
                    style:
                    TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  DropdownButton(
                    hint: Text("Title "),
                    icon: Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                      color: Color(0xff425563)
                    ),
                    value: chosenTitle,
                    onChanged: (newTitle){
                      setState(() {
                        chosenTitle = newTitle;
                      });
                    },
                    items: listTitle.map((valueTitle) {
                      return DropdownMenuItem(
                        value: valueTitle,
                        child: Text(valueTitle),
                      );
                    }).toList()
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'First Name',
                              labelStyle: TextStyle(
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff425563)),
                              // hintText: 'EMAIL',
                              // hintStyle: ,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff425563))))
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: TextField(
                            decoration: InputDecoration(
                                labelText: 'Last Name',
                                labelStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff425563)),
                                // hintText: 'EMAIL',
                                // hintStyle: ,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff425563))))
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  DropdownButton(
                      hint: Text("Sex "),
                      icon: Icon(Icons.arrow_drop_down),
                      isExpanded: true,
                      style: TextStyle(
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold,
                          color: Color(0xff425563)
                      ),
                      value: chosenSex,
                      onChanged: (newSex){
                        setState(() {
                          chosenSex = newSex;
                        });
                      },
                      items: listSex.map((valueSex) {
                        return DropdownMenuItem(
                          value: valueSex,
                          child: Text(valueSex),
                        );
                      }).toList()
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: TextField(
                            decoration: InputDecoration(
                                labelText: 'DOB',
                                labelStyle: TextStyle(
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff425563)),
                                // hintText: 'EMAIL',
                                // hintStyle: ,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff425563))))
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        flex: 1,
                        child:
                          IconButton(
                            icon: Icon(Icons.calendar_today_rounded),
                            onPressed: () {
                              showDatePicker(context: null, initialDate: DateTime(2000), firstDate: DateTime(1900), lastDate: DateTime.now()
                              ).then((date){
                                setState(() {
                                  _date=date;
                                });
                              });
                            },
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 50.0),
                  Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Color(0xff768692),
                        color: Color(0xff425563),
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/home');
                          },
                          child: Center(
                            child: Text(
                              'FINISH',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Arial'),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child:

                        Center(
                          child: Text('Go Back',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Arial')),
                        ),


                      ),
                    ),
                  ),
                ],
              )),
        ]));
  }
}