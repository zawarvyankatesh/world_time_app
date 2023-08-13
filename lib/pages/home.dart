import 'package:flutter/material.dart';
import 'package:projectofdream/services/globles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String bgimageia='https://images.pexels.com/photos/3015379/pexels-photo-3015379.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  Map data ={};
  void isdaytimee() async {
    if (data['isDaytime']==1){
      bgimageia = 'https://images.wallpapersden.com/image/download/field-grass-tree_ZmtoZmqUmZqaraWkpJRmamhrrWdmamc.jpg';
      String wish ="Good Morning 1";

    }
    else if (data['isDaytime']==2) {
      bgimageia = 'https://i.pinimg.com/236x/92/00/68/9200685ae50abd8455399140418dfa13.jpg';
      String wish ="Good Morning 2";
    }
    else if (data['isDaytime']==3) {
      bgimageia = 'https://i.pinimg.com/736x/80/af/7b/80af7b8e7815a8e101037ba327f1a191.jpg';
      String wish ="Good Afternoon";
}
    else if (data['isDaytime']==4) {
      bgimageia =
      'https://i.pinimg.com/236x/92/00/68/9200685ae50abd8455399140418dfa13.jpg';
      String wish ="Good Night";
    }
    else{
      bgimageia ='https://images.pexels.com/photos/3015379/pexels-photo-3015379.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
      String wish ="Hey!!";
    }
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      data = ModalRoute.of(context)?.settings.arguments as Map;
      isdaytimee();

    // data =data.isEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;

    return Container(
      child: Scaffold(
        // appBar: AppBar(title: Text("Hii"),
        // backgroundColor: Colors.transparent,
        // elevation: 0,),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(bgimageia),  //iusuyr;wiejfoifheo;ef
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0,120,0,0),
            child: Column (
              children : <Widget> [
                RaisedButton.icon(
                  onPressed: ()async{
                    
                    dynamic result =await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag']
                      };
                    });
                  },
                  icon: Icon(Icons.location_on,
                  color: Colors.white,),
                  label: Text('Choose location',style: TextStyle(color: Colors.white),),
                  color: Colors.transparent,
                  elevation:1,
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text(data['location'],
                    style: TextStyle(fontSize: 25,
                    fontWeight:FontWeight.bold,
                    letterSpacing: 2,
                        shadows: [Shadow(color: Colors.black, blurRadius: 8, offset: Offset(2, 2))],
                    color: Colors.white)),
                    SizedBox(width: 20,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 1)]),

                        child: CircleAvatar(backgroundImage: NetworkImage(data['flag']),radius: 22,),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Text(data['time'],style: TextStyle(fontSize: 66,color: Colors.white,
                  shadows: [Shadow(color: Colors.black, blurRadius: 8, offset: Offset(5, 5))],
                ),
                )
            ],
            ),
          ),
        ),
      ),
    );
  }
}
