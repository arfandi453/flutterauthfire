import 'package:flutter/material.dart';
import 'package:phone_otp/register.dart';
import 'package:phone_otp/signup.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _secureText = true;

  void _passwordShow() {
    setState(() {
      _secureText = !_secureText;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
        builder: (context, constraints)
    {
      return SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
              const SizedBox(height: 90),
              const Text(
                'Masuk Ke Akun Kamu',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 0.70),
              Container(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child:  Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(

                              // border: Border(bottom: BorderSide(color: Colors.grey[100]))
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: "Email or Phone number",
                                  hintStyle: TextStyle(color: Colors.grey[400])
                              ),
                            ),
                          ),


                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              obscureText: _secureText,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: "Password",
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
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 16,
                          ),
                          FlatButton(
                            child: Text(
                              'Lupa password ?',
                              style: TextStyle(
                                fontFamily: "Nunito",
                              color: Colors.deepPurple.shade200,
                                fontSize: 14,
                              ),
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

                    SizedBox(height: 30,),
                    Container(
                      width: 310,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(150, 149, 238, 1),
                                Color.fromRGBO(251, 199, 212, 1),
                              ]
                          )
                      ),
                      child : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Register()));
                          },
                          style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                            MaterialStateProperty.all<Color> (Color.fromRGBO(255, 255, 255, 0),),
                            shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
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
                              'Log In',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Belum punya akun ?',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Nunito",
                              fontSize: 14,
                            ),
                          ),
                          FlatButton(
                            textColor: Colors.deepPurple.shade200,
                            child: Text(
                              'Daftar Disini',
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30,),
                  ],
                ),
              )
            ],
          ),
        ),

      );

    }
        )
    );
  }
}