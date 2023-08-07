import 'package:flutter/foundation.dart';
import 'models.dart';

class CountryViewModel with ChangeNotifier {
  List<Country> countries = [
    Country(id: '1', name: 'Country'),
    Country(id: '2', name: 'Country A'),
    Country(id: '3', name: 'Country B'),
  ];

  String _selectedCountry = 'Country';
  String get selectedCountry => _selectedCountry;

  void setSelectedCountry(String countryId) {
    _selectedCountry = countryId;
    notifyListeners();
  }
}

class StateViewModel with ChangeNotifier {
  List<State> states = [
    State(id: '1', name: 'State'),
    State(id: '2', name: 'State A'),
    State(id: '3', name: 'State B'),
  ];

  String _selectedState = 'State';
  String get selectedState => _selectedState;

  void setSelectedState(String stateId) {
    _selectedState = stateId;
    notifyListeners();
  }
}

class DistrictViewModel with ChangeNotifier {
  List<District> districts = [
    District(id: '1', name: 'District'),
    District(id: '2', name: 'District X'),
    District(id: '3', name: 'District Y'),
  ];

  String _selectedDistrict = 'District';
  String get selectedDistrict => _selectedDistrict;

  void setSelectedDistrict(String districtId) {
    _selectedDistrict = districtId;
    notifyListeners();
  }
}

class TalukViewModel with ChangeNotifier {
  List<Taluk> taluks = [
    Taluk(id: '1', name: 'Taluk'),
    Taluk(id: '2', name: 'Taluk P'),
    Taluk(id: '3', name: 'Taluk Q'),
  ];

  String _selectedTaluk = 'Taluk';
  String get selectedTaluk => _selectedTaluk;

  void setSelectedTaluk(String talukId) {
    _selectedTaluk = talukId;
    notifyListeners();
  }
}

class VillageViewModel with ChangeNotifier {
  List<Village> villages = [
    Village(id: '1', name: 'Village'),
    Village(id: '2', name: 'Village M'),
    Village(id: '3', name: 'Village N'),
  ];

  String _selectedVillage = 'Village';
  String get selectedVillage => _selectedVillage;

  void setSelectedVillage(String villageId) {
    _selectedVillage = villageId;
    notifyListeners();
  }
}
