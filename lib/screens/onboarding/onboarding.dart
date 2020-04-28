import 'package:covid19/utils/imports.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<String> listTitle = [
    "Wash your hands",
    "Use face mask",
    "Avoid touching your face"
  ];
  List<String> listDescription = [
    "Wash your hands regularly with\nsoap and water or alcohol-based\nhandrub",
    "Cough or sneeze into a tissue or\nflexed elbow, then throw the\ntissue in the trash",
    "Avoid touching your nose,\neyes and mouth with unclen\nhands"
  ];
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              itemBuilder: (context, index) {
                return onboardingItem(index);
              },
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
              controller: pageController,
              itemCount: 3,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        navigatorPush(context, Home(), isReplaced: true);
                      },
                      child: Container(
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.only(left: 12),
                          child: Text(
                            Strings.skip,
                            style: CustomStyle.styleSemiBold
                                .copyWith(color: Colors.black),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        pageIndicator(currentPage == 0),
                        pageIndicator(currentPage == 1),
                        pageIndicator(currentPage == 2)
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        if (currentPage == 2) {
                          navigatorPush(context, Home(), isReplaced: true);
                        } else {
                          currentPage += 1;
                          pageController.jumpToPage(currentPage);
                        }
                      },
                      child: Container(
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.only(right: 12),
                          child: GestureDetector(
                            child: Text(
                              currentPage == 2 ? Strings.letsGo : Strings.next,
                              style: CustomStyle.styleSemiBold
                                  .copyWith(color: Colors.black),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  pageIndicator(isSelected) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: 20,
      height: 4,
      decoration: BoxDecoration(
          color: isSelected ? CustomColors.COLORS_ACCENT : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8)),
    );
  }

  onboardingItem(index) {
    var number = index + 1;
    return Container(
      padding: EdgeInsets.only(top: 48),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Text(
            "How to protect yourself &\nothers from CoronaVirus\n(2019-nCov)",
            style: CustomStyle.styleSemiBold
                .copyWith(color: Colors.black, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              child: Image(
                image: AssetImage("assets/images/ic_on_boarding$number.jpg"),
              ),
            ),
            flex: 7,
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    listTitle[index],
                    style: CustomStyle.styleBold
                        .copyWith(color: Colors.black, fontSize: 24),
                  ),
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      child: Text(
                        listDescription[index],
                        style: CustomStyle.styleNormal
                            .copyWith(color: Colors.black, fontSize: 16),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }
}
