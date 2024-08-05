import 'package:flutter/material.dart';
import '../widgets/sequence_option_button.dart';
import 'even_numbers.dart';
import 'one_to_ten_page.dart';
import 'multiples_of_five.dart';
import 'multiples_of_ten.dart';
import '../widgets/exit_button.dart';
class SequencingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text(
          'Sequencing',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        // This enables the scrolling
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 20.0), // Add padding to avoid overflow
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SequenceOptionButton(
                context: context,
                text: '1 to 100',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OneToTenPage()),
                  );
                  // TODO: Navigate to 1 to 10 Page
                },
              ),
              SequenceOptionButton(
                context: context,
                text: 'Even Numbers',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EvenNumbersPage()),
                  );

                  // TODO: Navigate to 10 to 1 Page
                },
              ),
              SequenceOptionButton(
                context: context,
                text: 'Multiples of Five',
                onPressed: () {
                  // TODO: Navigate to 1 to 100 Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MultiplesOfFive()),
                  );
                },
              ),
              SequenceOptionButton(
                context: context,
                text: 'Multiples of Ten',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MultiplesOfTen()),
                  );
                  // TODO: Navigate to 100 to 1 Page
                },
              ),
              // Placeholder for the caterpillar image. Replace 'assets/greenAnt.png' with your image path

              Padding(
                //padding: const EdgeInsets.all(90.0),
                padding: const EdgeInsets.fromLTRB(110.0, 20.0, 110.0, 20),
                child: Image.asset('assets/greenAnt.png', fit: BoxFit.contain),
              ),

              ExitButton(context: context)
            ],
          ),
        ),
      ),
    );
  }
}