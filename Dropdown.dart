
import 'package:flutter/material.dart';



String dropdownValue="";
class DropdownField extends StatefulWidget {
   List listitem;


  DropdownField(this.listitem);

  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {

  void initState(){
    dropdownValue= widget.listitem.first.toString();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
     // dropdownValue = widget.listitem[1];
    return Container(

      width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        child:DropdownButton<String>(
          isExpanded: true,
      value: dropdownValue,

      elevation: 16,
      style: const TextStyle(color: Colors.black),

      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;

          print(dropdownValue);
        });

      },
      items: widget.listitem
          .map<DropdownMenuItem<String>>(( value) {

        return DropdownMenuItem<String>(
          value: value,
          child: Padding(padding:EdgeInsets.all(10.0),child:Text(value)),
        );
      }).toList(),
    ));
  }
}
