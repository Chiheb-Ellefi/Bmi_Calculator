import 'package:flutter/material.dart';
import 'dart:math';
import 'package:bmi_calculator/pages/welcome.dart';

class Bmi extends StatefulWidget {
   Bmi({Key? key,required this.age,required this.bmi,required this.male,required this.color,required this.height}) : super(key: key);
int age;
int height;
bool male;
Color color=Color.fromRGBO(101, 126,121,0.3);
double bmi=0;

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
String state ='';

num wmin=0;
num wmax=0;
  @override
  void initState() {
    if(widget.bmi<18.5){
      state='Underweight';
    }
    else if(widget.bmi>=18.5 && widget.bmi<25.0){
      state='Healthy';

    }
    else if(widget.bmi>=25 && widget.bmi<30.0){
      state='Overweight';

    }
    else{
      state='Obese';
    }
    wmin=pow(widget.height/100,2)*18.5;
    wmax=pow(widget.height/100,2)*25;
    super.initState();
  }
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Color.fromRGBO(16, 17, 40,.7),
        child: Padding(
          padding: EdgeInsets.only(top:40.0),
          child:  Column(
            children: [
              SizedBox(height: 50,),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Your Body Mass Index (BMI) is : ',
                  style: TextStyle(
                      fontSize: 30 ,
                      color: Colors.white,
                      letterSpacing: 2),),
              ),
              SizedBox(height: 15,),
              Text('${widget.bmi.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 40,color: widget.color),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child:  RichText(text: TextSpan(
                    text: 'According to your inputs, your weight is in the ',
                    style: TextStyle(fontSize: 30),
                    children: [
                      TextSpan(text: state,style: TextStyle(fontSize: 35,color: widget.color)),
                      TextSpan(text: ' category .',style: TextStyle(fontSize: 30)),

                    ]
                ),

                )
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: RichText(text: TextSpan(
                  text: 'For your height, a healthy weight would be between ',
                    style: TextStyle(fontSize: 30),
                  children: [
                    TextSpan(text: '${wmin.toStringAsFixed(0)}',style: TextStyle(fontSize: 35,color: widget.color)),
                    TextSpan(text: ' & ',style: TextStyle(fontSize: 30)),
                    TextSpan(text: '${wmax.toStringAsFixed(0)} ',style: TextStyle(fontSize: 35,color: widget.color)),
                    TextSpan(text: 'kilograms.',style: TextStyle(fontSize: 30,color: Colors.white)),
                  ]
                ),

                )
              ),
              SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.only(top:30,bottom: 50),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
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
                            'Recalculate',
                            style: TextStyle(fontSize: 35,color:Colors.white),
                          )
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ],

          ),

        ),
      ),
    );
  }
}
