import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:random_quote_generator/models/QuoteModel.dart';

class QuoteApi{

  List<QuoteModel> _list = [];

  Future<List<QuoteModel>> get_quote_model () async{
    final response = await http.get(Uri.parse('https://type.fit/api/quotes'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map i in data){
        _list.add(QuoteModel.fromJson(i));
      }
      return _list;
    }
    else{
      throw Exception('Error fetching the api');
    }

  }

}