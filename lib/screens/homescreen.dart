import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fitness_tracker_app/global/common/utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  buildTab(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
        child: Chip(
          elevation: 10,
          backgroundColor: Colors.redAccent,
          label: 
            Text(
              text, 
              style: textStyle(18, Colors.white, FontWeight.w700),
            )
        ),
    );
  }

  openAddDialog(context) {
    return showDialog(context: context, builder: (context) {
      return Dialog(
        child: Container(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text(
                    "add", 
                    style: textStyle(28, Colors.black, FontWeight.w700),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 125,
                        height: 40,
                        child: TextFormField(
                          style: textStyle(20, Colors.black, FontWeight.w500),
                          decoration: InputDecoration(
                            hintText: "Add your alarm details!",
                            border: OutlineInputBorder(
                              borderSide:
                                BorderSide(width: 1, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      DropdownButton(
                        dropdownColor: Colors.grey,
                        elevation: 5,
                        value: "Alarm",
                        onChanged: (value) {
                          print(value);
                        },
                        items: [
                          DropdownMenuItem(
                            value: "Alarm",
                            child: Text(
                              "Alarm",
                              style:
                                textStyle(18, Colors.black, FontWeight.w700),
                            ),
                          ),
                        ]
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  IconButton(
                    icon: Icon(Icons.double_arrow_rounded), 
                    onPressed: ()=> print("Pressed"),
                    color: Colors.redAccent,
                    iconSize: 40,
              ),
                ],
              ),          
            ),
          ),
        );
      }
    );
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBF5F5),
      floatingActionButton: Chip(
        backgroundColor: Colors.redAccent,
        onDeleted: () => openAddDialog(context),
        deleteIcon: Icon(Icons.add, color: Colors.white, size: 26),
          label: 
            Text(
              "Add", 
              style: 
                textStyle(22, Colors.white, FontWeight.w600),
            ),
        ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                Text("Active Fanatics", 
                style: textStyle(45, Colors.black, FontWeight.w600),
                ),
                SizedBox(
                  height: 15
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child:
                    Row(
                      children: [
                        buildTab("Calories"),
                        buildTab("Steps"),
                        buildTab("Add Alarm")
                      ],
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20, right: 20,),
                  child: 
                    ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: ListTile(
                            leading: Image(
                              image: AssetImage('images/fire.png'),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          title: 
                            Text(
                              "Placeholder Alarm", 
                              style: 
                                textStyle(27, Colors.black, FontWeight.w600),
                            ),
                          trailing: Icon(Icons.delete, color: Colors.redAccent, size: 28)
                          ),
                        )
                      );
                  })
                )
              ],
            ),
          ),
        ),
      );
  }
}