import 'package:f2f_notifications/f2f_notifications.dart';
import 'package:f2fservices/f2fservices.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:face2face/components/reminders/reminderModel.dart';
import 'package:face2face/main.dart' as main;
class ReminderHelper {
  // final String interval;
  final _random = new Random();
  final bool doNotRequestNotifications;
  ReminderHelper({this.doNotRequestNotifications});
  NotificationDetails platformChannelSpecifics = main.platformChannelSpecifics;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = main.flutterLocalNotificationsPlugin;
  BuildContext context;
  RepeatInterval repeatInterval;
  Expression expression;
  RepeatInterval getInterval(String interval) {
    switch (interval) {
      case 'Never':
        return null;
      case 'Every week':
        return RepeatInterval.Weekly;
      case 'Every other week':
        return RepeatInterval.WeeklyTwo;
      case 'Every three weeks':
        return RepeatInterval.WeeklyThree;
      case 'Every four weeks':
        return RepeatInterval.WeeklyFour;
      default:
        return null;
    }
  }

  deleteReminder(ReminderModel reminder) async {
    print('Now trying to delete notification in system with id: ' +
        reminder.id.toString());
    await flutterLocalNotificationsPlugin.cancel(reminder.id);
    await ReminderModel().deleteReminder(reminder);
  }

  String getDayString(int id) {
    switch (id) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return 'Sunday';
    }
  }
  String getMonthString(int id) {
    switch (id) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return 'Jan';
    }
  }
  Day convertToDay(int id) {
    switch (id) {
      case 1:
        return Day.Monday;
      case 2:
        return Day.Tuesday;
      case 3:
        return Day.Wednesday;
      case 4:
        return Day.Thursday;
      case 5:
        return Day.Friday;
      case 6:
        return Day.Saturday;
      case 7:
        return Day.Sunday;
      default:
        return Day.Sunday;
    }
  }

  scheduleReminder(String interval, int id, Time time, DateTime selectedDate,
      Expression expression, BuildContext context) async {
    
    this.context = context;
    this.expression = expression;
    RepeatInterval repeatInterval = getInterval(interval);
    if (repeatInterval == null) {}

    //var reminders = await ReminderModel().getReminders();
    //  var idsAlreadyUsed = List<int>();
    //  for (ReminderModel reminder in reminders) {
    //    idsAlreadyUsed.add(reminder.id);
    //  }

    id = next(0, 999999);
    
    print('Scheduling with ' +
        interval +
        ', Id: ' +
        id.toString() +
        ', time: ' +
        time.toString() +
        ' date: ' +
        selectedDate.toString() +
        ' exercise: ' +
        expression.title +
        (selectedDate.weekday).toString());

    selectedDate = new DateTime(selectedDate.year, selectedDate.month,
        selectedDate.day, time.hour, time.minute);

    if (repeatInterval == null) {
      print('Once');
     print('Current second' + DateTime.now().toString());
      print('Will go off on' + selectedDate.toString());
      var reminder = ReminderModel(
          categoryTitle: expression.type,
          weekDay: getDayString(selectedDate.weekday),
          id: id,
          dateTimeString: selectedDate.toString(),
          repeat: interval.toString(),
          title: expression.title);
      reminder.save(reminder);
      
      //  if (selectedDate.isBefore(DateTime.now())) {
      //   return;
      // } 
      //once off
      await flutterLocalNotificationsPlugin.schedule(
          id,
          expression.title,
          'It is time to do your exercise.',
          selectedDate,
          platformChannelSpecifics,
          payload: expression.id.toString());

    
      return;
    }
// selectedDate = selectedDate.add(new Duration(seconds: 10));
    //if repeating
    print('Repeat');
 //   print('Current second ' +
    //    DateTime.now().minute.toString() +
     //   DateTime.now().second.toString());
 //   print('Will go off on ' + selectedDate.minute.toString() + selectedDate.second.toString());
    
    Day day = convertToDay(selectedDate.weekday);
    print(day.value);
    await flutterLocalNotificationsPlugin.scheduleFacetoFaceNotification(
        id,
        expression.title,
        'It is time to do your exercise.',
        convertToDay(selectedDate.weekday),
        Time(selectedDate.hour, selectedDate.minute),
        repeatInterval,
        selectedDate,
        platformChannelSpecifics,
        payload: expression.id.toString());

    var reminder = ReminderModel(
        categoryTitle: expression.type,
        weekDay: getDayString(selectedDate.weekday),
        id: id,
        dateTimeString: selectedDate.toString(),
        repeat: interval.toString(),
        title: expression.title);
    reminder.save(reminder);
  }

  int next(int min, int max) => min + _random.nextInt(max - min);

}
