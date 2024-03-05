import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'signin_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'APPOINTMENT',
      body:
          'สามรถว่างแผนวันของคุณได้โดยการนัดหมายเราล่วงหน้า และเข้ารับการรักษาอย่างมั่นใจจากทีมแพทย์ผู้เชี่ยวชาญของเรา',
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 45,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8,
              ),
              onPressed: () {},
              child: const Text('Let s Go'),
            ),
          ),
        ],
      ),
      image: Image.asset('assets/images/page1.png'),
      decoration: const PageDecoration(
        pageColor: Color.fromARGB(255, 187, 166, 159),
        bodyTextStyle: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'ONLINE PET BOOK',
      body:
          'ที่นี่ คุณสามารถเก็บประวัติการรักษาสัตว์เลี้ยงของคุณได้ตั้งแต่อดีตถึงปัจจุบัน และสามรถเปิดดูได้ทุกเมื่อ',
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 45,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8,
              ),
              onPressed: () {},
              child: const Text('Let s Go'),
            ),
          ),
        ],
      ),
      image: Image.asset('assets/images/page2.png'),
      decoration: const PageDecoration(
        pageColor: Color.fromARGB(255, 187, 166, 159),
        bodyTextStyle: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'VACCINATION',
      body:
          'สามรถเข้ารับการฉีดวัคซีนได้ตามแผน ที่ถูกต้องโดยมีคุณหมอคอยให้คำแนะนำ',
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 45,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 8,
              ),
              onPressed: () {},
              child: const Text('Let s Go'),
            ),
          ),
        ],
      ),
      image: Image.asset('assets/images/page3.png'),
      decoration: const PageDecoration(
        pageColor: Color.fromARGB(255, 187, 166, 159),
        bodyTextStyle: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 187, 166, 159),
        title: const Text(
          'Vet Clinic',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 187, 166, 159),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: IntroductionScreen(
                globalBackgroundColor: const Color.fromARGB(255, 250, 242, 202),
                pages: pages,
                showSkipButton: true,
                skip: const Text(
                  'skip',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                showDoneButton: true,
                done: const Text('Done',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                showNextButton: true,
                next: const Icon(
                  Icons.arrow_forward,
                  size: 25,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                onDone: () => onDone(context),
                curve: Curves.bounceOut,
                dotsDecorator: const DotsDecorator(
                  size: Size(15, 15),
                  color: Colors.orangeAccent,
                  activeColor: Colors.deepOrangeAccent,
                  activeSize: Size.square(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }
}
