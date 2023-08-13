import 'package:flutter/material.dart';
import 'package:projectofdream/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {

  void setupWorlTime ()async {
    WorldTime instance = WorldTime(location: 'India', url:'Asia/Kolkata' , flag: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_India.svg/2560px-Flag_of_India.svg.png');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,'flag':instance.flag,'time':instance.time,'isdaytime':instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    setupWorlTime();
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: const Center(
          child: SpinKitCircle(color: Colors.white,size: 100,)
        )
    );
  }
}
