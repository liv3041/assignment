import 'package:flutter/material.dart';
import 'package:liveasy/controllers/auth_service.dart';
import 'package:liveasy/mobile_number_page.dart';
import 'package:liveasy/profile_selection.dart';
import 'package:pinput/pinput.dart';

class VerifyNumberPage extends StatefulWidget{
  String phoneNumber;
  VerifyNumberPage({Key? key, required this.phoneNumber}) : super(key:key);


  @override
  State<VerifyNumberPage> createState() => _VerifyNumberPage();
}

class _VerifyNumberPage extends State<VerifyNumberPage>{
  final TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black
      ),
      decoration:  BoxDecoration(
        color: const Color(0xFF93D2F3),
        borderRadius: BorderRadius.circular(0),
        border: Border.all(color: Colors.transparent)
      )
    );
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 45,left: 16),
                  child: InkWell(
                    child:Image.asset('assets/images/back.png',height: 15,width: 15,),
                    onTap: (){
                      Navigator.pop(context, MaterialPageRoute(builder: (context) => const MobileNumberPage()));
                    },
                  )
              ),
              const Padding(
                padding: EdgeInsets.only(top: 65),
                child: Center(
                  child: Text('Verify Phone',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto-Regular',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 20),
                  child :Center(
                    child:RichText(
                      textAlign: TextAlign.center ,
                      text:  TextSpan(
                        style:const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto-Regular',
                            color: Color(0xFF6A6C7B)
                        ) ,
                        children: [
                          const TextSpan(text: 'Code is sent to '),
                          TextSpan(text: widget.phoneNumber)
                        ],
                      ),
                    ),
                  )
              ),
              Center(
                child: Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: const Color(0xFF93D2F3))
                      )
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 20),
                  child :Center(
                    child:RichText(
                      textAlign: TextAlign.center ,
                      text:  const TextSpan(
                        style:TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto-Regular',
                            color: Color(0xFF6A6C7B)
                        ) ,
                        children: [
                          TextSpan(text: 'Didn\u0027t receive the code?',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF6A6C7B)
                              )),
                          TextSpan(text: ' Request Again',
                          style: TextStyle(
                            fontSize: 14,
                              color: Color(0xFF061D28)
                          ),
                          )
                        ],
                      ),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E3B62),
                        fixedSize: const Size(327, 48),
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)
                        )
                    ),
                    onPressed: (){


                      AuthService.loginWithOtp(otp: otpController.text).then((value){
                        if(value=="Success"){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSelectionPage()));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error logging in with otp.",style: TextStyle(color: Colors.black),), backgroundColor: Colors.white,));
                        }
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSelectionPage()));
                      });



                    }, child:  Text('VERIFY AND CONTINUE',textWidthBasis: TextWidthBasis.parent ,
                      style: TextStyle(color: Colors.white,
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 16)

                  ),
                  ),
                ),
              )
              ],
        ),
      ),
    );
  }
}