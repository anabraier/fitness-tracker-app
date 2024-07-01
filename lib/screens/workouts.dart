import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFormFieldsDisplay extends StatefulWidget {
  @override
  _TextFormFieldsDisplayState createState() => _TextFormFieldsDisplayState();
}

class _TextFormFieldsDisplayState extends State<TextFormFieldsDisplay> {
  TextEditingController _workoutController = TextEditingController();
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerTime = TextEditingController();
  double _burnedcals = 0;
  double _time = 0;

  List<String> _formValues = [];

  void _submitForm() {
    setState(() {
      _formValues.add('Name: ${_workoutController.text}');
      double _burneddcals = double.tryParse(_controller.text) ?? 0;
      _burnedcals += _burneddcals;
      _formValues.add('Calories: ${_burneddcals}');
      double _timee = double.tryParse(_controllerTime.text) ?? 0;
      _time += _timee;
      _formValues.add('Workout Time: ${_timee}');
      
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFormFields Display'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _workoutController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Enter Workout Name'),
              
            ),
            TextFormField(
              controller: _controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Enter Expected Calories to Burn'),
              
            ),
            TextFormField(
              controller: _controllerTime,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Enter Time You Expect to Take in Minutes'),
              
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: _formValues.isEmpty
              ? Center(child: Text('no Inputs yet'))
               : ListView.builder(
                itemCount: _formValues.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_formValues[index]),
                  );
                },
              ),
            ),
            Row(
            children: <Widget>[
              Column(
              mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
            child: CircularProgressIndicator(
              value: _burnedcals / 2500,
              strokeWidth: 10,
            ),
            height: 80,
            width: 80,
            ),
            ]
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
            child: CircularProgressIndicator(
              value: _time / 2500,
              strokeWidth: 10,
            ),
            height: 80,
            width: 80,
            ),
            ]
            ),
            ]
            ),
            SizedBox(height: 16,),
            Text('Calories: ${(_burnedcals)}kg',
            style: TextStyle(fontSize: 20),
            ),
            Text('Time it takes: ${(_time)}min',
            style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _workoutController.dispose();
    _controller.dispose();
    _controllerTime.dispose();
    super.dispose();
  }
}