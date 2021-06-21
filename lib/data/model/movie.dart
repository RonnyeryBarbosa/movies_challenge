class Movie {
  int? id;
  String? title;
  String? date;
  String? poster;
  String? banner;
  String? name;
  String? originalLanguage;
  String? realeaseDate;
  double? rating;
  double? revenue;
  double? runtime;
  List<Genres>? genres;
  String? overview;

  Movie(this.id, this.title, this.date, this.poster, this.banner);

  String? genreInfo() => this.genres!.join(",").toString();

  String? getYear() => date?.substring(0, 4);

  String? getTime() {
    var hour = runtime! / 60;
    var time = "${hour.toStringAsFixed(2)}".replaceAll(".", "h ");
    return "$time min";
  }

  Movie.fromJson(Map<String, dynamic> json) {
    print(json['title']);
    id = json['id'];
    title = json['title'];
    banner = json['backdrop_path'];
    date = json['release_date'];
    poster = json['poster_path'];
    name = json['name'];
    rating = json['vote_average'];
    runtime = json['runtime'];
    overview = json['overview'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
  }
}

class Genres {
  int? id;
  String? name;

  @override
  String toString() {
    return name ?? "";
  }

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
