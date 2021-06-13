class Movie {
  String? title;
  String? date;
  String? poster;
  String? banner;

  Movie(this.title, this.date, this.poster, this.banner);

  Movie.fromJson(Map<String, dynamic> json) {
    print(json['title']);
    title = json['title'];
    banner = json['backdrop_path'];
    date = json['release_date'];
    poster = json['poster_path'];
  }
}
