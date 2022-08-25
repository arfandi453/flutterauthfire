import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  const Otp({Key?key, required this.verificationId, required this.phoneNumber}) : super(key: key);

  final String verificationId;
  final String phoneNumber;

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController otpNumber = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  // ini adalah fungsi verify nomor phone
  void _verifyPhone() async {
    await auth.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Otp(verificationId: verificationId, phoneNumber: widget.phoneNumber)));
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

              const SizedBox(
                height: 50,
              ),


              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/illustration-3.png',
                ),
              ),

              const SizedBox(
                height: 28,
              ),

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
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "No Hp tidak Boleh kosong!";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        controller: otpNumber,
                      ),

                      const SizedBox(height: 22),

                      const Text(
                        "Kode OTP berlaku dalam waktu 30 detik Ada Kendala OTP ? Hubungi Di Sini",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async{
                            if (_formKey.currentState!.validate()) {
                              String smsCode = otpNumber.text.trim();

                              PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: smsCode);

                              await auth.signInWithCredential(credential).then((value) => {
                                Navigator.of(context).pop()
                              });
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
                              'Verifikasi',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),


              const SizedBox(
                height: 18,
              ),
              TextButton(
                onPressed: () async {
                  _verifyPhone();

                },
                child: Text('Kirim Ulang Kode',
                style: TextStyle(
                  color: Colors.deepPurpleAccent)),
              ),
            ],
          ),

      ),
    );
  }

  Widget _textFieldOTP({first, last}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.purple),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}