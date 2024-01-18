import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileSelectionPage extends StatefulWidget{
  const ProfileSelectionPage({super.key});
  @override
  State<ProfileSelectionPage> createState() => _ProfileSelectionPage();
}

class _ProfileSelectionPage extends State<ProfileSelectionPage>{
  int? selectedValue = 0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 230),
                child: Center(
                  child: Text('Please select your profile.',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto-Regular',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 28),
             child:Container(
                width: 328,
                height: 89,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(color: Colors.black,
                      width: 1.0),
                ),
                child: Row(
                  children: [
                    Radio(value: 1, groupValue: selectedValue,
                        activeColor: Color(0xFF2E3B62),
                        onChanged: (value){
                          setState(() {
                            selectedValue = value;
                          });
                    }),
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset('assets/images/warehouse.png',width: 50,height: 50,),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        const Padding(
                          padding: EdgeInsets.only(top: 10,left: 20),
                          child: Text('Shipper',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Roboto-Regular',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3,left: 20),
                          child:RichText(
                            textAlign: TextAlign.left ,
                            text: const TextSpan(
                              style:TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Roboto-Regular',
                                  color: Color(0xFF6A6C7B)
                              ) ,
                              children: [
                                TextSpan(text: 'Lorem ipsum dolor sit amet,\n'),
                                TextSpan(text: 'consectetur adipiscing\n')
                              ],
                            ),
                          ),
                        )
                      ]


                    ),



                  ],
                ),
              ),
             ),
              Padding(padding: EdgeInsets.only(top: 28),
                child:Container(
                  width: 328,
                  height: 89,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    border: Border.all(color: Colors.black,
                        width: 1.0),
                  ),
                  child: Row(
                    children: [
                      Radio(value: 2, groupValue: selectedValue,
                          activeColor: Color(0xFF2E3B62),
                          onChanged: (value){
                              setState(() {
                                selectedValue = value;
                              });
                          }),
                      Container(
                        width: 50,
                        height: 50,
                        child: Image.asset('assets/images/transporter.png',width: 50,height: 50,),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            const Padding(
                              padding: EdgeInsets.only(top: 10,left: 20),
                              child: Text('Transporter',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Roboto-Regular',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3,left: 20),
                              child:RichText(
                                textAlign: TextAlign.left ,
                                text: const TextSpan(
                                  style:TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Roboto-Regular',
                                      color: Color(0xFF6A6C7B)
                                  ) ,
                                  children: [
                                    TextSpan(text: 'Lorem ipsum dolor sit amet,\n'),
                                    TextSpan(text: 'consectetur adipiscing\n')
                                  ],
                                ),
                              ),
                            )
                          ]


                      ),



                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2E3B62),
                          fixedSize: const Size(328, 56),
                          padding: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)
                          )
                      ),
                      onPressed: (){

                      }, child: const Text('CONTINUE',
                    style: TextStyle(color: Colors.white,
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 16),))
              )
            ],
          ),
        ),
      ),
    );
  }
}