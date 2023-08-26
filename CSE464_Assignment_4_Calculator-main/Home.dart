import 'package:calculator/widgets/button.dart';
import 'package:calculator/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  var input = '';
  var output = '';

  onButtonClick(value){
    if (value == 'c'){
      input = '';
      output = '';
    }
    else if(value == 'v'){
      input = input.substring(0, input.length -1);
    }
    else if (value == '='){
      var userInput = input;
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);

      output = finalValue.toString();
    }
    else {
      input = input + value ;
    }

    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(

        title: const Text("Calculator", style: TextStyle(color: Colors.white), ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,

      ),

      body: Column(

        children: [
          //.................Screen.......................

          Expanded(
            child: Container(
              width: double.infinity,
              color: AppColors.primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(input, style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                  Text(output,style: const TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),


          //...............................................Box..............................................

          Container(
            height: screenHeight * 0.5,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            decoration: const BoxDecoration(color: AppColors.boxColor),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button1(label:'v', textColor: AppColors.boxColor,onButtonPressed: onButtonClick,),
                    Button1(label:'c', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,),
                    Button1(label: 'x' , textColor: AppColors.boxColor, onButtonPressed: onButtonClick,),
                    Button1(label: '/', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,)
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button1(label:'(', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,),
                    Button1(label:')', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,),
                    Button1(label: '%', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,),
                    Button1(label: '*', textColor: AppColors.boxColor,onButtonPressed: onButtonClick,)
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button1(label:'1', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,),
                    Button1(label:'2', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,),
                    Button1(label: '3', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,),
                    Button1(label: '-', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,)
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button1(label:'4', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,),
                    Button1(label:'5', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,),
                    Button1(label: '6', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,),
                    Button1(label: '+', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,)
                  ],
                ),
                Row(
                  children: [
                     Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Button1(label:'7', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,),
                              Button1(label:'8', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,),
                              Button1(label: '9', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,)
                            ],
                          ),
                          SizedBox(height: 20,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Button1(label:'0', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,),
                              Button1(label:'00', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,),
                              Button1(label: '.', textColor: AppColors.boxColor, onButtonPressed: onButtonClick,)
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Container(
                      height: 160,
                      width: 70,
                      decoration: const BoxDecoration(
                        color: AppColors.buttonColor
                      ),
                      child: Button1(label: '=',textColor: AppColors.buttonColor, onButtonPressed: onButtonClick,),
                    )
                  ],
                )

              ],
            ),
          ),

        ],

      ),
    );
  }

}
