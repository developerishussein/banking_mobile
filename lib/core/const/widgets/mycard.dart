import 'package:flutter/material.dart';

class Mycard extends StatelessWidget {
  const Mycard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 200,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage('assets/Onboarding/worldmap.png'),
          ),
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(22, 255, 255, 255),
          ),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/Onboarding/Group00000882.png', height: 40),
            SizedBox(height: 10),
            Text(
              '4562 1122 4595 7852',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
            Text('AR Jonson', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Expiry Date', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
                    Text('24/2000', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CVV', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255))),
                    Text('6986', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Image.asset('assets/Onboarding/Group61.png', height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
