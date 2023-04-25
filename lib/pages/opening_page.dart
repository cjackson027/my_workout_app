import 'package:flutter/material.dart';
// import 'create_account_page.dart';
// import 'sign_in_account_page.dart';

class OpeningPage extends StatelessWidget {
  const OpeningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _openingPage(context);
  }

  Widget _openingPage(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(

              // onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_) => CreateAccountPage())),
              //tooltip: 'Create Account',
              onPressed: () {  },
              child: const Text('Create Account'),

            ),
            SizedBox(height: 10),
            ElevatedButton(
              // style: TextButton.styleFrom(
              //   primary: Colors.blue,
              // ),
              onPressed: () {  },
              // onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignInAccountPage())),
              //tooltip: 'Sign in',
              child: const Text('Sign in'),
            ),

          ],
        ),
      ),
    );
  }
}
