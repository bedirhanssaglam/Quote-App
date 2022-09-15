import 'package:vexana/vexana.dart';

class QuoteModel extends INetworkModel<QuoteModel> {
  String? id;
  String? author;
  String? content;
  List<String>? tags;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  QuoteModel({
    this.id,
    this.author,
    this.content,
    this.tags,
    this.authorSlug,
    this.length,
    this.dateAdded,
    this.dateModified,
  });

  @override
  QuoteModel fromJson(Map<String, dynamic> json) => QuoteModel.fromJson(json);

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['_id'] as String?,
      author: json['author'] as String?,
      content: json['content'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      authorSlug: json['authorSlug'] as String?,
      length: json['length'] as int?,
      dateAdded: json['dateAdded'] as String?,
      dateModified: json['dateModified'] as String?,
    );
  }

  @override
  Map<String, dynamic>? toJson() => _toJson();

  Map<String, dynamic> _toJson() {
    return {
      'id': id,
      'author': author,
      'content': content,
      'tags': tags,
      'authorSlug': authorSlug,
      'length': length,
      'dateAdded': dateAdded,
      'dateModified': dateModified,
    };
  }
}
