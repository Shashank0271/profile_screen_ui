import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SingleScreen());
  }
}

class SingleScreen extends StatelessWidget {
  const SingleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            child: Container(color: Colors.black.withOpacity(0.8)),
            clipper: MyClipper(),
          ),
          Positioned(
            top: 150,
            left: 95,
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(75)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg',
                          )),
                      boxShadow: [
                        BoxShadow(color: Colors.amberAccent, blurRadius: 14.0),
                        BoxShadow(color: Colors.blue, blurRadius: 7.0),
                        BoxShadow(color: Colors.deepOrange, blurRadius: 2.0),
                      ]),
                ),
                const SizedBox(height: 90),
                const Text(
                  'Tom Cruise',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 17),
                Row(
                  children: const [
                    Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 12,
                    ),
                    Text(
                      'Available for freelance',
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Material(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  elevation: 5,
                  child: Container(
                    height: 30,
                    width: 95,
                    decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Center(
                        child: Text('Edit Name',
                            style: TextStyle(color: Colors.white))),
                  ),
                ),
                const SizedBox(height: 25),
                Material(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  elevation: 5,
                  child: Container(
                    height: 30,
                    width: 95,
                    decoration: BoxDecoration(
                      color: Colors.redAccent.shade700,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Center(
                        child: Text('Logout',
                            style: TextStyle(color: Colors.white))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 2);
    path.lineTo(size.width + 130, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
