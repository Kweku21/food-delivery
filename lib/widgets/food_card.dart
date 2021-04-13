import 'package:flutter/material.dart';

import '../constant.dart';

class FoodCard extends StatelessWidget {

  final String title;
  final String ingredient;
  final String image;
  final int price;
  final String calories;
  final String description;
  final Function press;


  const FoodCard({
    Key key, this.title, this.ingredient, this.image, this.price, this.calories, this.description, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        
          margin: EdgeInsets.only(left: 20),
          height: 400,
          width: 270,
          child: Stack(
              children: [
                // Big light background
                Positioned(

                  child: Container(
                    height: 380,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(34),
                        color: kPrimaryColor.withOpacity(0.06)
                    ),
                  ),
                  right: 0,
                  bottom: 0,
                ),

                //Rounded background
                Positioned(
                  child: Container(
                    height: 181,
                    width: 181,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor.withOpacity(0.15)
                    ),
                  ),
                  left: 10,
                  top: 10,
                ),

                Positioned(
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            image,
                          ),

                        )
                    ),
                  ),
                  top: -30,
                  left: -30,


                ),

                Positioned(
                  right: 10,
                  top: 80,

                  child: Text(
                      "\$$price",
                      style: Theme.of(context)
                          .textTheme
                          .headline
                          .copyWith(color: kPrimaryColor)
                  ),
                ),

                Positioned(
                    top: 210,
                    left: 40,
                    child: Container(
                      width: 210,
                      child: Column(
                        children: [
                          Text(title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            "With $ingredient",
                            style: TextStyle(color: kTextColor.withOpacity(.4)),
                          ),
                          SizedBox(height: 16,),
                          Text(
                            description,
                            maxLines: 4,
                            style: TextStyle(
                              color: kTextColor.withOpacity(0.7),
                            ),
                          ),
                          SizedBox(height: 16,),
                          Text("${calories}Kcal")
                        ],
                      ),
                    )
                )
              ]
          )

      ),
    );
  }
}