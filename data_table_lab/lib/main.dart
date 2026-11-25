import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab B - DataTable',
      home: const CarTablePage(),
    );
  }
}

class Car {
  Car(this.make, this.model, this.price);

  final String make;
  final String model; // Intentionally String instead of int in partial version
  final int price;
}

class CarTablePage extends StatelessWidget {
  CarTablePage({super.key});

  final List<Car> cars = [
    Car('Honda', '2021', 35000),
    Car('Toyota', '2011', 6000),
    Car('BMW', '2010', 9000),
  ];

  @override
  Widget build(BuildContext context) {
    // Missing sortColumnIndex, sortAscending, and onSort callbacks
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 05: DataTable Example'),
      ),
      body: DataTable(
        border: TableBorder.all(color: Colors.black),
        columns: const [
          DataColumn(label: Text('Car Make')),
          DataColumn(label: Text('Model')),
          DataColumn(label: Text('Price')),
        ],
        rows: cars
            .map(
              (car) => DataRow(
                cells: [
                  DataCell(Text(car.make)),
                  DataCell(Text(car.model)),
                  DataCell(Text(car.price.toString())),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}