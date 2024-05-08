import 'package:flutter/material.dart';

enum Transportation { car, bike, bus, train }

bool isBreakfast = false;
bool isLunch = false;

class ControlsScreen extends StatefulWidget {
  static const name = 'controls_screen';
  const ControlsScreen({super.key});

  @override
  State<ControlsScreen> createState() => _ControlsScreenState();
}

class _ControlsScreenState extends State<ControlsScreen> {
  bool isDeveloper = false;
  Transportation selectedTransport = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controls Screen'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
              title: const Text('Developer mode'),
              subtitle: const Text('Enable developer mode'),
              value: isDeveloper,
              onChanged: (value) {
                setState(() {
                  isDeveloper = !isDeveloper;
                });
              }),
          ExpansionTile(
            title: const Text('Transport vehicle'),
            subtitle: Text(selectedTransport.name),
            children: [
              RadioListTile(
                value: Transportation.car,
                groupValue: selectedTransport,
                onChanged: (value) {
                  setState(() {
                    selectedTransport = value as Transportation;
                  });
                },
                title: Text(Transportation.car.name),
                subtitle: const Text('Travel by car'),
              ),
              RadioListTile(
                value: Transportation.bike,
                groupValue: selectedTransport,
                onChanged: (value) {
                  setState(() {
                    selectedTransport = value as Transportation;
                  });
                },
                title: Text(Transportation.bike.name),
                subtitle: const Text('Travel by bike'),
              ),
              RadioListTile(
                value: Transportation.bus,
                groupValue: selectedTransport,
                onChanged: (value) {
                  setState(() {
                    selectedTransport = value as Transportation;
                  });
                },
                title: Text(Transportation.bus.name),
                subtitle: const Text('Travel by bus'),
              ),
              RadioListTile(
                value: Transportation.train,
                groupValue: selectedTransport,
                onChanged: (value) {
                  setState(() {
                    selectedTransport = value as Transportation;
                  });
                },
                title: Text(Transportation.train.name),
                subtitle: const Text('Travel by train'),
              ),
            ],
          ),
          CheckboxListTile(
            value: isBreakfast,
            onChanged: (value) => {
              setState(() {
                isBreakfast = !isBreakfast;
              })
            },
            title: const Text('Breakfast?'),
          ),
          CheckboxListTile(
            value: isLunch,
            onChanged: (value) => {
              setState(() {
                isLunch = !isLunch;
              })
            },
            title: const Text('Lunch?'),
          )
        ],
      ),
    );
  }
}
