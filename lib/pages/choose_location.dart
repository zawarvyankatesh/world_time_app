// import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:projectofdream/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime>locations = [  WorldTime(url: ' Europe/Athens' , location: 'Athens', flag:"https://static.wikia.nocookie.net/flages/images/8/8e/Gr-athen.gif/revision/latest?cb=20130903020544")
  ,WorldTime(url: 'Africa/Cairo' , location: 'Cairo' , flag:"https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Cairo.svg/326px-Flag_of_Cairo.svg.png?20220711034119"),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi' , flag:"https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Cairo.svg/326px-Flag_of_Cairo.svg.png?20220711034119")
  ,WorldTime(url: 'America/Chicago' , location: 'Chicago' , flag:"https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Flag_of_Chicago%2C_Illinois.svg/1200px-Flag_of_Chicago%2C_Illinois.svg.png")
  ,WorldTime(url: 'America/New_York' , location: 'New York' , flag:"https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_New_York.svg/255px-Flag_of_New_York.svg.png")
  ,WorldTime(url: 'Asia/Seoul', location: 'Seoul' , flag:"https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/255px-Flag_of_South_Korea.svg.png")
  ,WorldTime(url: 'Asia/Jakarta' , location: 'Jakarta', flag:"https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Insignia_of_the_Indonesian_National_Police.svg/1200px-Insignia_of_the_Indonesian_National_Police.svg.png"),
];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
// navigate to home screen
    Navigator.pushNamed(context,'/home',arguments: {'location': instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,}
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body : ListView.builder(
          itemCount:locations.length,
          itemBuilder: (context,index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
              child: Card (
              child: ListTile(
                onTap:(){
                  updateTime(index);
                },

                title: Text(locations[index].location),
                leading: CircleAvatar(backgroundImage: NetworkImage(locations[index].flag,),backgroundColor: Colors.white,
              ),
              )),
            );
          }
          ),
        );
  }
}
//syntax to create fake delay future.delay
//what is future object
//we can return value from await wala fun