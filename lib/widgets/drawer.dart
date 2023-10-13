import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTil(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text('Anthony Fulgencio'),
                      Text('Oxford Bible Church'),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(Icons.notifications_active_outlined)
                ],
              ),
              Container(
                height: 80,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                child: Text(
                  'CALENDAR ',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: Color(0xff7f00ff)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              buildListTil('Month', Icons.calendar_month, () {
                // Navigator.of(context).pushNamed(ChallengeScreen.routeName);
              }),
              buildListTil('Days', Icons.calendar_today, () {
                // Navigator.of(context).pushNamed(FiltersScreen.routeName);
              }),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'ORG',
                  style: TextStyle(fontSize: 20, color: Color(0xff7f00ff)),
                ),
              ),
              buildListTil('My Profile', Icons.person_2_outlined, () {
                // Navigator.of(context).pushNamed(FiltersScreen.routeName);
              }),
              buildListTil('Reports', Icons.graphic_eq_outlined, () {
                // Navigator.of(context).pushNamed(FiltersScreen.routeName);
              }),
              buildListTil('Team', Icons.person_2_outlined, () {
                // Navigator.of(context).pushNamed(AnalysisScreen.routeName);
              }),
              buildListTil('Help', Icons.help_outline, () {
                // Navigator.of(context).pushNamed(AnalysisScreen.routeName);
              }),
              buildListTil('Log out', Icons.logout, () {
                // Navigator.of(context).pushNamed(AnalysisScreen.routeName);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
