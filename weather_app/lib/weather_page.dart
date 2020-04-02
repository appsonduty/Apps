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
      appBar: AppBar(
        title: Text("WeatherApp", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: TextField(
              decoration: InputDecoration(labelText: "Location"),
              controller: _locationController,
            )),
            FloatingActionButton(
                onPressed: () => _enterLocation(context),
                child: Icon(Icons.search))
          ],
        ),
      ),
      
    );
  }
}
