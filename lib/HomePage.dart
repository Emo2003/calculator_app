import 'package:flutter/material.dart';

import 'Calculator_Button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
   String resultText="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff17181A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("$savedNumber $savedOperator",
                      style: TextStyle(fontSize:24
                          , fontWeight: FontWeight.w400 ,
                          color: Colors.grey) ),
                      Text(resultText,
                        style: TextStyle(fontSize: 48
                            , fontWeight: FontWeight.w500 ,
                          color: Color(0xffFFFFFF)),)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                         CalculatorButton(title: "Ac", backgroundColor: Color(0xff616161),
                           textColor: Colors.white,
                         onTap: OnDeleteOperator,),
                          CalculatorButton(title: "",
                          backgroundColor:Color(0xff616161) ,
                          textColor: Colors.white,
                          onTap:OnDeleteDigit , isImage: true,),
                          CalculatorButton(title: "/", onTap: OnClickedOperator,
                          backgroundColor: Color(0xff005DB2), textColor: Color(0xffFFFFFF)),
                          CalculatorButton(title: "x" ,onTap: OnClickedOperator,
                              backgroundColor: Color(0xff005DB2) ,
                            textColor: Color(0xffFFFFFF),)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          CalculatorButton(title: "7",
                          onTap: OnDigitOperator,),
                          CalculatorButton(title: "8", onTap:OnDigitOperator ,),
                          CalculatorButton(title: "9", onTap: OnDigitOperator,),
                          CalculatorButton(title: "-",onTap: OnClickedOperator,
                              backgroundColor: Color(0xff005DB2), textColor: Color(0xffFFFFFF))
                        ],
                      ),
                    ),
                   Expanded(
                     flex: 3,
                     child: Row(
                       children: [
                         Expanded(
                           flex: 3,
                           child: Column(
                             children: [
                               Expanded(
                                 child: Row(
                                   children: [CalculatorButton(title: "4",onTap:OnDigitOperator ,),
                                     CalculatorButton(title: "5",onTap:OnDigitOperator),
                                     CalculatorButton(title: "6",onTap:OnDigitOperator),],
                                 ),
                               ),
                               Expanded(
                                 child: Row(
                                   children: [CalculatorButton(title: "1",onTap:OnDigitOperator),
                                     CalculatorButton(title: "2",onTap:OnDigitOperator),
                                     CalculatorButton(title: "3",onTap:OnDigitOperator),],
                                 ),
                               ),
                               Expanded(
                                 child: Row(
                                   children: [CalculatorButton(title: "0",onTap:OnDigitOperator , flex: 2,),
                                     CalculatorButton(title: ".",onTap:OnDigitOperator),],
                                 ),
                               ),
                             ],
                           ),
                         ),
                         Expanded(
                           flex: 1,
                           child: Column(
                             children: [
                               CalculatorButton(title: "+",onTap:OnClickedOperator,
                               backgroundColor: Color(0xff005DB2), textColor: Color(0xffFFFFFF),),
                               CalculatorButton(title: "=",onTap:OnEqualOperator,
                                   backgroundColor: Color(0xff29A8FF), textColor: Color(0xffFFFFFF))
                             ],
                           ),
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
    );
  }
String savedNumber="";
  String savedOperator="";
   void OnDigitOperator(String digit) {
     setState(() {
       if (digit == ".") {
         if (!resultText.contains(".")) {
           resultText += digit;
         }
       } else {
         if (resultText == "0") {
           resultText = digit;
         } else {
           resultText += digit;
         }
       }
     });
   }
  OnClickedOperator(String operator){
    if(savedNumber.isEmpty){
     setState(() {
       savedNumber=resultText;
       savedOperator=operator;
       resultText="";
     });
    }
    else{
      double rhs=double.parse(resultText);
      double resultCalculate=Calculation(double.parse(savedNumber), rhs, savedOperator);
     setState(() {
       savedNumber=resultCalculate.toString();
       savedOperator=operator;
      resultText="";
     });
    }
  }
 double Calculation(double lhs , double rhs, String operator){
    switch (operator){
      case "+":
        return lhs+rhs;
      case "-":
        return lhs-rhs;
      case "x":
        return lhs*rhs;
      default :
        return lhs/rhs;
    }
 }
 OnEqualOperator(String operator){
    if(savedNumber.isNotEmpty){
      if(resultText.isEmpty){
      setState(() {
        resultText=savedNumber;
        savedOperator="";
        savedNumber="";
      });
      }
      else{
        double rhs=double.parse(resultText);
        double resultCalculate=Calculation(double.parse(savedNumber), rhs, savedOperator);
        setState(() {
          savedNumber="";
          savedOperator="";
          resultText=resultCalculate.toString();
        });

      }
    }
 }
 OnDeleteOperator(String operator){
    setState(() {
      resultText="";
      savedNumber="";
      savedOperator="";
    });
 }
    OnDeleteDigit(String operator) {
     setState(() {
       if(savedNumber.isEmpty){
       if (resultText.length <= 1) {
         resultText = '0';
         return;
       }}
       resultText = resultText.substring(0, resultText.length - 1);

       if (resultText.endsWith('.')) {
         resultText = resultText.substring(0, resultText.length - 1);

       }
     });
   }

}
