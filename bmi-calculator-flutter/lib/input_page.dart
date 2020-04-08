import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resuable_widget.dart';
import 'Icon_content.dart';
import 'constants.dart';
import 'results.dart';
import 'Button.dart';
import 'bmifunction.dart';



enum Gender { male, female }

class InputPage extends StatefulWidget {



  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedgender;
  int height=180;
  int weight = 72;
  int age =20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusable(
                    onpress: () {
                      setState(() {
                        selectedgender=Gender.male;
                      });
                    },


                    colour: selectedgender == Gender.male
                        ? Kcontainercolour
                        : Kinactivecolour,
                    cardchild: Childclass(
                        childcolour: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: Reusable(
                    onpress: () {

                      setState(() {
                        selectedgender=Gender.female;
                      });

                    } ,
                    colour: selectedgender == Gender.female
                        ? Kcontainercolour
                        : Kinactivecolour,
                    cardchild: Childclass(
                      childcolour: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusable(

              colour: Kcontainercolour,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT',
                  style: Klabelstyle,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(),
                      style: KNumberstyle,
                      ),
                      Text('cm',
                      style: Klabelstyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      thumbColor: Colors.redAccent

                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 110,
                      max: 220,
                      activeColor: Color(0xFFEb15555),
                      inactiveColor: Colors.white,
                      onChanged: (double newvalue) {
                        setState(() {
                          height=newvalue.round();
                        });
                      },


                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusable(
                    colour: Kcontainercolour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(  'WEIGHT',
                        style: Klabelstyle,
                        ),
                        Text( weight.toString() ,
                          style: KNumberstyle,
                        ),

                        Row(
                          mainAxisAlignment:  MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.plus,

                              onPressed: () {

                              setState(() {
                                weight++;
                              });
                              },

                            ),


                            SizedBox(width: 30,),

                            RoundIconButton(icon: FontAwesomeIcons.minus,

                              onPressed: () {

                                setState(() {
                                  weight--;
                                });
                              },

                            ),
                          ],
                        )



                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable(
                    colour: Kcontainercolour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Text(  'AGE',
                          style: Klabelstyle,
                        ),
                        Text( age.toString() ,
                          style: KNumberstyle,
                        ),

                        Row(
                          mainAxisAlignment:  MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.plus,

                              onPressed: () {

                                setState(() {
                                  age++;
                                });
                              },

                            ),


                            SizedBox(width: 30,),

                            RoundIconButton(icon: FontAwesomeIcons.minus,

                              onPressed: () {

                                setState(() {
                                  age--;
                                });
                              },

                            ),
                          ],
                        )



                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Bottombutton(calc: 'CALCULATE',
            ontap: () {
             Bmifinder calcend = Bmifinder(height: height,weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(

                    bmiend1: calcend.finalBmi(),
                    bmiend2: calcend.Status(),
                    bmiend3: calcend.getResult(),
                  ),
                ),
              );

            },
          ),
        ],
      ),
    );
  }
}


