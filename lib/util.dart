import 'dart:ui';
import 'package:flutter/material.dart';

TextStyle myTextStyle15()
{
  return TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white);
}

TextStyle myTextStyle15Blacky()
{
  return TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.black);
}

TextStyle myTextStyle30()
{
  return TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white);
}

TextStyle myTextStyle30Blacky()
{
  return TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.black);
}
Color myWhiteColour(){
  return  Colors.white;
}
Color myLightBlueColor(){
  return  Colors.purple.shade100;
}
Color myRedColour(){
  return const Color.fromARGB(230, 129, 24, 97);
}
// const Color.fromARGB(255, 43, 12, 90),
Gradient myGradient(Alignment begin,Alignment end){
  return LinearGradient(
    colors: [
      // const Color.fromARGB(255, 18, 5, 39),
      const Color.fromARGB(255, 43, 12, 90),
      const Color.fromARGB(230, 129, 24, 97),
      const Color.fromARGB(230, 126,41,100),
      const Color.fromARGB(208, 174, 65, 88),

      // const Color.fromARGB(255, 177, 75, 99),
    ],
    begin:begin,
    end:end,
  );
}
Gradient myGradient2(Alignment begin,Alignment end){
  return LinearGradient(
    colors: [

      const Color.fromARGB(255, 43, 12, 90),
      const Color.fromARGB(230, 129, 24, 97),
      const Color.fromARGB(230, 126,41,100),
      // const Color.fromARGB(230, 126,41,100),
    ],
    begin:begin,
    end:end,
  );
}Gradient myGradient3(Alignment begin,Alignment end){
  return LinearGradient(
    colors: [

      const Color.fromARGB(255, 43, 12, 90),
      const Color.fromARGB(230, 129, 24, 97),
      // const Color.fromARGB(230, 126,41,100),
    ],
    begin:begin,
    end:end,
  );
}

// void showTopToast(String message, Color bgColor) {
//   Future.delayed(Duration(milliseconds: 100), () {  // Delay to ensure UI is ready
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       backgroundColor: bgColor,
//       textColor: Colors.white,
//       fontSize: 15,
//     );
//   });
// }

// Widget buildDropdown(
//     String title,
//     List<String> items,
//     ValueChanged<String?> onChanged,
//     String? selectedValue,
//     ) {
//   final uniqueItems = items.toSet().toList();

//   return Padding(
//     padding: const EdgeInsets.only(bottom: 20),
//     child: DropdownButtonHideUnderline(
//       child: DropdownButton2<String>(
//         isExpanded: true,
//         hint: Row(
//           children: [
//             const SizedBox(width: 8),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 15,
//                 color: Colors.black,
//               ),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//         items: uniqueItems.map((String item) {
//           return DropdownMenuItem<String>(
//             value: item,
//             child: Text(
//                 item,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   color: Colors.black,
//                 ),
//                 overflow: TextOverflow.clip // clip matlab neechey sey aaney lagengey
//             ),
//           );
//         }).toList(),
//         value: selectedValue,
//         onChanged: onChanged,
//         buttonStyleData: ButtonStyleData(
//           height: 55,
//           padding: const EdgeInsets.only(right: 14),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(color: Colors.black),
//             color: Colors.white,
//           ),
//           elevation: 5,
//         ),
//         iconStyleData: const IconStyleData(
//           icon: Icon(
//             Icons.arrow_drop_down_circle_outlined,
//             size: 25,
//             color: Colors.black,
//           ),
//         ),
//         dropdownStyleData: DropdownStyleData(
//           maxHeight: 200, //for the whole dropdown height
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: Colors.purple.shade100,
//           ),
//           offset: const Offset(0, 0),
//         ),
//         menuItemStyleData: const MenuItemStyleData(
//           height: 50, // for making the items height
//           padding: EdgeInsets.only(left: 14, right: 14),
//         ),
//       ),
//     ),
//   );
// }
// void _resetLowerFields(String field) {
//   setState(() {
//     if (field == 'class') {
//       selectedSemester = null;
//       selectedSubject = null;
//     } else if (field == 'semester') {
//       selectedSubject = null;
//     }
//   });
// }

class MyStack<T>
{
  final list=<T>[];
  void push(T val)=>list.add(val);
  T pop()=>list.removeLast();

  T top()
  {
    return list.last;
  }
  int get length
  {
    return list.length;
  }
  bool get isEmpty=>list.isEmpty;
  bool get isNotEmpty=>list.isNotEmpty;
}
ButtonStyle myButtonStyle()
{
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    shadowColor: Colors.white,
    // textStyle: myTextStyle15Blacky(),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)),
  );
}
ButtonStyle myButtonStyleBlack()
{
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    shadowColor: Colors.black,
    // textStyle: myTextStyle15(),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
    ),
  );
}