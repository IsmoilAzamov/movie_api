import 'Genre.dart';

class Details {
  Details({
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
   bool? adult;
   String? backdropPath;

   int? budget;
   List<Genre>? genres;
   String? homepage;
   int? id;
   String? imdbId;
   String? originalLanguage;
   String? originalTitle;
   String? overview;
   double? popularity;
   String? posterPath;
   List<ProductionCompanies>? productionCompanies;
   List<ProductionCountries>? productionCountries;
   String? releaseDate;
   int? revenue;
   int? runtime;
   List<SpokenLanguages>? spokenLanguages;
   String? status;
   String? tagline;
   String? title;
   bool? video;
   double? voteAverage;
   int? voteCount;

  Details.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    budget = json['budget'];
    genres = List.from(json['genres']).map((e)=>Genre.fromJson(e)).toList();
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    productionCompanies = List.from(json['production_companies']).map((e)=>ProductionCompanies.fromJson(e)).toList();
    productionCountries = List.from(json['production_countries']).map((e)=>ProductionCountries.fromJson(e)).toList();
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    spokenLanguages = List.from(json['spoken_languages']).map((e)=>SpokenLanguages.fromJson(e)).toList();
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['budget'] = budget;
    data['genres'] = genres?.map((e)=>e.toJson()).toList();
    data['homepage'] = homepage;
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['production_companies'] = productionCompanies?.map((e)=>e.toJson()).toList();
    data['production_countries'] = productionCountries?.map((e)=>e.toJson()).toList();
    data['release_date'] = releaseDate;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    data['spoken_languages'] = spokenLanguages?.map((e)=>e.toJson()).toList();
    data['status'] = status;
    data['tagline'] = tagline;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}



class ProductionCompanies {
  ProductionCompanies(
     this.id,
     this.logoPath,
     this.name,
     this.originCountry,
  );
   int? id;
   String? logoPath;
   String? name;
   String? originCountry;

  ProductionCompanies.fromJson(Map<String, dynamic> json){
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['logo_path'] = logoPath;
    data['name'] = name;
    data['origin_country'] = originCountry;
    return data;
  }
}

class ProductionCountries {
  ProductionCountries(
    this.iso_3166_1,
    this.name,
  );
   String? iso_3166_1;
   String? name;

  ProductionCountries.fromJson(Map<String, dynamic> json){
    iso_3166_1 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['iso_3166_1'] = iso_3166_1;
    data['name'] = name;
    return data;
  }
}

class SpokenLanguages {
  SpokenLanguages(
    this.englishName,
    this.iso_639_1,
    this.name,
  );
   String? englishName;
   String? iso_639_1;
   String? name;

  SpokenLanguages.fromJson(Map<String, dynamic> json){
    englishName = json['english_name'];
    iso_639_1 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['english_name'] = englishName;
    data['iso_639_1'] = iso_639_1;
    data['name'] = name;
    return data;
  }
}