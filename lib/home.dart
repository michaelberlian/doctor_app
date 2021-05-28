import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  CalendarController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }

  Widget HomeScreen(){
    return new SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 35),
          Container(
            color: Color(0xff41B6E6),
            child: Center(
              child : Text(
                'Schedule',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),)
            ),
          ),
          SizedBox(height: 10),
          TableCalendar(
            initialCalendarFormat: CalendarFormat.month,
            calendarStyle: CalendarStyle(
                todayColor: Color(0xff41B6E6),
                selectedColor: Theme.of(context).primaryColor,
                todayStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white)),
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonDecoration: BoxDecoration(
                color: Color(0xff41B6E6),
                borderRadius: BorderRadius.circular(20.0),
              ),
              formatButtonTextStyle: TextStyle(color: Colors.white),

            ),
            startingDayOfWeek: StartingDayOfWeek.monday,

            builders: CalendarBuilders(
              selectedDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xff41B6E6),
                      borderRadius: BorderRadius.circular(25.0)),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
              todayDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xff41B6E6),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            calendarController: _controller,
          ),
          Column(
            children: [
              Container(
                color: Color(0xff005EB8),
                child: Row(
                  children: [
                    SizedBox(width: 15,height: 35),
                    Container(
                      child: Text('Appointments: ',style: TextStyle(color: Colors.white),)
                    ),
                  ],
                )
              ),
              Container(
                color: Color(0xff00A9CE),
                child: Row(
                  children: [
                    SizedBox(width: 15,height: 150),
                    Container(
                        child: Text('''
1. Mr. John Doe        
   
    16 March 2021 
    16:00
    
    Notes : * ''',style: TextStyle(color: Colors.white),)
                    ),
                  ],
                )
              )
            ],
          )
        ],
      ),
    );
  }
  
  Widget ProfileScreen(){
    return Container(
      child: Column(
        children: [
          SizedBox(height: 50,),
          Center(
            child: CircleAvatar(radius: 100, backgroundImage: AssetImage("assets/profile.png")),
          ),
          SizedBox(height: 25),
          Center(
            child: Text("John Doe", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'Arial'))
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Container(
               child: Text("Date of Birth : 00/00/0000", style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Arial'))
              ),
              SizedBox(height: 20,),
              Container(
                child: Text("Sex : Male", style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Arial'))
              ),
            ]
          ),
        ],
      )
    );
  }

  // List<Widget> tabs = [
  //   HomeScreen(),
  //   Center(child: Text('Search')),
  //   Center(child: Text('Profile')),
  // ];


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: [HomeScreen(),Center(child: Text('Search')),ProfileScreen()][_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Schedule'),
            backgroundColor: Color(0xff41B6E6)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('Search'),
              backgroundColor: Color(0xff41B6E6)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Profile'),
              backgroundColor: Color(0xff41B6E6)
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}