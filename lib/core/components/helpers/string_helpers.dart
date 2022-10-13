


String filterShortcodes(String input,
    {String opening = '(', String closing = ')'}) {
  assert(opening.runes.length == 1);
  assert(closing.runes.length == 1);
  final openingRune = opening.runes.first;
  final closingRune = closing.runes.first;
  bool filter = false;
  final buf = StringBuffer();
  for (final rune in input.runes) {
    if (filter == false && rune == openingRune) {
      filter = true;
    } else if (filter == true && rune == closingRune) {
      filter = false;
    } else if (!filter) {
      buf.write(String.fromCharCode(rune));
    }
  }
  var str = buf.toString();
  return input.replaceAll(str, '').replaceAll('(', '').replaceAll(')', '');
}


searchT(String words) => words.replaceAllMapped(
  new RegExp(r',"(.*?)":', caseSensitive: false),
	  (Match m) => ' ');

  String allModelWords(String words){
       String text = searchT(words);
       text = text.replaceFirst('"age":', ' ');
       return text;
  }

String readText(String text, int index){
    var tempText;
    if(text.length > index ){
      tempText = text.substring(0, index);
      tempText = tempText + '...';
      return tempText;
    }else{
      return text;
    }
}



String encode(int code){
  code = code +  1119731;
  String str = code.toRadixString(16);
  int strlg = str.length ~/ 2;
  String temp = '';
  for(var i = 0 ; i < strlg; i++){
    int n = i*2;
    int m = n + 2;
    temp = temp + str.substring(n, m).split('').reversed.join();
    // print('i == $i');
  }

  return temp.split('').reversed.join();
}


int hexToInt(String hex)
{
  int val = 0;
  int len = hex.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = hex.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
      // A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
      // a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      throw new FormatException("Invalid hexadecimal value");
    }
  }
  return val;
}

int decode(String code){
  String cd = code.split('').reversed.join();
  int strlg = cd.length ~/ 2;
  String temp = '';
  for(var i = 0 ; i < strlg; i++){
    int n = i*2;
    int m = n + 2;
    temp = temp + cd.substring(n, m).split('').reversed.join();
    // print('i == $i');
  }
  return hexToInt(temp)- 1119731;
}


double toRating(String text){
  var tempText;
  var index =   text.indexOf('/');
  
    tempText = text.substring(0, index - 1);

    return double.parse(tempText);

}

int toDay(DateTime date){
  final date2 = DateTime.now();
  final difference = date.difference(date2).inDays;
  return difference;
}

String ratingMean(double rating){

    if(rating >= 8.0){
      return 'excellent';
    }
    if(rating < 8.0 && rating >= 6.0 ){
      return 'good';
    }
    if(rating < 6.0 && rating >= 4.0 ){
      return 'average';
    }
    if(rating < 4.0 && rating >=2.0 ){
      return 'not good';
    }
    if(rating < 2.0 && rating >=0.1 ){
      return 'poor';
    }
    if(rating == 0.0){
      return 'unrated';
    }
    return 'unrated';

}
String urlToRoute(String url){
  var rt, rt1;
  rt = url.replaceFirst('http://localhost/projectscoid', '');
  if(url.indexOf('projects.co.id') >= 0) {
    url = url.substring(url.indexOf('projects.co.id'));
  };
  rt = url.toLowerCase().replaceFirst('projects.co.id', '');
  rt = rt.replaceFirst('https://', '');
  rt1 = rt.replaceFirst('?', '/');
  return rt1;
}


String urlToRouteSp(String url){
  var rt, rt1;
  rt = url.replaceFirst('http://localhost/projectscoid', '');
  if(url.indexOf('projects.co.id') >= 0) {
    url = url.substring(url.indexOf('projects.co.id'));
  };
  rt = url.toLowerCase().replaceFirst('projects.co.id', '');
  // rt = rt.replaceFirst('https://api.projects.co.id', '');
  rt1 = rt.replaceFirst('?', '%28');
  return rt1;
}

String getImageLink(String _html){

  const start = "src='";
  const end = "'><\/div>";

  final startIndex = _html.indexOf(start);
  final endIndex = _html.indexOf(end, startIndex + start.length);

  return(_html.substring(startIndex + start.length, endIndex));
}

String getHtml(String _html){

var replace = '';
var counter = 0;

final result = _html.replaceAllMapped(RegExp(r"(-bottom-10'>)(.*?)(<div class='col-md-9)"), (m) {
  return '${m[1]}$replace${m[3]}';
});
return(result);

}


   String displayTimeAgoFromTimestamp(String timestamp) {
    final year = int.parse(timestamp.substring(0, 4));
    final month = int.parse(timestamp.substring(5, 7));
    final day = int.parse(timestamp.substring(8, 10));
    final hour = int.parse(timestamp.substring(11, 13));
    final minute = int.parse(timestamp.substring(14, 16));

    final DateTime videoDate = DateTime(year, month, day, hour, minute);
    final int diffInHours = DateTime.now().difference(videoDate).inHours;

    String timeAgo = '';
    String timeUnit = '';
    int timeValue = 0;

    if (diffInHours < 1) {
      final diffInMinutes = DateTime.now().difference(videoDate).inMinutes;
      timeValue = diffInMinutes;
      timeUnit = 'minute';
    } else if (diffInHours < 24) {
      timeValue = diffInHours;
      timeUnit = 'hour';
    } else if (diffInHours >= 24 && diffInHours < 24 * 7) {
      timeValue = (diffInHours / 24).floor();
      timeUnit = 'day';
    } else if (diffInHours >= 24 * 7 && diffInHours < 24 * 30) {
      timeValue = (diffInHours / (24 * 7)).floor();
      timeUnit = 'week';
    } else if (diffInHours >= 24 * 30 && diffInHours < 24 * 12 * 30) {
      timeValue = (diffInHours / (24 * 30)).floor();
      timeUnit = 'month';
    } else {
      timeValue = (diffInHours / (24 * 365)).floor();
      timeUnit = 'year';
    }

    timeAgo = timeValue.toString() + ' ' + timeUnit;
    timeAgo += timeValue > 1 ? 's' : '';

    return timeAgo + ' ago';
  }
