import 'package:flutter/material.dart';
import 'package:bmi_calculator/pages/welcome.dart';

class MyButton extends StatefulWidget {
  int  num;
  String text;
  Color color;
  VoidCallback onAdd;
  VoidCallback onRemove;
   MyButton ({Key? key, required this.num,required this.text,required this.color, required this.onAdd,required this.onRemove}) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {



  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: const Color.fromRGBO(16, 17, 40, 1),
          child: Padding(
            padding: const EdgeInsets.only(top:20.0,left: 35,right: 35.0,bottom: 30.0),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(text: '${widget.text} : ', style: TextStyle(fontSize: 22,color: Colors.white),
                      children: [
                        TextSpan(text:'${widget.num}',style: TextStyle(fontSize: 20,color: widget.color),)
                      ]
                  ),

                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: widget.onAdd,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            color:widget.color,
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                      ),
                    ),
                   const  SizedBox(width: 10,),
                    GestureDetector(
                      onTap: widget.onRemove,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            color: widget.color,
                            child:const  Padding(
                              padding:  EdgeInsets.all(10.0),
                              child: Icon(Icons.remove),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}
