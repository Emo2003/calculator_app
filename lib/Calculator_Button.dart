import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CalculatorButton extends StatelessWidget {
 final String title;
 final Color backgroundColor;
  final Color textColor;
  final int flex;
  final bool isImage;
  final  Function(String) onTap;
  const CalculatorButton({super.key , required this.title ,
    this.backgroundColor= const Color(0xff303136),
    this .textColor=const Color(0xff29A8FF ),
    this.flex=1  , this.isImage=false,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Material(
          color: backgroundColor,
          borderRadius:  BorderRadius.circular(30),
          child: InkResponse(
          containedInkWell: true,
            borderRadius: BorderRadius.circular(30),
            onTap: (){onTap(title);},
            child: Container(
              height: double.infinity,
              margin: EdgeInsets.symmetric(
                  vertical: 11,
                  horizontal: 10
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16)
              ),
              child: isImage?
              Center(child: SvgPicture.asset("assets/images/delete.svg", height: 30,width: 30, fit: BoxFit.cover,)):
              Center(
                child: Text(title , style: TextStyle(fontSize:30 ,
                    fontWeight: FontWeight.w600,color: textColor ),
                  ),
              ),),
          ),
        ),
      ),
    );
  }
}
