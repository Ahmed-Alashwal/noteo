import 'package:flutter/material.dart';

void colorPrint(String text, {int colorCode = 32}) {
  debugPrint('\x1B[${colorCode}m$text\x1B[0m');
}

// Code	Color	Code	Color
// 30	    Black   	
// 34   	Blue
// 31	    Red   	  
// 35   	Purple
// 32	    Green   	
// 36   	Cyan
// 33	    Yellow    
// 37     White
