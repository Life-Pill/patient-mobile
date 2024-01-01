import 'package:flutter/material.dart';
import 'package:patientmobileapplication/features/searching/results_card/ui/results_card_ui.dart';

class RatingSorted extends StatelessWidget {
  const RatingSorted({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        children: [
          ResultsCard(shopOpen: true),
          ResultsCard(shopOpen: false),

        ],
      ),
    );
  }
}
