import 'package:chatapp/models/onbording_model.dart';
import 'package:flutter/material.dart';

const Color kBlackColor = Colors.black;
const Color kGreyColor = Colors.grey;
const Color kWhiteColor = Colors.white;

const Color kOrangeColor = Colors.orange;
const Color kPrimaryColor = Color(0xFF011F37);
const kLogo = 'assets/images/appIcon.png';

List<OnBoardingModel> contents = [
  OnBoardingModel(
      image: 'assets/images/welcome-removebg-preview.png',
      title: 'Welcome 👐',
      subtitle1: '   Welcome to our app               '
          '                     We\'re excited to help you shop with us!',
      textOfButton: 'Next',
      scale: 1),
  OnBoardingModel(
    scale: 1,
    image: 'assets/images/people-shopping-removebg-preview.png',
    title: ' Shop Now 👕👚',
    subtitle1:
        'Experience the ultimate shopping adventure with us! Discover the latest trends in clothing and accessories.',
    textOfButton: 'Next',
  ),
  OnBoardingModel(
    scale: .1,
    image: 'assets/images/4-removebg-preview.png',
    title: 'Add to Cart 🛒',
    subtitle1:
        'Select your favorite items, and with a simple click Enjoy a seamless shopping experience. ',
    textOfButton: 'Get Started',
  )
];
