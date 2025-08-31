import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CalculatorButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final int flex;
  final bool isImage;
  final void Function(String )onTap;
  const CalculatorButton({super.key , required this.title,
    this.backgroundColor= const Color(0xff303136),
    this.textColor= const Color(0xff29A8FF),
    this.flex=1 , required this.onTap , this.isImage=false});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor,
          child: InkResponse(
            onTap: (){
              onTap(title);
            },
            containedInkWell: true,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              margin: EdgeInsets.symmetric(
                  vertical: 11,
                  horizontal: 10
              ),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: isImage? Center(child: SvgPicture.asset("assets/images/delete.svg" ))
                  :Center(
                child: Text(title ,
                  style: TextStyle(fontSize:27,
                      fontWeight: FontWeight.w600  , color: textColor),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}