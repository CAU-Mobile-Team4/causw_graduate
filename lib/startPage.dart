import 'package:causw_graduate/AppColor.dart';
import 'package:causw_graduate/GraduateUI/InformationEntryPage.dart';
import 'package:causw_graduate/calendar/calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background.withOpacity(0.95),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/app.png'),
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 30),
              Stack(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Gradle',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: AppColor.main),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 10,
                      right: 100,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.red),
                          shape: BoxShape.rectangle,
                          color: Colors.transparent,
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 30),
              GestureDetector(
                child: const IndexBox(content: 'Graduation Check List'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InformationEntryPage()));
                },
              ),
              const SizedBox(height: 30),
              GestureDetector(
                child: const IndexBox(content: 'Calendar'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Calendar()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IndexBox extends StatelessWidget {
  final String content;
  const IndexBox({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.background,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(5, 5),
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              content,
              style: const TextStyle(
                  fontSize: 25,
                  color: AppColor.main,
                  fontWeight: FontWeight.bold),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColor.main,
            ),
          ],
        ),
      ),
    );
  }
}
