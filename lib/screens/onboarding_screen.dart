import 'package:flutter/material.dart';
import 'package:bin_buddy/widgets/my_button.dart';
// import 'package:bin_buddy/screens/login_screen.dart'; // <-- Import LoginScreen

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/logo.png",
      "title": "Welcome to Buddy App!",
      "subtitle": "Keep your tasks organized and tidy.",
    },
    {
      "image": "assets/images/logo.png",
      "title": "Track your progress",
      "subtitle": "Check off tasks and stay productive every day.",
    },
    {
      "image": "assets/images/logo.png",
      "title": "Make a Greener Choice",
      "subtitle": "You are ready to start using the app.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          onboardingData[index]["image"]!,
                          height: 300,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          onboardingData[index]["title"]!,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          onboardingData[index]["subtitle"]!,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: MyButton(
                text: currentPage == onboardingData.length - 1
                    ? "Finish"
                    : "Next",
                color: currentPage == onboardingData.length - 1
                    ? Colors.greenAccent.shade400
                    : Colors.green,
                // onPressed: () {
                //   if (currentPage == onboardingData.length - 1) {
                //     Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(builder: (_) => const LoginScreen()),
                //     );
                //   } else {
                //     _controller.nextPage(
                //       duration: const Duration(milliseconds: 300),
                //       curve: Curves.easeIn,
                //     );
                //   }
                // },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
