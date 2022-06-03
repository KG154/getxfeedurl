import 'dart:convert';

import 'package:get/get.dart';

import 'dropdown_Controller.dart';
import 'package:http/http.dart' as http;

class ApiController extends GetxController {
  DropDownController _ApiController = Get.put(DropDownController());

  // String baseUrl = "https://rss.applemarketingtools.com/api/v2/";

  Future<RssModal?> apiData() async {
    _ApiController.responsedata.clear();
    _ApiController.responsedata.refresh();

    final country =
        _ApiController.countrys[_ApiController.selectedContry.value];
    final feed = _ApiController.feedList[_ApiController.selectedFeed.value];

    print(
        "https://rss.applemarketingtools.com/api/v2/${country}/${_ApiController.selectedMediaType.value.toLowerCase().replaceAll(" ", "-")}/${feed}/${_ApiController.selectedItemCount.value}/${_ApiController.selectedType.value.toLowerCase().replaceAll(" ", "-")}.json");

    try {
      final response = await http.get(
        Uri.parse(
            "https://rss.applemarketingtools.com/api/v2/${country}/${_ApiController.selectedMediaType.value.toLowerCase().replaceAll(" ", "-")}/${feed}/${_ApiController.selectedItemCount.value}/${_ApiController.selectedType.value.toLowerCase().replaceAll(" ", "-")}.json"),
      );

      if (response.statusCode == 200) {
        print(_ApiController.responsedata);
        final _a = List.from(json.decode(response.body)["feed"]['results']);
        _a.forEach((element) {
          _ApiController.responsedata.add(Results.fromJson(element));
          _ApiController.responsedata.refresh();
        });
        print(_ApiController.responsedata);

        // RssModal abc = RssModal.fromJson(jsonDecode(response.body));
        // return abc;
      }
    } catch (e) {
      print(e);
      RssModal data = RssModal();
      return data;
    }
  }
}

////////

class RssModal {
  RssModal({
    this.feed,
  });

  RssModal.fromJson(dynamic json) {
    feed = json['feed'] != null ? Feed.fromJson(json['feed']) : null;
  }

  Feed? feed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (feed != null) {
      map['feed'] = feed?.toJson();
    }
    return map;
  }
}

class Feed {
  Feed({
    this.title,
    this.id,
    this.author,
    this.links,
    this.copyright,
    this.country,
    this.icon,
    this.updated,
    this.results,
  });

  Feed.fromJson(dynamic json) {
    title = json['title'];
    id = json['id'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links?.add(Links.fromJson(v));
      });
    }
    copyright = json['copyright'];
    country = json['country'];
    icon = json['icon'];
    updated = json['updated'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }

  String? title;
  String? id;
  Author? author;
  List<Links>? links;
  String? copyright;
  String? country;
  String? icon;
  String? updated;
  List<Results>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['id'] = id;
    if (author != null) {
      map['author'] = author?.toJson();
    }
    if (links != null) {
      map['links'] = links?.map((v) => v.toJson()).toList();
    }
    map['copyright'] = copyright;
    map['country'] = country;
    map['icon'] = icon;
    map['updated'] = updated;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Results {
  Results({
    this.artistName,
    this.id,
    this.name,
    this.releaseDate,
    this.kind,
    this.artistId,
    this.artistUrl,
    this.contentAdvisoryRating,
    this.artworkUrl100,
    this.genres,
    this.url,
  });

  Results.fromJson(dynamic json) {
    artistName = json['artistName'] ?? "";
    id = json['id'];
    name = json['name'];
    releaseDate = json['releaseDate'];
    kind = json['kind'];
    artistId = json['artistId'];
    artistUrl = json['artistUrl'];
    contentAdvisoryRating = json['contentAdvisoryRating'];
    artworkUrl100 = json['artworkUrl100'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
    url = json['url'];
  }

  String? artistName;
  String? id;
  String? name;
  String? releaseDate;
  String? kind;
  String? artistId;
  String? artistUrl;
  String? contentAdvisoryRating;
  String? artworkUrl100;
  List<Genres>? genres;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['artistName'] = artistName;
    map['id'] = id;
    map['name'] = name;
    map['releaseDate'] = releaseDate;
    map['kind'] = kind;
    map['artistId'] = artistId;
    map['artistUrl'] = artistUrl;
    map['contentAdvisoryRating'] = contentAdvisoryRating;
    map['artworkUrl100'] = artworkUrl100;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['url'] = url;
    return map;
  }
}

class Genres {
  Genres({
    this.genreId,
    this.name,
    this.url,
  });

  Genres.fromJson(dynamic json) {
    genreId = json['genreId'];
    name = json['name'];
    url = json['url'];
  }

  String? genreId;
  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['genreId'] = genreId;
    map['name'] = name;
    map['url'] = url;
    return map;
  }
}

class Links {
  Links({
    this.self,
  });

  Links.fromJson(dynamic json) {
    self = json['self'];
  }

  String? self;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['self'] = self;
    return map;
  }
}

class Author {
  Author({
    this.name,
    this.url,
  });

  Author.fromJson(dynamic json) {
    name = json['name'];
    url = json['url'];
  }

  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['url'] = url;
    return map;
  }
}
