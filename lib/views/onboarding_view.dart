import 'package:flutter/material.dart';
import 'package:shoppingapp/constants/constants.dart';


class OnBoardingView extends StatefulWidget {
  OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int? currentIndex = 0;
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor.withOpacity(.5),
        body: PageView.builder(
          itemCount: 3,
          controller: _controller,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ListView(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    contents[index].title,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: Colors.orange.shade300),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 18,
              ),
              Image.asset(contents[index].image,
                  height: MediaQuery.of(context).size.height / 2.4,
                  scale: contents[0].scale),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      contents[index].subtitle1,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: kGreyColor),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 16,
                    ),
                    // margin: EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          3,
                          (index) => Container(
                                margin: EdgeInsets.only(right: 8),
                                width: currentIndex == index ? 25 : 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: currentIndex == index
                                        ? Colors.orange.shade700
                                        : Colors.grey.shade700,
                                    borderRadius: BorderRadius.circular(5)),
                              )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (currentIndex! < 2) {
                          currentIndex = currentIndex! + 1;
                          _controller.animateToPage(currentIndex!,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        } else if (currentIndex == 2) {
                          Navigator.pushNamed(context, 'LoginPage');
                        }
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: MediaQuery.of(context).size.height / 14,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange.shade700),
                      child: Center(
                        child: Text(
                          contents[index].textOfButton,
                          style: TextStyle(
                              color: kPrimaryColor.withOpacity(.9),
                              fontSize: 26,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ]);
          },
        ));
  }
}
