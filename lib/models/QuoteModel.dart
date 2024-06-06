/// text : "Genius is one percent inspiration and ninety-nine percent perspiration."
/// author : "Thomas Edison, type.fit"

class QuoteModel {
  QuoteModel({
      String? text, 
      String? author,}){
    _text = text;
    _author = author;
}

  QuoteModel.fromJson(dynamic json) {
    _text = json['text'];
    _author = json['author'];
  }
  String? _text;
  String? _author;
QuoteModel copyWith({  String? text,
  String? author,
}) => QuoteModel(  text: text ?? _text,
  author: author ?? _author,
);
  String? get text => _text;
  String? get author => _author;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = _text;
    map['author'] = _author;
    return map;
  }

}