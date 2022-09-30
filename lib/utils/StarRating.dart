
import 'package:flutter/material.dart';
import 'package:hotels/utils/Col.dart';


class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;


  StarRating({this.starCount = 5, this.rating = .0, required this.onRatingChanged});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
        size: 18,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        size: 18,
        color: Theme.of(context).primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
        size: 18,
        color: Col.primary_dark,
        //color: Theme.of(context).primaryColor,
      );
    }
    return new InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: new List.generate(starCount, (index) => buildStar(context, index)));
  }
}

typedef void RatingChangeCallback(double rating);