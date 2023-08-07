import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selectstate/dropdownmenusample.dart';
import 'package:selectstate/mvvmdropdown.dart';
import 'dropdown_view_model.dart';

void main() {
  runApp(DropdownButtonApp1());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountryViewModel()),
        ChangeNotifierProvider(create: (_) => StateViewModel()),
        ChangeNotifierProvider(create: (_) => DistrictViewModel()),
        ChangeNotifierProvider(create: (_) => TalukViewModel()),
        ChangeNotifierProvider(create: (_) => VillageViewModel()),
      ],
      child: MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countryViewModel = Provider.of<CountryViewModel>(context);
    final stateViewModel = Provider.of<StateViewModel>(context);
    final districtViewModel = Provider.of<DistrictViewModel>(context);
    final talukViewModel = Provider.of<TalukViewModel>(context);
    final villageViewModel = Provider.of<VillageViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dependent Dropdowns'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: countryViewModel.selectedCountry,
              onChanged: (newValue) {
                countryViewModel.setSelectedCountry(newValue!);
                stateViewModel.setSelectedState('State');
                districtViewModel.setSelectedDistrict('District');
                talukViewModel.setSelectedTaluk('Taluk');
                villageViewModel.setSelectedVillage('Village');
              },
              items: countryViewModel.countries
                  .map((country) => DropdownMenuItem<String>(
                        value: country.id,
                        child: Text(country.name),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: stateViewModel.selectedState,
              onChanged: (newValue) {
                stateViewModel.setSelectedState(newValue!);
                districtViewModel.setSelectedDistrict('District');
                talukViewModel.setSelectedTaluk('Taluk');
                villageViewModel.setSelectedVillage('Village');
              },
              items: stateViewModel.states
                  .where((state) =>
                      state.id.startsWith(countryViewModel.selectedCountry))
                  .map((state) => DropdownMenuItem<String>(
                        value: state.id,
                        child: Text(state.name),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: districtViewModel.selectedDistrict,
              onChanged: (newValue) {
                districtViewModel.setSelectedDistrict(newValue!);
                talukViewModel.setSelectedTaluk('Taluk');
                villageViewModel.setSelectedVillage('Village');
              },
              items: districtViewModel.districts
                  .where((district) =>
                      district.id.startsWith(stateViewModel.selectedState))
                  .map((district) => DropdownMenuItem<String>(
                        value: district.id,
                        child: Text(district.name),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: talukViewModel.selectedTaluk,
              onChanged: (newValue) {
                talukViewModel.setSelectedTaluk(newValue!);
                villageViewModel.setSelectedVillage('Village');
              },
              items: talukViewModel.taluks
                  .where((taluk) =>
                      taluk.id.startsWith(districtViewModel.selectedDistrict))
                  .map((taluk) => DropdownMenuItem<String>(
                        value: taluk.id,
                        child: Text(taluk.name),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: villageViewModel.selectedVillage,
              onChanged: (newValue) {
                villageViewModel.setSelectedVillage(newValue!);
              },
              items: villageViewModel.villages
                  .where((village) =>
                      village.id.startsWith(talukViewModel.selectedTaluk))
                  .map((village) => DropdownMenuItem<String>(
                        value: village.id,
                        child: Text(village.name),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
