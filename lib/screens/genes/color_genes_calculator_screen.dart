import 'package:flutter/material.dart';
import 'package:petmalu/widgets/widgets.dart';

class ColorGeneCalculatorScreen extends StatefulWidget {
  @override
  _ColorGeneCalculatorScreenState createState() =>
      _ColorGeneCalculatorScreenState();
  static const String routeName = '/colorgenescalculatorscreen';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => ColorGeneCalculatorScreen(),
      settings: RouteSettings(name: routeName),
    );
  }
}

class _ColorGeneCalculatorScreenState extends State<ColorGeneCalculatorScreen> {
  double _brownParent1 = 0.0;
  double _whiteParent1 = 0.0;
  double _blackParent1 = 0.0;
  double _brownParent2 = 0.0;
  double _whiteParent2 = 0.0;
  double _blackParent2 = 0.0;

  _updateSliders(double value, String color) {
    setState(() {
      switch (color) {
        case 'brownParent1':
          _brownParent1 = value;
          _whiteParent1 = 100 - _brownParent1 - _blackParent1;
          _whiteParent1 = _whiteParent1 < 0 ? 0 : _whiteParent1;
          break;
        case 'whiteParent1':
          _whiteParent1 = value;
          _brownParent1 = 100 - _whiteParent1 - _blackParent1;
          _brownParent1 = _brownParent1 < 0 ? 0 : _brownParent1;
          break;
        case 'blackParent1':
          _blackParent1 = value;
          _whiteParent1 = 100 - _brownParent1 - _blackParent1;
          _whiteParent1 = _whiteParent1 < 0 ? 0 : _whiteParent1;
          break;
        case 'brownParent2':
          _brownParent2 = value;
          _whiteParent2 = 100 - _brownParent2 - _blackParent2;
          _whiteParent2 = _whiteParent2 < 0 ? 0 : _whiteParent2;
          break;
        case 'whiteParent2':
          _whiteParent2 = value;
          _brownParent2 = 100 - _whiteParent2 - _blackParent2;
          _brownParent2 = _brownParent2 < 0 ? 0 : _brownParent2;
          break;
        case 'blackParent2':
          _blackParent2 = value;
          _whiteParent2 = 100 - _brownParent2 - _blackParent2;
          _whiteParent2 = _whiteParent2 < 0 ? 0 : _whiteParent2;
          break;
      }
    });
  }

  void _computeColorProbabilities() {
    double brownProb = 0.0;
    double whiteProb = 0.0;
    double blackProb = 0.0;

    // Calculate probabilities using correct formula
    brownProb = (_brownParent1 / 100) * (_brownParent2 / 100);
    whiteProb = (_whiteParent1 / 100) * (_whiteParent2 / 100);
    blackProb = (_blackParent1 / 100) * (_blackParent2 / 100);

    double brownWhiteProb = (_brownParent1 / 100) * (_whiteParent2 / 100) +
        (_whiteParent1 / 100) * (_brownParent2 / 100);
    double brownBlackProb = (_brownParent1 / 100) * (_blackParent2 / 100) +
        (_blackParent1 / 100) * (_brownParent2 / 100);
    double whiteBlackProb = (_whiteParent1 / 100) * (_blackParent2 / 100) +
        (_blackParent1 / 100) * (_whiteParent2 / 100);

    brownProb += brownWhiteProb * 0.5;
    whiteProb += brownWhiteProb * 0.5;
    brownProb += brownBlackProb * 0.75;
    blackProb += brownBlackProb * 0.25;
    whiteProb += whiteBlackProb * 0.5;
    blackProb += whiteBlackProb * 0.5;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
              Colors.grey[800], // set background color to dark grey
          title: Text('Puppy Color', style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Based on the parents\' genes, the probabilities of the puppy\'s color are:',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Brown: ${(brownProb * 100).toStringAsFixed(2)}%',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'White: ${(whiteProb * 100).toStringAsFixed(2)}%',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Black: ${(blackProb * 100).toStringAsFixed(2)}%',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('OK', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Color Gene Calculator',
        hasActions: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Dog 1',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                'Brown: ${_brownParent1.toStringAsFixed(2)}%',
                style: TextStyle(fontSize: 15.0),
              ),
              Slider(
                value: _brownParent1,
                min: 0.0,
                max: 100.0,
                activeColor: Colors.brown,
                onChanged: (value) {
                  _updateSliders(value, 'brownParent1');
                },
              ),
              SizedBox(height: 16.0),
              Text('White: ${_whiteParent1.toStringAsFixed(2)}%'),
              Slider(
                value: _whiteParent1,
                min: 0.0,
                max: 100.0,
                activeColor: Color.fromARGB(255, 204, 203, 203),
                onChanged: (value) {
                  _updateSliders(value, 'whiteParent1');
                },
              ),
              SizedBox(height: 16.0),
              Text('Black: ${_blackParent1.toStringAsFixed(2)}%'),
              Slider(
                value: _blackParent1,
                min: 0.0,
                max: 100.0,
                activeColor: Colors.black,
                onChanged: (value) {
                  _updateSliders(value, 'blackParent1');
                },
              ),
              SizedBox(height: 32.0),
              Text(
                'Dog 2',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 16.0),
              Text('Brown: ${_brownParent2.toStringAsFixed(2)}%'),
              Slider(
                value: _brownParent2,
                min: 0.0,
                max: 100.0,
                activeColor: Colors.brown,
                onChanged: (value) {
                  _updateSliders(value, 'brownParent2');
                },
              ),
              SizedBox(height: 16.0),
              Text('White: ${_whiteParent2.toStringAsFixed(2)}%'),
              Slider(
                value: _whiteParent2,
                min: 0.0,
                max: 100.0,
                activeColor: Color.fromARGB(255, 204, 203, 203),
                onChanged: (value) {
                  _updateSliders(value, 'whiteParent2');
                },
              ),
              SizedBox(height: 16.0),
              Text('Black: ${_blackParent2.toStringAsFixed(2)}%'),
              Slider(
                value: _blackParent2,
                min: 0.0,
                max: 100.0,
                activeColor: Colors.black,
                inactiveColor: Colors.grey,
                onChanged: (value) {
                  _updateSliders(value, 'blackParent2');
                },
              ),
              SizedBox(height: 32.0),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFffd89b), Color(0xFF19547b)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  child: Text('Compute'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 0.0,
                    textStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    onPrimary: Colors.white,
                  ),
                  onPressed: _computeColorProbabilities,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
