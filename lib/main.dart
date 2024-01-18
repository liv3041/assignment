import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/firebase_options.dart';
import 'package:liveasy/mobile_number_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const MyHomePage(title: '',),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownValue = 'English';
  int _counter = 0;
  var options = ['English', 'Hindi','Italian'];
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
          child:Column(
            children:[
              Padding(
                padding: const EdgeInsets.only(top: 128),
                child: Image.asset('assets/images/image.png',width: 56,height: 56,),
              ),
            const Padding(
                padding: EdgeInsets.only(top: 65),
                 child: Text('Please select your Language',
                   style: TextStyle(
                     fontSize: 20,
                     fontFamily: 'Roboto-Regular',
                     fontWeight: FontWeight.bold
                   ),),
            ),
             Padding(
               padding: const EdgeInsets.only(top: 10,bottom: 20),
               child:RichText(
                 textAlign: TextAlign.center ,
                 text: const TextSpan(
                   style:TextStyle(
                     fontSize: 14,
                     fontFamily: 'Roboto-Regular',
                     color: Color(0xFF6A6C7B)
                   ) ,
                   children: [
                     TextSpan(text: 'You can change the language\n'),
                     TextSpan(text: 'at any time.')
                   ],
                 ),
               ),
             ),
              Container(
                width: 216,
                height: 48,
                // padding: const EdgeInsets.only(top: 65),
                decoration: BoxDecoration(

                  border: Border.all(
                    color: const Color(0xFF2F3037),
                    width: 1
                  ),
                ),
                child:DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 0,
                    style: const TextStyle(color: Color(0xFF2F3037)),
                    onChanged:(String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    itemHeight: 48,
                    items: options.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child:SizedBox(width: 180, child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                            child: Text(value))  ) ,
                      );
                    }).toList(),
                  ),
                ),

              ),
             Padding(
                 padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E3B62),
                      fixedSize: const Size(216, 48),
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)
                      )
                    ),
                 onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context) => MobileNumberPage()));
                 }, child: const Text('NEXT',
                  style: TextStyle(color: Colors.white,
                  fontFamily: 'Montserrat-Regular',
                  fontSize: 16),
                  )
                  )
             ) ,
            ] ,
          )
      ),
    
    );
  }
}
