import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:phone_otp/firebase_options.dart';
import 'package:phone_otp/signup.dart';
import 'package:phone_otp/splashscreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.purpleAccent,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
      title: "Keep",
      description:
      "Accept cryptocurrencies and digital assets, keep thern here, or send to orthers",
      lottie: "assets/order.json",
    ),
    SliderPage(
      title: "Buy",
      description:
      "Buy Bitcoin and cryptocurrencies with VISA and MasterVard right in the App",
      lottie: "assets/interaction.json"
    ),
    SliderPage(
      title: "Sell",
      description:
      "Sell your Bitcoin cryptocurrencies or Change with orthres digital assets or flat money",
      lottie: "assets/delivery.json"
    ),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f6fb),
      body: Stack(

        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),

          Align(

            alignment: Alignment.bottomLeft,

            child: Row(
              verticalDirection: VerticalDirection.down,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(_pages.length, (int index) {
                      return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 10,
                          width: (index == _currentPage) ? 30 : 10,
                          margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == _currentPage)
                                  ? Colors.deepPurpleAccent
                                  : Colors.deepPurpleAccent.withOpacity(0.5)));
                    })),
                InkWell(
                  onTap: () {
                    _controller.jumpToPage(2);
                    // duration: Duration(milliseconds: 800),
                    // curve: Curves.easeInOutQuint);
                  },
                  child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 300),
                      height: 70,
                      width: (_currentPage == (_pages.length - 1)) ? 200 : 100,
                      decoration: BoxDecoration(
                          color: (_currentPage == (_pages.length - 1)) ? Colors.white : Colors.white,
                          borderRadius: (_currentPage == (_pages.length - 1)) ? BorderRadius.circular(0) : BorderRadius.circular(0)),
                          child: (_currentPage == (_pages.length - 1))
                  ? ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
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
                          'Mulai',
                          style: TextStyle(fontSize: 16),),
                      ),
                    )
                          // ? TextButton(onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp())); }, child: Text("Mulai", style: TextStyle(color: Colors.white, fontSize: 20,))
                          // )
                          : Text(
                        "skip",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      )
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SliderPage extends StatelessWidget {
  SliderPage({required this.title, required this.description, required this.lottie});

  final String title;
  final String description;
  final String lottie;



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           Lottie.asset(
          lottie,
           width: width * 0.6,
           ),
          SizedBox(
            height: 60,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              description,
              style: TextStyle(
                height: 1.5,
                fontWeight: FontWeight.normal,
                fontSize: 14,
                letterSpacing: 0.7,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}