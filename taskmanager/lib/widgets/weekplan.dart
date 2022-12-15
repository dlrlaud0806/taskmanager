import 'package:flutter/material.dart';

class WeekPlan extends StatelessWidget {
  const WeekPlan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 400,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Week Plan',
              style: TextStyle(fontSize: 50),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'ㅁ task 1',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 40),
          ),
          Text(
            'ㅁ task 2',
            style: TextStyle(fontSize: 40),
          ),
        ],
      ),
    );
  }
}
