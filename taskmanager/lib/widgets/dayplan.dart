import 'package:flutter/cupertino.dart';

class DayPlan extends StatelessWidget {
  const DayPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 400,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: const Text(
                    '월',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    children: const [
                      Text(
                        'ㅁ task 1',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        'ㅁ task 2',
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
