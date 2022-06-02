import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  CalendarFormat format = CalendarFormat.month;
  DateTime selectDay =DateTime.now();
  DateTime focusedDay =DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey,
        backgroundColor: Colors.white,
        title: const Text('Calendar',style: TextStyle(
          color: Colors.pink,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.wb_sunny,size: 25,color: Colors.pink))
        ],
        centerTitle: true,
      ),
      body: TableCalendar(
          focusedDay: focusedDay,
          firstDay: DateTime(2010),
          lastDay: DateTime(2030),
        calendarFormat: format,
        onFormatChanged: (CalendarFormat _month){
           setState(() {
             format =_month;
           });
        },
        startingDayOfWeek: StartingDayOfWeek.sunday,
        daysOfWeekVisible: true,
        onDaySelected: (DateTime selectDay,DateTime focusedDay){
            setState(() {
              selectDay=selectDay;
              focusedDay=focusedDay;
            });
            print(focusedDay);
        },
        selectedDayPredicate: (DateTime dateTime){
          return isSameDay(selectDay, dateTime);
        },
        calendarStyle: CalendarStyle(
          isTodayHighlighted: true,
          holidayTextStyle: TextStyle(color: Colors.green),
          defaultTextStyle: TextStyle(color: Colors.black),
          selectedDecoration: BoxDecoration(
            color: Colors.pink,
            shape: BoxShape.circle
          ),
          selectedTextStyle: TextStyle(color: Colors.black),
        ),
        headerStyle: HeaderStyle(
          titleTextStyle: TextStyle(
            fontSize: 20
          ),
          formatButtonVisible: true,
          titleCentered: true,
          formatButtonShowsNext: false,
          formatButtonDecoration: BoxDecoration(
            color: Colors.deepOrange,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.grey,
                offset: Offset(1, 1),
                spreadRadius: 2,
                blurStyle: BlurStyle.solid
              )
            ]
          )
        ),

      )
    );
  }
}


