import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropdownButtonViewModel extends ChangeNotifier {
  List<String> list = <String>['select', 'One', 'Two', 'Three', 'Four'];
  String dropdownValue = 'select';

  void updateDropdownValue(String newValue) {
    dropdownValue = newValue;
    notifyListeners();
  }
}

class DropdownButtonExample extends StatefulWidget {
  final DropdownButtonViewModel viewModel;

  DropdownButtonExample({required this.viewModel, Key? key}) : super(key: key);

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DropdownButtonViewModel>(
      builder: (context, viewModel, _) {
        return DropdownButton<String>(
          value: viewModel.dropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.black,
          ),
          onChanged: (String? value) {
            viewModel.updateDropdownValue(value ?? '');
          },
          items: viewModel.list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      },
    );
  }
}

class DropdownButtonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel1 = DropdownButtonViewModel();
    final viewModel2 = DropdownButtonViewModel();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('DropdownButton Sample')),
        body: Center(
          child: Column(
            children: [
              SizedBox(),
              DropdownButtonExample(viewModel: viewModel1),
              SizedBox(),
              DropdownButtonExample(viewModel: viewModel2),
            ],
          ),
        ),
      ),
    );
  }
}
