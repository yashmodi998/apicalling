import 'package:api_calling/chooseLocation.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  static const id = 'homepage';

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data =data.isNotEmpty? data: ModalRoute.of(context).settings.arguments;
    //print(data);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async{
                dynamic result=  await Navigator.pushNamed(context, ChooseLocation.id);
                  setState(() {
              //      print(result['time']);
                    data={
                      'time':result['time'],
                      'location':result['location'],
                    };

                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit_location),
                    // color: Colors.red,

                    Text(
                      'Edit Location',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                data['location'],
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,letterSpacing: 3),
              ),
              SizedBox(
                width: 20,
              ),
              Text(data['time'],
                  style: TextStyle(fontSize: 66, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
