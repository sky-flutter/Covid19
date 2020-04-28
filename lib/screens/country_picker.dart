import 'package:covid19/modal/country.dart';
import 'package:covid19/modal/country_data.dart';
import 'package:covid19/repo/all_country_wise_data.dart';
import 'package:covid19/repo/country_picker_repo.dart';
import 'package:covid19/utils/imports.dart';
import 'package:covid19/utils/utils.dart';

class CountryPicker extends StatefulWidget {
  List<CountryData> listCountry;
  CountryPicker(List<CountryData> listCountry) : this.listCountry = listCountry;

  @override
  _CountryPickerState createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: (MediaQuery.of(context).size.height -
            (MediaQuery.of(context).size.height / 5)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 24,
            ),
            Container(
              width: 100,
              margin: EdgeInsets.only(bottom: 24),
              height: 4,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8)),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, top: 8, bottom: 24),
              alignment: Alignment.centerLeft,
              child: Text(
                "Corona Affected Countries",
                style: CustomStyle.styleSemiBold
                    .copyWith(color: Colors.black, fontSize: 16),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return listItem(index);
                  },
                  itemCount: widget.listCountry.length),
            )
          ],
        ));
  }

  listItem(index) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: <Widget>[
            Text(
              localToEmoji(widget.listCountry[index].iso2),
              style: CustomStyle.styleBold.copyWith(fontSize: 28),
            ),
            SizedBox(
              width: 16,
            ),
            Flexible(
              child: Column(
                children: <Widget>[
                  Text(
                    widget.listCountry[index].country,
                    style: CustomStyle.styleBold
                        .copyWith(color: CustomColors.COLORS_PRIMARY),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
