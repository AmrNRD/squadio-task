
import 'package:intl/intl.dart';

// ignore: avoid_classes_with_only_static_members
class DateUtility{
  static String getFormattedDate(DateTime dateTime, {String? customFormat}) {
    final String format = customFormat ?? 'yyyy-MM-dd';
    return DateFormat(format).format(dateTime);
  }

  static bool isToday(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final aDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    return aDate==today;
  }

  static DateTime startOfTheWeek(DateTime dateTime,{bool useSameTime=false}){
    final int weekDay=dateTime.weekday;
    final DateTime startOfTheWeek=dateTime.subtract(Duration(days: weekDay));
    final DateTime aDate = DateTime(startOfTheWeek.year, startOfTheWeek.month, startOfTheWeek.day,!useSameTime?0:dateTime.hour,!useSameTime?0:dateTime.minute,!useSameTime?0:dateTime.second);
    return aDate;
  }

  static DateTime endOfTheWeek(DateTime dateTime,{bool useSameTime=false}){
    final int weekDay=7-dateTime.weekday;
    final DateTime startOfTheWeek=dateTime.add(Duration(days: weekDay));
    final DateTime aDate = DateTime(startOfTheWeek.year, startOfTheWeek.month, startOfTheWeek.day, !useSameTime?23:dateTime.hour,!useSameTime? 59:dateTime.minute,!useSameTime?59:dateTime.second, !useSameTime?999:dateTime.millisecond, !useSameTime?999:dateTime.microsecond);
    return aDate;
  }


  static DateTime startOfTheMonth(int month,int year){
    final DateTime startOfTheMonth = DateTime(year, month,1,0,0,0);
    return startOfTheMonth;
  }

  static DateTime endOfTheMonth(int month,int year){
    final DateTime startOfTheMonth = DateTime(year, month+1,0,23, 59, 59, 999, 999);
    return startOfTheMonth;
  }

  static DateTime startOfTheQuarter(DateTime date){
    final int quarterNumber = ((date.month-1)/3+1).toInt();
    return DateTime(date.year, (quarterNumber-1)*3+1,1);
  }

  static DateTime endOfTheQuarter(DateTime date){
    final int quarterNumber = ((date.month-1)/3+1).toInt();
    final DateTime firstDayOfQuarter =  DateTime(date.year, (quarterNumber-1)*3+1,1);
    return DateTime(firstDayOfQuarter.year, firstDayOfQuarter.month+3,0,23, 59, 59, 999, 999);
  }

  static DateTime startOfTheSemiAnnual(DateTime date){
    if(date.month>=6) {
      return DateTime(date.year, 6,1,0,0,0);
    } else {
      return DateTime(date.year, 1,1,0,0,0);
    }
  }

  static DateTime endOfTheSemiAnnual(DateTime date){
    if(date.month>=6) {
      return DateTime(date.year, 12,31,23, 59, 59, 999, 999);
    } else {
      return DateTime(date.year, 1,30,23, 59, 59, 999, 999);
    }
  }
  static DateTime startOfTheYear(int year){
    final DateTime startOfTheMonth = DateTime(year, 1,1,0,0,0);
    return startOfTheMonth;
  }

  static DateTime endOfTheYear(int year){
    final DateTime startOfTheMonth = DateTime(year, 12,31,23, 59, 59, 999, 999);
    return startOfTheMonth;
  }
}