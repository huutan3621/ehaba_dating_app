import 'package:ehaba_dating_app/constraint.dart';
import 'package:flutter/material.dart';

class pop_up extends StatefulWidget {
  pop_up({Key key}) : super(key: key);

  @override
  _pop_upState createState() => _pop_upState();
}

class _pop_upState extends State<pop_up> {
  RangeValues _currentAge = const RangeValues(40, 80);
  RangeValues _currentDistance = const RangeValues(40, 80);
  bool _nam = false;
  bool _nu = false;
  bool _both = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 480.0,
        width: 360.0,
        //color: Colors.white,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Bỏ qua',
                    style: TextStyle(color: kPrimaryColor, fontSize: 14.0),
                  ),
                ],
              ),
            ),
            Text(
              'Bộ lọc',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),

            //gender
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Giới tính',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ElevatedButton(
                        child: Text("Nam"),
                        onPressed: () => setState(() => _nam = !_nam),
                        style: ElevatedButton.styleFrom(
                          primary: _nam ? kPrimaryColor : Colors.grey,
                        )),
                    SizedBox(width: 5),
                    ElevatedButton(
                        child: Text("Nữ"),
                        onPressed: () => setState(() => _nu = !_nu),
                        style: ElevatedButton.styleFrom(
                          primary: _nu ? kPrimaryColor : Colors.grey,
                        )),
                    SizedBox(width: 5),
                    ElevatedButton(
                        child: Text("Cả hai"),
                        onPressed: () => setState(() => _both = !_both),
                        style: ElevatedButton.styleFrom(
                          primary: _both ? kPrimaryColor : Colors.grey,
                        )),
                  ],
                ),
              ),
            ),

            //location
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Vị trí',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: (MaterialButton(
                    minWidth: double.infinity,
                    height: 55,
                    color: Colors.white,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(color: kPrimaryColor)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'HCM City',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    )))),

            //location distance
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Khoảng cách (km)',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            RangeSlider(
                values: _currentDistance,
                min: 0,
                max: 100,
                divisions: 100,
                activeColor: kPrimaryColor,
                inactiveColor: Colors.grey,
                labels: RangeLabels(
                  _currentDistance.start.round().toString(),
                  _currentDistance.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentDistance = values;
                  });
                }),

            //age
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Độ tuổi',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            RangeSlider(
                values: _currentAge,
                min: 0,
                max: 100,
                divisions: 100,
                activeColor: kPrimaryColor,
                inactiveColor: Colors.grey,
                labels: RangeLabels(
                  _currentAge.start.round().toString(),
                  _currentAge.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentAge = values;
                  });
                }),

            //done button
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: (MaterialButton(
                  minWidth: double.infinity,
                  height: 55,
                  color: kPrimaryColor,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: Text(
                    'Hoàn thành',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ))),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
