import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/widgets/category_title.dart';
import 'package:food/widgets/food_card.dart';

import 'constant.dart';
import 'details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
          fontFamily: "Poppins",
        scaffoldBackgroundColor: kWhiteColor,
        primaryColor: kPrimaryColor,
        textTheme: TextTheme(
          headline: TextStyle(
            fontWeight: FontWeight.bold
          ),
          button: TextStyle(
            fontWeight: FontWeight.bold
          ),
          title: TextStyle(
              fontWeight: FontWeight.bold
          ),
          body1: TextStyle(
            color: kTextColor.withOpacity(.4)
          )
        )

      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryColor.withOpacity(.26),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kPrimaryColor
          ),
          child: SvgPicture.asset(
              "assets/icons/plus.svg",

          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 50),
            child: Align(
              alignment: Alignment.topRight,
                child: SvgPicture.asset(
                    "assets/icons/menu.svg",
                    height: 11,
                )
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Simple way to find \nTasty food",
              style: Theme.of(context).textTheme.headline,
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryTitle(title: "All",active: true,),
                CategoryTitle(title: "Italian",active: false,),
                CategoryTitle(title: "Asian",active: false,),
                CategoryTitle(title: "Chinese",active: false,),
                CategoryTitle(title: "Burgers",active: false,)
              ],
            ),
          ),
          
          Container(
            alignment: Alignment.centerLeft,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: KBorderColor),

            ),
            child: SvgPicture.asset("assets/icons/search.svg"),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FoodCard(
                  press: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return DetailsScreen();
                    }));
                  },
                  title: "Vegan salad bowl",
                  image: "assets/images/image_1.png",
                  price: 20,
                  calories: "420Kcal",
                  description:
                  "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ",
                ),


                // FoodCard(),
                SizedBox(width: 20,),

                FoodCard(
                  title: "Vegan salad bowl",
                  image: "assets/images/image_2.png",
                  price: 20,
                  calories: "420Kcal",
                  description:
                  "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. ",
                ),

                SizedBox(width: 20,),
              ],
            ),
          )
        ],
      ),
    );
  }
}



