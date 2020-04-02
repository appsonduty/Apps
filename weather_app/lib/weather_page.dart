import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



// DONT CHANGE THIS VALUE \\

const String key = '584b551b7d043fbf6986ccaffddb9360';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _locationController = TextEditingController();

  Future<void> _enterLocation(BuildContext ctx) async {
    String cityName = _locationController.text;
    var decodedData;

    // final String cityName = _locationController.text;
    if(cityName.isNotEmpty)
    {
    try {
      
      http.Response response = await http.get(
          "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$key");
      
      if(response.body.isNotEmpty) {
      String data = response.body;
      decodedData = jsonDecode(data);
      // double temperature = decodedData['main']['temp'] - 273.15;
      }

    // EXTRACT WHATEVER DATA YOU NEED FROM HERE \\

      // return decodedData;
      // String weatherDescription = decodedData['weather'][0]['description'];
      
      // double minTemperature = decodedData['main']['temp_min'] - 273.15;
      // double maxTemperature = decodedData['main']['temp_min'] - 273.15;
      // String cityName = decodedData['name'];
      // print(cityName);
      // print(temperature);

    } catch (e) {
      print(e);
    }
    }
    else{
      return;
    }
    setState(() {
      showModalBottomSheet(
          context: ctx,
          builder: (_) {
            return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: Container(
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: MediaQuery.of(ctx).size.height * 0.5,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(decodedData['name'],
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Text(
                        decodedData['weather'][0]['description'],
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ("${(decodedData['main']['temp'] - 273.15).toStringAsFixed(2)}"),
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
          
    });
    // Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: Center(child: Text("Weather Up", style: TextStyle(color: Colors.white))),
      ),
      body: SingleChildScrollView(
        child: Column(

            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(

                 decoration: InputDecoration(labelText: 'Enter your Location',
                     labelStyle: TextStyle(color: Colors.blueGrey.shade800,
                     fontSize: 20
                     ),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.all(Radius.circular(12.0))
                     ),
                   
                      
                      ),
                   controller: _locationController,
              ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(150,0,0,0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Go!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue.shade900
                        ),
                      ),
                      SizedBox(width: 10,),
                      FloatingActionButton(
                          onPressed: () => _enterLocation(context),
                          child: Icon(Icons.wb_cloudy),),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Image.asset('images/Image1.png',
              width: 300,
              height: 250,
              ),

            ],
          ),
      ),
      );
      
  }
}
