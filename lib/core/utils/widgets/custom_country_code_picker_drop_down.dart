import 'package:flutter/material.dart';

class CountryModel {
  final String flag;
  final String dialCode;
  final String countryCode ;

  CountryModel({required this.flag, required this.dialCode, required this.countryCode, });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CountryModel &&
              runtimeType == other.runtimeType &&
              flag == other.flag &&
              dialCode == other.dialCode;

  @override
  int get hashCode => flag.hashCode ^ dialCode.hashCode;
}

class CustomCountryCodePickerDropDown extends StatelessWidget {
  final List<CountryModel> countries;
  final CountryModel? selectedCountry;
  final ValueChanged<CountryModel?> onChanged;
  final double width;
  final double height;

  const CustomCountryCodePickerDropDown({
    super.key,
    required this.countries,
    required this.selectedCountry,
    required this.onChanged,
    this.width = 250,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 55,
      child: DropdownButtonFormField<CountryModel>(
        value: selectedCountry,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
        onChanged: onChanged,
        selectedItemBuilder: (context) {
          return countries.map((country) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Text("+${country.dialCode}", style: const TextStyle(fontSize: 16)),
            );
          }).toList();
        },
        items: countries.map((country) {
          return DropdownMenuItem<CountryModel>(
            value: country,
            child: Row(
              children: [
                Text(country.flag, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: 12),
                Text("+${country.dialCode}", style: const TextStyle(fontSize: 16)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}