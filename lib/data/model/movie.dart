class Movie {
  String? title;
  String? date;
  String? poster;

  Movie(this.title, this.date, this.poster);

  Movie.fromJson(Map<String, dynamic> json) {
    print(json['title']);
    title = json['title'];
    poster = json['backdrop_path'];
    date = json['release_date'];
  }
}
