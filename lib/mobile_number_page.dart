import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/controllers/auth_service.dart';
import 'package:liveasy/main.dart';
import 'package:liveasy/verify_number.dart';

class MobileNumberPage extends StatefulWidget{
  const MobileNumberPage({super.key});
  @override
  State<MobileNumberPage> createState() => _MobileNumberPage();


}

class _MobileNumberPage extends State<MobileNumberPage>{

  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Country selectedCountry = Country(phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key: "",);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 45,left: 16),
                child: InkWell(
                  child:Image.asset('assets/images/cancel.png',height: 15,width: 15,),
                  onTap: (){
                    Navigator.pop(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: '',)));
                  },
              )
            ),
            const Padding(
              padding: EdgeInsets.only(top: 65),
              child: Center(
                 child: Text('Please enter your mobile number',
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
                 text: const TextSpan(
                   style:TextStyle(
                       fontSize: 14,
                       fontFamily: 'Roboto-Regular',
                       color: Color(0xFF6A6C7B)
                   ) ,
                   children: [
                     TextSpan(text: 'You\u0027s recieve a 4 digit code\n'),
                     TextSpan(text: 'to verify next')
                   ],
                 ),
               ),
             )
            ),
            Padding(padding: const EdgeInsets.only (top:20),
                  child:Center(
                    child:SizedBox(
                      width: 327,
                      height: 48,
                      child: Center(
                        child: Form(
                          key: _formKey,
                          child:TextFormField(
                            keyboardType: TextInputType.phone,
                            keyboardAppearance: Brightness.light,
                            cursorColor: Colors.black,
                            controller: phoneController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(top: 2),
                              hintText: 'Mobile Number',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: const BorderSide(color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: const BorderSide(color: Colors.black),
                              ),
                              prefixIcon: Container(
                                padding: const EdgeInsets.only(top: 12,left: 10),
                                child: InkWell(
                                  onTap: (){
                                    showCountryPicker(context: context,
                                        countryListTheme:const CountryListThemeData(
                                          bottomSheetHeight: 550,
                                        ),
                                        onSelect:(value){
                                          setState(() {
                                            selectedCountry= value;
                                          });
                                        });
                                  },
                                  child: Text(
                                    "${selectedCountry.flagEmoji}    + ${selectedCountry.phoneCode}  -  ",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ) ,
                                  ),
                                ),
                              ),
                            ),
                          validator: (value){
                              value!.length!=10?ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Enter valid phone number.",style: TextStyle(color: Colors.black),), backgroundColor: Colors.white,)):  Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>  VerifyNumberPage(phoneNumber: phoneController.text,))
                              );
                              return null;

                          },
                          ) ,

                     ),
                      ),
                    ),

                  ),
                ),
            Padding(
                padding: const EdgeInsets.only(top: 20),
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
                      if(_formKey.currentState!.validate()) {
                        AuthService.sentOtp(phone: phoneController.text,
                            errorStep: () =>
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(content: Text(
                                    "Error sending OTP",
                                    style: TextStyle(color: Colors.black)),
                                  backgroundColor: Colors.white,)),
                            nextStep: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>  VerifyNumberPage(phoneNumber: phoneController.text))
                              );

                            }


                        );

                      }


                       }, child: const Text('CONTINUE',
                     style: TextStyle(color: Colors.white,
                         fontFamily: 'Montserrat-Regular',
                         fontSize: 16)
                   ),
                   ),
               ),
            ) ,

          ],
        ),
      ),
    );
  }
}