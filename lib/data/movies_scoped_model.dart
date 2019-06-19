import 'package:moviesapp/config/config.dart';
import 'package:moviesapp/model/movies_model.dart';
import 'package:moviesapp/services/api.dart';
import 'package:scoped_model/scoped_model.dart';

class MoviesModel extends Model {
  Movies obj = Movies();
  Map<String, dynamic> _ids;
  Map<String, dynamic> get ids => _ids;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setloadingData(bool load) {
    _isLoading = load;
    notifyListeners();
  }

  getData(String name) async {
    _ids = await Api.getRequest(config['BASE_URL'] + "$name" + "%22");
    obj = Movies.fromJson(_ids);
    setloadingData(true);
    notifyListeners();
  }
}
