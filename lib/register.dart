import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'otp.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();
  // final _formDialogKey = GlobalKey<FormState>();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController codeVerificationNumber = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  // ini adalah fungsi verify nomor phone
  void _verifyPhone() async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+62${phoneNumber.text.length > 11 ? phoneNumber.text.trim().substring(1) : phoneNumber.text.trim()}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        // masuk dengan kredentials
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        // beberapa handle error failed
        if (e.code == 'invalid-phone-number') {
          print('No Handphone kamu tidak valid!');
        }

        print(e);
      },
      codeSent: (String verificationId, int? resendToken) async {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Otp(verificationId: verificationId, phoneNumber: '+62${phoneNumber.text.length > 11 ? phoneNumber.text.trim().substring(1) : phoneNumber.text.trim()}')));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // 
      },
      timeout: const Duration(seconds: 60),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),

              // const SizedBox(height: 18),



              const SizedBox(height: 120),

              const Text(
                'Masukkan Nomor Telepon',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),



              const SizedBox(height: 38),

              Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children : [
                    Text(
                    'ID +62',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "No Hp tidak boleh kosong!";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          constraints: BoxConstraints.tightFor(width: 200.0),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black12),
                          //      borderRadius: BorderRadius.circular(0)),
                          // focusedBorder: OutlineInputBorder(
                          //     borderSide: const BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                          prefix: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),

                          ),
                          // suffixIcon: const Icon(
                          //   Icons.check_circle,
                          //   color: Colors.green,
                          //   size: 32,
                          // ),
                        ),
                        controller: phoneNumber,
                      ),
                  ]
                      ),

                      const SizedBox(height: 48),
                      const Text(
                        "Masukkan nomor telepon anda yang aktif tanpa menginput angka 0 atau +62 di awal nomor",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 100),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _verifyPhone();
                            }
                          },
                          style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Color.fromRGBO(
                                107, 114, 245, 0.6),),
                            shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(14.0),
                            child: Text(
                              'Dapatkan OTP',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),

    );
  }
}
