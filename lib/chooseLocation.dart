import 'package:api_calling/APIsUtil/WorldTime.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  static const id='chooseloc';
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(flag: 'Tiranga', location: 'India', url: 'Asia/Kolkata'),
    WorldTime(flag: 'Counntry1', location: 'Africa', url: 'Africa/Abidjan'),
    WorldTime(flag: 'Counntry2', location: 'America', url: 'America/Los_Angeles'),
    WorldTime(flag: 'Counntry3', location: 'Europe', url: 'Europe/Vienna'),
  ];
void updateTime(index)async{
  WorldTime instance=locations[index];
  await instance.getTime();
  Navigator.pop(context,{
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.time,
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose location'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(onTap: (){
        updateTime(index);
              print(locations[index].url);
  //            Navigator.pushReplacementNamed(context, SecondScreen.id);
            },
              title: Text(locations[index].location),
              leading:Text(locations[index].flag) ,
            ),
          );
        }
      ),
    );
  }
}
