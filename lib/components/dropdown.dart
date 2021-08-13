
import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {

 List<String> names = <String>[];
 //List names;
   DropdownWidget(this.names,);
  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();

}



/// This is the private State class that goes with MyStatefulWidget.
class _DropdownWidgetState extends State<DropdownWidget> {
 String dropdownValue ='';
 //dropdownValue= widget.names.first.toString();
  //List item=[];
  @override
  void initState(){
    dropdownValue= widget.names.first.toString();
    super.initState();
  }

  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down_sharp),
      iconSize: 24,
      elevation: 16,
      disabledHint:Text('choose') ,
      hint: Text('Your hint'),
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items:widget.names.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
