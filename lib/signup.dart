
import 'package:flutter/material.dart';
import 'package:phone_otp/login.dart';
import 'package:phone_otp/register.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _secureText = true;

  void _passwordShow() {
    setState(() {
      _secureText = !_secureText;
    });
  }
  // controller text field
  TextEditingController firstName = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 50),
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
                    const SizedBox(height: 70),
                    const Text(
                      'Daftar Ke Akun Kamu',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Container(
                    //   child: Stack(
                    //     children: <Widget>[
                    //       Positioned(
                    //         child:  Container(
                    //           child: Center(
                    //             child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                    //           ),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),

                    Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                    children: [

                                      Row(
                                        children: [
                                          TextField(
                                            controller: firstName,
                                            decoration: InputDecoration(
                                                constraints: BoxConstraints.tightFor(width: 120.0),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(color: Colors.black12),
                                                    borderRadius: BorderRadius.circular(10)),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(color: Colors.black12),
                                                    borderRadius: BorderRadius.circular(10)),
                                                hintText: "Nama Depan",
                                                hintStyle: TextStyle(color: Colors.grey[400])
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          TextField(
                                            decoration: InputDecoration(
                                                constraints: BoxConstraints.tightFor(width: 120.0),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(color: Colors.black12),
                                                    borderRadius: BorderRadius.circular(10)),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(color: Colors.black12),
                                                    borderRadius: BorderRadius.circular(10)),
                                                hintText: " Belakang",
                                                hintStyle: TextStyle(color: Colors.grey[400])
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      TextField(
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(color: Colors.black12),
                                                borderRadius: BorderRadius.circular(10)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(color: Colors.black12),
                                                borderRadius: BorderRadius.circular(10)),
                                            hintText: "Email ",
                                            hintStyle: TextStyle(color: Colors.grey[400])
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      TextField(
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(color: Colors.black12),
                                                borderRadius: BorderRadius.circular(10)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(color: Colors.black12),
                                                borderRadius: BorderRadius.circular(10)),
                                            hintText: "Jenis Kelamin ",
                                            hintStyle: TextStyle(color: Colors.grey[400])
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      TextField(
                                        obscureText: _secureText,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(color: Colors.black12),
                                                borderRadius: BorderRadius.circular(10)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(color: Colors.black12),
                                                borderRadius: BorderRadius.circular(10)),
                                            hintText: "Password ",
                                          suffixIcon:IconButton(
                                            icon: Icon(_secureText
                                                ? Icons.visibility : Icons.visibility_off),
                                            color: Colors.grey,
                                            onPressed: (){
                                              _passwordShow();
                                            },
                                          ),
                                            hintStyle: TextStyle(color: Colors.grey[400])
                                        ),
                                      ),
                                      SizedBox(height: 30,),
                                      Container(
                                        width: 310,
                                        height: 50,
                                        // decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(10),
                                        //     gradient: LinearGradient(
                                        //         colors: [
                                        //           Color.fromRGBO(143, 148, 251, 1),
                                        //           Color.fromRGBO(143, 148, 251, .6),
                                        //         ]
                                        //     )
                                        // ),
                                        child : SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
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
                                                'Sign Up',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Sudah punya akun ?',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: "Nunito",
                                                fontSize: 14,
                                              ),
                                            ),
                                            FlatButton(
                                              textColor: Colors.deepPurpleAccent,
                                              child: Text(
                                                'Masuk Disini',
                                                style: TextStyle(
                                                    fontFamily: "Nunito",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => HomePage()));
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Degan mendaftar, kamu telah menyetujui'
                                                  ' Syarat & Ketentuan kami',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: "Nunito",
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),
            )

    );
  }
}
