import 'package:flutter/material.dart';

class AuthMain extends StatelessWidget {
  const AuthMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(236, 236, 236, 1),
      body: Column(children: [
        Expanded(
          child: Image.asset('assets/images/placeholder.png'),
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 42, bottom: 42, left: 16, right: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(236, 236, 236, 1),
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 16,
                  right: 16,
                ),
                elevation: 0,
              ),
              onPressed: () => Navigator.of(context).pushNamed('/auth/login'),
              child: Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(102, 112, 128, 1)),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Color.fromRGBO(102, 112, 128, 1),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(236, 236, 236, 1),
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 16,
                  right: 16,
                ),
                elevation: 0,
              ),
              onPressed: () =>
                  Navigator.of(context).pushNamed('/auth/register'),
              child: Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Create an account",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(102, 112, 128, 1)),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Color.fromRGBO(102, 112, 128, 1),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            TextButton(
              style: const ButtonStyle(
                overlayColor:
                    MaterialStatePropertyAll(Color.fromRGBO(236, 236, 236, 1)),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromRGBO(102, 112, 128, 1),
                ),
              ),
            ),
          ]),
        )
      ]),
    );
  }
}
