import 'package:calculator_app/Calculator_Button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}
class HomePageState extends State<HomePage>{
  String resultText="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff17181A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("$savedNumber $savedOperator", style: TextStyle(fontWeight: FontWeight.w500,
                            fontSize:25, color: Colors.grey),),

                        Text(resultText, style: TextStyle(fontWeight: FontWeight.w500,
                            fontSize:48 , color: Color(0xffFFFFFF)),),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex:   3,
                  child: Column(

                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            CalculatorButton(
                              onTap:DeleteOperator,
                              title: "Ac" ,
                              backgroundColor: Color(0xff616161),
                              textColor: Colors.white,),
                            CalculatorButton(
                              onTap:DeleteDigit,
                              title: "" ,
                              isImage: true,
                              backgroundColor: Color(0xff616161),
                              textColor: Colors.white,),
                            CalculatorButton(
                              onTap:OperatorAaction,
                              title: "/" ,
                              backgroundColor: Color(0xff005DB2),
                              textColor: Colors.white,),
                            CalculatorButton(
                              onTap:OperatorAaction,

                              title: "x" ,
                              backgroundColor: Color(0xff005DB2),
                              textColor: Colors.white,)



                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            CalculatorButton(
                                onTap:NumberOperator,

                                title: "7" ),
                            CalculatorButton(
                              onTap:NumberOperator,

                              title: "8" ,),
                            CalculatorButton(
                              onTap:NumberOperator,

                              title: "9" ,),
                            CalculatorButton(
                              onTap:OperatorAaction,

                              title: "-" ,
                              backgroundColor: Color(0xff005DB2),
                              textColor: Colors.white,)
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      CalculatorButton(
                                        onTap:NumberOperator,

                                        title: "4" ,),
                                      CalculatorButton(
                                        onTap:NumberOperator,

                                        title: "5" ,
                                      ),
                                      CalculatorButton(
                                        onTap:NumberOperator,

                                        title: "6" ,),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      CalculatorButton(
                                        onTap:NumberOperator,

                                        title: "1" ,
                                      ),
                                      CalculatorButton(
                                        onTap:NumberOperator,

                                        title: "2" ,
                                      ),
                                      CalculatorButton(
                                        onTap:NumberOperator,
                                        title: "3" ,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      CalculatorButton(
                                        onTap:NumberOperator,
                                        title: "0" , flex: 2,
                                      ),
                                      CalculatorButton(
                                        onTap:NumberOperator,
                                        title: "." ,
                                      ),




                                    ],
                                  ),
                                ),
                              ],),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(children: [
                                CalculatorButton(
                                  onTap:OperatorAaction,

                                  title: "+" , backgroundColor: Color(0xff005DB2),
                                  textColor: Colors.white,),
                                CalculatorButton(
                                  onTap:EqualOperator,
                                  title: "=" ,  backgroundColor: Color(0xff29A8FF),
                                  textColor: Colors.white, )
                              ],),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  String savedNumber="";
  String savedOperator="";
NumberOperator(String digit){
  if(digit=="."){
    if(!resultText.contains(".")){
      setState(() {
        resultText+=digit;
      });
    }
  }
  else{
    setState(() {
      resultText+=digit;
    });}
}
OperatorAaction(String operator){
    if(savedNumber.isEmpty){
     setState(() {
       savedNumber=resultText;
       savedOperator=operator;
       resultText="";
     });
    }
    else{
      String rhs=resultText;
    double resultCalculate= Calculation(double.parse(savedNumber),double.parse(rhs) , savedOperator);
      setState(() {
        savedNumber=resultCalculate.toString();
        savedOperator=operator;
        resultText="";
      });
    }
}
double Calculation(double lhs , double rhs , String operator){
 switch (operator){
   case "+":
     return lhs+rhs;
   case "-":
     return lhs-rhs;
   case "x":
     return lhs*rhs;
   default:
     return lhs/rhs;

 }
 }
 EqualOperator(String operator){
  if(savedNumber.isNotEmpty){
    if(resultText.isEmpty){
   setState(() {
     resultText=savedNumber;
     savedNumber="";
     savedOperator="";
   });
  }
  else{
    String rhs=resultText;
    double resultCalculate= Calculation(double.parse(savedNumber),double.parse(rhs) , savedOperator);
    setState(() {
      resultText=resultCalculate.toString();
      savedOperator="";
      savedNumber="";
    });
  }}
 }
 DeleteOperator(String operator){
  setState(() {
    savedNumber="";
    savedOperator="";
    resultText="";
  });
 }
 DeleteDigit(String operator){
  setState(() {
    int result = int.parse(resultText)~/10;
    resultText=result.toString();
  });
 }

}