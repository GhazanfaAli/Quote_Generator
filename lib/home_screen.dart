import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:random_quote_generator/models/QuoteModel.dart';
import 'package:random_quote_generator/provider/random_text_provider.dart';
import 'package:random_quote_generator/quote_service/quote_api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:url_launcher/url_launcher.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<String> images = [
    'https://images2.alphacoders.com/683/683089.jpg',
    'https://marketplace.canva.com/EAEoWjiyv84/1/0/1600w/canva-simple-motivational-quotes-and-landscapes-desktop-wallpaper-T0aGxz-mosA.jpg',
    'https://e1.pxfuel.com/desktop-wallpaper/941/982/desktop-wallpaper-focus-quotes-achieve.jpg',
    'https://c4.wallpaperflare.com/wallpaper/559/457/188/inspirational-motivational-quote-quotes-wallpaper-preview.jpg',
    'https://wallpaper-mania.com/wp-content/uploads/2018/09/High_resolution_wallpaper_background_ID_77701085287.jpg',
    'https://i.pinimg.com/originals/44/a4/da/44a4da3cfaad1469d3a821d2202cdd16.jpg'
  ];


  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<RandomTextProvider>(context);
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

   // print('Build...');

    return Scaffold(

      backgroundColor: Colors.blueGrey[900],

      body: SafeArea(

        child: Column(
          children: [

            SizedBox(height: 10,),
            Padding(
              padding:  EdgeInsets.only(bottom: 17.0),
              child:Container(

                  child:  CarouselSlider.builder(
                    itemCount: images.length,
                    options: CarouselOptions(
                      height: 170,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      viewportFraction: 0.7,

                    ),
                    itemBuilder: (context, index, realIdx) {
                      return Container(

                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      );
                    },
                  )

              ),
            ),
           SizedBox(height: 20,),
           SizedBox(
             height: MediaQuery.of(context).size.height * 0.1,
             width: MediaQuery.of(context).size.width * 0.8,
             child: DefaultTextStyle(
               style: TextStyle(
                   fontSize: 23,
                   color: Colors.white,
                   fontWeight: FontWeight.bold
               ),
               child: AnimatedTextKit(
                 repeatForever: true,

                 animatedTexts: [
                   TypewriterAnimatedText('Click on New quote button to generate text',),
                 ],
               ),

             ),
           ),
            SizedBox(height:15 ,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey[700]?.withOpacity(0.5),
                ),


                child: Column(
                  children: [
                    SizedBox(
                        height: 120,
                        child: GenerateQuote()),

                    SizedBox(height: 8,),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          InkWell(
                            onTap:()=>setState(() {
                              {
                                const link = 'https://www.facebook.com/';
                                 launchUrl(
                                    Uri.parse(link),
                                   mode: LaunchMode.inAppWebView
                                     );
                                 }
                                      }),

                            child: Icon(
                              color: Colors.white,
                              FontAwesomeIcons.facebook,
                              size: 35,
                            ),
                          ),
                          SizedBox(
                            width: 14,),
                          InkWell(
                            onTap:()=>setState(() {
                              {
                                const link = 'https://twitter.com/?lang=en';
                                launchUrl(
                                    Uri.parse(link),
                                    mode: LaunchMode.inAppWebView
                                );
                              }
                            }),
                            child: Icon(
                              color: Colors.white,
                              FontAwesomeIcons.twitter,
                              size: 35,
                            ),
                          ),
                          SizedBox(
                            width: 10,),
                          InkWell(
                            onTap:()=>setState(() {
                              {
                                const link = 'https://www.instagram.com/';
                                launchUrl(
                                    Uri.parse(link),
                                    mode: LaunchMode.inAppWebView
                                );
                              }
                            }),

                            child: Icon(
                              color: Colors.white,
                              FontAwesomeIcons.instagram,
                              size: 35,
                            ),
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,),

                          const NewQuoteButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

class GenerateQuote extends StatelessWidget {
  const GenerateQuote({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RandomTextProvider>(
      builder: (context, value, child) {
        return Stack(
          children: [

            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  textAlign: TextAlign.center,
                  value.text,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
            ),


            Positioned(
              bottom: 0,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Text(
                    '_ ${value.author}',
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.white),
                  ),
                  SizedBox(width: 20,),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class NewQuoteButton extends StatelessWidget {
  const NewQuoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RandomTextProvider>(context, listen: false);
    final api = QuoteApi();

    return InkWell(
      onTap: () async {
        List<QuoteModel> quoteList = await api.get_quote_model();
        if (quoteList.isNotEmpty) {
          Random random = Random();
          int index = random.nextInt(quoteList.length);
          var randomQuote = quoteList[index];
          provider.generateText(
              randomQuote.text.toString(), randomQuote.author.toString());
        }
      },
      child: Container(
        width: 105,
        height: 37,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                  onTap: () async {
                    List<QuoteModel> quoteList = await api.get_quote_model();
                    if (quoteList.isNotEmpty) {
                      Random random = Random();
                      int index = random.nextInt(quoteList.length);
                      var randomQuote = quoteList[index];
                      provider.generateText(
                          randomQuote.text.toString(), randomQuote.author.toString());
                    }
                  },
                  child: Text('New Quote', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),)),
            )
        ),
      ),
    );
  }
}
