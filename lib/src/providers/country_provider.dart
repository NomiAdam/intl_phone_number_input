import 'package:intl_phone_number_input/src/models/country_list.dart';
import 'package:intl_phone_number_input/src/models/country_model.dart';

const String PropertyName = 'alpha_2_code';

/// [CountryProvider] provides helper classes that involves manipulations.
/// of Countries from [Countries.countryList]
class CountryProvider {
  /// Get data of Countries.
  ///
  /// Returns List of [Country].
  ///
  ///  * If [countries] is `null` or empty it returns a list of all [Countries.countryList].
  ///  * If [countries] is not empty it returns a filtered list containing
  ///    counties as specified.
  static List<Country> getCountriesData(
      {required List<String>? countries,
      List<String> countriesToPutFirst = const []}) {
    List jsonList = Countries.countryList;

    if (countries == null || countries.isEmpty) {
      final countryList =
          jsonList.map((country) => Country.fromJson(country)).toList();
      countryList
          .sort((a, _) => countriesToPutFirst.contains(a.alpha2Code) ? 1 : 0);
      return countryList;
    }
    List filteredList = jsonList.where((country) {
      return countries.contains(country[PropertyName]);
    }).toList();

    filteredList
        .sort((a, _) => countriesToPutFirst.contains(a.alpha2Code) ? 1 : 0);

    return filteredList.map((country) => Country.fromJson(country)).toList();
  }
}
