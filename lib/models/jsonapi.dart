import 'dart:convert';
import 'dart:async';
import 'package:projectscoid/models/inlinetagslist.dart';



Future<Map>projectsJson()async{
  String jsonstring = '{"user_name": "IrvanHermawan",'+
                      '"password": "Project1",'+
                      '"email": "john@example.com",'+          
                      //'"enume" :{"11":"Personal Account"},'
                      //'"enumselection":{"11":"Personal Account","33":"Corporate Account","77":"Group Account"}'+
                      '"enum" :"11",' +
                      '"enum_selection":["11","Personal Account","33","Corporate Account","77","Group Account"],'+
                      '"model" :"11",' +
                      '"model_selection":["1","Guest","11","User"],'+
                      '"display_name" :"Irvan Hermawan Saichu",' +
                      '"title" :"Berjalan Menuju Ke...",' +
                      '"handphone" :"+628562143569",' +
                      '"money" : "30000",' +
                      '"number" : "300",' +
                      '"double" : "300.12",' +
                      '"boolean" : "1",' +
                      '"multiline" : "test multiline \\ntest multiline \\ntest multiline",' +
                      '"address" : "jl. Manglayang \\nno.31 \\nBandung",' +
                      '"percent" : "70",' +
                     // '"image" : {"status":"","name":"","temp":"201905115cd65db86f034.jpg"},' +
                     // '"file" : {"status":"","name":"test123.text","temp":"","date":"", "size":""},' +
                      '"image" : {"status":"","name":"","temp":""},' +
                      '"file" : {"status":"","name":"","temp":"","date":"", "size":""},' +

                      '"captcha" : "",' +
                      '"rating" : "7.5",' +
                      '"datetime" : "10/02/2000 15:13:00",' +
                      '"date" : "10/02/2000",' +
                      '"time" : "15:13:00",' +
                      '"article" : "<ul><li>headingStyle (setext or atx)</li> <li>horizontalRule (*, -, or _)</li></ul>",' +
                      '"website": "https://projects.co.id",'+                    
                      //'"inlinetags" :{"1037":".NET Compact Framework", "1265": ".NET Framework"},'
                      //'"inlinetagsselection":{"1037":".NET Compact Framework", "1265": ".NET Framework", "905":".NET Micro Framework", "833":".NET/Mono" }'+
                      '"inline_tags" : ["1037","833"],' +
                      '"inline_tags_selection" : $inlinetags }';
                     //  '"inlinetags" : ["10","12","13"],' +
                     // '"inlinetagsselection" : ["10","test1","12","test2","13","test3","14", "test4"]}';

                       

  Map projectsjson;
  return projectsjson = jsonDecode(jsonstring);
}


