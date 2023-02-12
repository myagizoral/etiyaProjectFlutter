import 'package:etiya_project/models/covid_model.dart';
import 'package:flutter/foundation.dart';

class Functions {
  findIndex(CovidModel model, String value) {
    for (int i = 0; i <= model.countries!.length; i++) {
      debugPrint(model.countries![i].country.toString());
      if (value.toLowerCase() ==
          model.countries![i].country.toString().toLowerCase()) {
        return i;
      }
    }
  }

  returnpost() {
    var davinci = 'Simplicity is the ultimate Sophistication';

    return davinci;
  }
}
