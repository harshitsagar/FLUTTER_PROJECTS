import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController = TextEditingController() ;
  var ftController = TextEditingController() ;
  var inController = TextEditingController() ;

  var result = "" ;
  var bgColor = Colors.green.shade200 ;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
       
        title: Text('BMI APP'),
      ),
      
      body: Container(

          color: bgColor ,

        child: Column(

          children: [

            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text('Body Mass Index (BMI)' , style: TextStyle(fontSize: 35 , fontWeight: FontWeight.w700 , color: Colors.white),),
            ),

            SizedBox(height: 31,),

            Container(

                width: 250,

                child: Image.asset('assets/images/img.jpg')

            ),

            SizedBox(height: 31,),

            Center(

              child: Container(

                  width: 320,

                child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                      TextField(

                        controller: wtController ,
                        style: TextStyle(color: Colors.white , fontSize: 20),

                        decoration: InputDecoration(

                          label: Text('Enter your weight (in kgs)' , style: TextStyle(fontSize: 24 , color: Colors.white),),
                          prefixIcon: Icon(Icons.line_weight , color: Colors.white,),

                        ) ,

                        keyboardType: TextInputType.number ,

                      ),

                      SizedBox(height: 11,),

                      TextField(

                        controller: ftController ,
                        style: TextStyle(color: Colors.white , fontSize: 20),

                        decoration: InputDecoration(

                          label: Text('Enter your Height (in Feet)', style: TextStyle(fontSize: 23 , color: Colors.white),),
                          prefixIcon: Icon(Icons.height , color: Colors.white,),
                        ) ,

                        keyboardType: TextInputType.number ,

                      ),

                      SizedBox(height: 11,),

                      TextField(

                        controller: inController ,
                        style: TextStyle(color: Colors.white , fontSize: 20),

                        decoration: InputDecoration(

                          label: Text('Enter your Height (in inch)' , style: TextStyle(fontSize: 22 , color: Colors.white),),
                          prefixIcon: Icon(Icons.height , color: Colors.white,),
                        ) ,

                        keyboardType: TextInputType.number ,

                      ),

                      SizedBox(height: 33,),

                      ElevatedButton(onPressed: (){

                         var wt = wtController.text.toString() ;
                         var ft = ftController.text.toString() ;
                         var inch = inController.text.toString() ;

                         if(wt!="" && ft!="" && inch!=""){

                           // BMI calculations .

                            var iwt = int.parse(wt) ;
                            var ift = int.parse(ft) ;
                            var iInch = int.parse(inch) ;

                            var tInch = (ift*12) + iInch ;
                            var tcm = tInch*2.54 ;
                            var tm = tcm/100 ;

                            var bmi = iwt/(tm*tm) ;

                            var msg = "" ;

                              setState(() {

                                if(bmi>25){

                                  msg = "You're OverWeight !!!" ;
                                  bgColor = Colors.orange.shade200 ;

                                }

                                else if(bmi<18) {

                                  msg = "You're UnderWeight !!!" ;
                                  bgColor = Colors.red.shade300 ;
                                }

                                else{

                                  msg = "You're Healthy !!!" ;
                                  bgColor = Colors.green.shade200 ;
                                }

                              result = "$msg \n Your BMI is : ${bmi.toStringAsFixed(4)}" ;

                            });

                         }

                         else {

                            setState(() {

                              result = "Please fill all the required blanks !!!" ;

                            });

                         }


                      } , child: Text('Calculate' , style: TextStyle(fontSize: 25),)),

                      SizedBox(height: 33,),

                      Text(result , style: TextStyle(fontSize: 25 , color: Colors.white),)


                    ],


                ),
              ),
            ),
          ],
        ),
      )
        
        
    );
  }
}
