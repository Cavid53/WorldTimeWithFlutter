import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/Helsinki', location: 'Helsinki', flag: 'helsinki.jpg'),
    WorldTime(url: 'Europe/Istanbul', location: 'Istanbul', flag: 'turkish.jpg'),
    WorldTime(url: 'Europe/Kiev', location: 'Kiev', flag: 'kiev.jpg'),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'spain.jpg'),
    WorldTime(url: 'Europe/Monaco', location: 'Monaco', flag: 'monaco.jpg'),
    WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'italy.jpg'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'moscow.jpg'),
  ];

  void updateTime(index) async{
   WorldTime instance=locations[index];
   await instance.getTime();
   // navigate to home screen

    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime':instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose a location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                child: Card(
                  child: ListTile(
                    onTap: (){
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/${locations[index].flag}'),
                    ),
                  ),
                ),
              );
        },
      ),
    );
  }
}
