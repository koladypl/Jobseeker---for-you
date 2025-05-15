import 'package:flutter/material.dart';
import 'package:job_seeker/job_offer_list_screen.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: JobOffersListScreen(
        toggleTheme: () {

        },
      ),
    );
  }
}
