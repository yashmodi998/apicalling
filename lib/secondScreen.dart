import 'package:api_calling/APIsUtil/WorldTime.dart';
import 'package:api_calling/APIsUtil/countryApi.dart';
import 'package:api_calling/FirstScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SecondScreen extends StatefulWidget {
  static const id = 'DatenTime';

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String time = 'loading';

  void setCountry() async {
    CountryApi countryApi = CountryApi();
    await countryApi.getCountry();
//  print('into the counry');
  }

  void setupWorldTime() async {
    WorldTime worldTime1 =
    WorldTime(flag: 'Tiranga', location: 'India', url: 'Asia/Kolkata');
    // WorldTime worldTime1 =WorldTime(flag: 'tiranga',location:'Africa',url: 'Africa/Abidjan');
    await worldTime1.getTime();
    print(worldTime1.time);
    setState(() {
      time = worldTime1.time;
    });
    Navigator.pushReplacementNamed(context, FirstScreen.id, arguments: {
      'location': worldTime1.location,
      'flag': worldTime1.flag,
      'time': worldTime1.time,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    setCountry();

    //setCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: SpinKitCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.red : Colors.green,
              ),
            );
          },)
        )
    );
  }
}
