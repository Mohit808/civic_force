// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pinput/pinput.dart';
//
// class OtpAtom extends StatelessWidget{
//   const OtpAtom({super.key, required this.textEditingController, this.length});
//   final TextEditingController textEditingController;
//   final int? length;
//   @override
//   Widget build(BuildContext context) {
//     return Pinput(
//       length: length??6,
//       controller: textEditingController,
//       defaultPinTheme: PinTheme(
//         width: 56,
//         height: 56,
//         textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.deepPurple),
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       inputFormatters: [
//         LengthLimitingTextInputFormatter(6),
//         FilteringTextInputFormatter.digitsOnly,
//       ],
//       validator: (value){
//         if (value!.isEmpty) return "Fill OTP";
//         if (value.length != (length??6)) return "Enter valid OTP";
//         return null;
//       },
//     );
//   }
// }