import 'package:flutter/material.dart';
import 'package:taskmanager/widgets/WeekPlan.dart';
import 'package:taskmanager/widgets/dayplan.dart';

class WeekTask extends StatefulWidget {
  const WeekTask({super.key});

  @override
  State<WeekTask> createState() => _WeekTaskState();
}

class _WeekTaskState extends State<WeekTask> {
  bool weekdaytoggle = true;

  void _selectweek() {
    setState(() {
      weekdaytoggle = true;
    });
  }

  void _selectday() {
    setState(() {
      weekdaytoggle = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: _selectweek,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            'Week',
                            style: TextStyle(fontSize: 50),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: _selectday,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            "Day",
                            style: TextStyle(fontSize: 50),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              weekdaytoggle ? const WeekPlan() : const DayPlan(),
            ],
          ),
        ),
      ),
    );
  }
}
