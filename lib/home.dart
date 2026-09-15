import 'package:flutter/material.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _MyState();
}

class _MyState extends State<Home> {
  final TextEditingController _country = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _year = TextEditingController();
  final TextEditingController _month = TextEditingController();
  final TextEditingController _day = TextEditingController();
  final List<String> _countries = [
    "sudan",
    "egypt",
    "algeria",
    "moroco",
    "tunnies",
    "eritrea",
    "ethiopia",
    "lybia",
    "somalia",
  ];
  final List<String> _months = [
    "januarey",
    "februarey",
    "mars",
    "april",
    "may",
    "june",
    "july",
    "augest",
    "septemper",
    "october",
    "novamber",
    "december",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Sign up', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _Custom3(
                      controller: _firstName,
                      title: "first name",
                    ),
                  ),
                  Expanded(
                    child: _Custom3(controller: _lastName, title: "last name"),
                  ),
                ],
              ),
              _Custom2(
                controller: _age,
                data: 28,
                builder: ((index) => index + 18),
                title: "select your age",
              ),
              _Custom1(
                controller: _country,
                data: _countries,
                title: "country",
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 240, 0),
                child: Text(
                  "date of brith",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: _Custom2(
                      controller: _year,
                      data: 30,
                      builder: ((index) => "${1997 + index}"),
                      title: "year",
                    ),
                  ),
                  Expanded(
                    child: _Custom1(
                      controller: _month,
                      data: _months,
                      title: "month",
                    ),
                  ),
                  Expanded(
                    child: _Custom2(
                      controller: _day,
                      data: 31,
                      builder: (index) => "${index + 1}",
                      title: "day",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Custom1 extends StatefulWidget {
  const _Custom1({
    required this.controller,
    required this.data,
    required this.title,
  });
  final TextEditingController controller;
  final List<String> data;
  final String title;

  @override
  State<_Custom1> createState() => _Custom1State();
}

class _Custom1State extends State<_Custom1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          labelText: widget.title,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        ),
        controller: widget.controller,
        onTap: () {
          DropDownState(
            dropDown: DropDown(
              // 1. تحديد العنوان وخيار البحث
              submitButtonText: "تم",
              clearButtonText: "مسح",
              // 2. تمرير البيانات مع تحديد النوع (String مثلاً)
              data: [
                ...List.generate(widget.data.length, (index) {
                  return SelectedListItem<String>(
                    data: widget.data[index],
                    isSelected: false,
                  );
                }),
              ],

              // 3. الاستجابة عند اختيار عنصر
              onSelected: (List<SelectedListItem<dynamic>> selectedList) {
                if (selectedList.isNotEmpty) {
                  // الحصول على العنصر المختار
                  String selectedValue = selectedList.first.data;
                  widget.controller.text = selectedValue;
                  setState(() {});
                }
              },

              // 4. خيارات إضافية
              enableMultipleSelection: false, // اختيار مفرد
            ),
          ).showModal(context);
        },
      ),
    );
  }
}

class _Custom2 extends StatefulWidget {
  const _Custom2({
    required this.controller,
    required this.data,
    required this.builder,
    required this.title,
  });
  final TextEditingController controller;
  final int data;
  final dynamic Function(int index) builder;
  final String title;
  @override
  State<_Custom2> createState() => _Custom2State();
}

class _Custom2State extends State<_Custom2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          labelText: widget.title,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        ),
        controller: widget.controller,
        onTap: () {
          DropDownState(
            dropDown: DropDown(
              // 1. تحديد العنوان وخيار البحث
              submitButtonText: "تم",
              clearButtonText: "مسح",
              // 2. تمرير البيانات مع تحديد النوع (String مثلاً)
              data: [
                ...List.generate(widget.data, (index) {
                  var data = widget.builder(index).toString();
                  return SelectedListItem<String>(
                    data: data.toString(),
                    isSelected: false,
                  );
                }),
              ],

              // 3. الاستجابة عند اختيار عنصر
              onSelected: (List<SelectedListItem<dynamic>> selectedList) {
                if (selectedList.isNotEmpty) {
                  // الحصول على العنصر المختار
                  String selectedValue = selectedList.first.data;
                  widget.controller.text = selectedValue;
                  setState(() {});
                }
              },

              // 4. خيارات إضافية
              enableMultipleSelection: false, // اختيار مفرد
            ),
          ).showModal(context);
        },
      ),
    );
  }
}

class _Custom3 extends StatelessWidget {
  const _Custom3({required this.controller, required this.title});
  final TextEditingController controller;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(title),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }
}
