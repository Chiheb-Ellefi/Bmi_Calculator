import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/button.dart';
import 'package:bmi_calculator/pages/calculate.dart';


class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  double bmi=0;
  bool male=true;
  double _currentValue=1;
  int age=0;
  int weight=0;
  Color color=Colors.white;
  void _addAge(){
    setState(() {
      age++;
    });

  }


  void _removeAge(){
    setState(() {
      if(age>0){
        age--;

      }
  });}
        void _addWeight(){
      setState(() {
        weight++;
      });

    }


    void _removeWeight(){
      setState(() {
        if(weight>0) {
          weight--;
        }});
      }
  void _male(){
    setState(() {
      male=true;
      color=Colors.blue;
    });
  }
  void _female(){
    setState(() {
      male=false;
      color=Colors.pink;
    });
  }


  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: const Color.fromRGBO(16, 17, 40,.7) ,
            appBar: AppBar(
              title:Text('BMI Calculator',style: TextStyle(fontSize: 30),) ,
              centerTitle: true,
              backgroundColor:Color.fromRGBO(16, 17, 40, 1)  ,
              elevation: 0,
            ),
            body:Column(
              children: [
                Expanded(
                    child: Center(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top:30),
                            child: GestureDetector(
                              onTap: _female,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                    width: 180,
                                    height: 180,
                                    color: Color.fromRGBO(16, 17, 40, 1) ,
                                    padding: EdgeInsets.all(20),
                                    child: const Center(
                                      child: Icon(
                                          Icons.female,
                                        color: Colors.pink,
                                        size: 120,
                                      ),
                                    ),
                                  )
                              ),
                            )
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: GestureDetector(
                              onTap: _male,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(

                                    width: 180,
                                    height: 180,
                                    color: const Color.fromRGBO(16, 17, 40, 1) ,
                                    padding:const  EdgeInsets.all(20),
                                    child:const  Center(
                                      child: Icon(
                                        Icons.male,
                                        color: Colors.blue,
                                        size: 120,
                                      ),
                                    ),
                                  )
                              ),
                            )
                        ),
                      ],
                    ),
          ),),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  flex: 2,
                    child: Container(
                      child: Center(
                        child: Padding(
                            padding:const EdgeInsets.all(10),
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    color: const Color.fromRGBO(16, 17, 40, 1) ,
                                    child:Padding(padding: EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                           Padding(
                                             padding: const EdgeInsets.all(10.0),
                                             child: RichText(
                                                text: TextSpan(text: 'Height : ', style: TextStyle(fontSize: 32,color: Colors.white),
                                                  children: [
                                                    TextSpan(text:'${_currentValue.toInt()}',style: TextStyle(fontSize: 30,color: color),)
                                                  ]
                                                ),

                                          ),
                                           ),

                                          Slider(
                                              min: 1,
                                              activeColor: color,
                                              max: 200,
                                              value: _currentValue, onChanged:(value){
                                            setState(() {
                                              _currentValue=value;
                                            });
                                          } ),
                                        ],
                                      )
                                    ),
                                  ),
                                ),SizedBox(height: 40,),
                                Row(
                                  children: [
                                    MyButton(text: 'Age',num:age,color:color, onAdd: _addAge,onRemove: _removeAge,),
                                    SizedBox(width: 10,),
                                    MyButton(text: 'Weight',num:weight,color: color,onAdd: _addWeight,onRemove: _removeWeight),
                                  ],
                                )
                              ],
                            ),
                        ),
                      ),
                    )),
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top:20,bottom: 60),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                              bmi=(weight/pow(_currentValue/100,2));
                          });
                          Navigator.of(context).push( MaterialPageRoute(builder: (context)=>Bmi(
                            age: age,
                            bmi: bmi,
                            male: male,
                            color:color,
                            height: _currentValue.toInt(),
                          )));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 350,
                          height: 100,
                          color:const Color.fromRGBO(16, 17, 40, 1)  ,
                          child:const  Padding(
                            padding:  EdgeInsets.all(10.0),
                            child:  Center(
                                child: Text(
                                    'Calculate',
                                  style: TextStyle(fontSize: 35,color:Colors.white),
                                )
                            ),
                          ),
                        ),
                        ),
                      ),
                    )),
              ],
            ),
          );
        }
      ),
    );
  }
}
