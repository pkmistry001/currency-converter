import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:currency_converter/src/utils/common_methods.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:currency_converter/src/blocs/previous_conversion_bloc.dart';
import 'package:currency_converter/src/events/previous_conversions_events.dart';
import 'package:currency_converter/src/data/models/previous_conversions_model.dart';
import 'package:currency_converter/src/states/previous_conversions_screen_states.dart';

class PreviousConversions extends StatefulWidget {
  @override
  PreviousConversionsState createState() => new PreviousConversionsState();
}

class PreviousConversionsState extends State<PreviousConversions> {
  var screenSize;
  bool isLoadingProgress = false;
  List<PreviousConversionModel>? previousConversionList = [];
  static PreviousConversionStates? initialState = LoadingState();
  PreviousConversionsBloc? _previousConversionsBloc =
      PreviousConversionsBloc(initialState!);

  @override
  void initState() {
    super.initState();
    _previousConversionsBloc!.add(GetAllPreviousConversions());
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "My Conversions",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ModalProgressHUD(
        child: BlocListener<PreviousConversionsBloc, PreviousConversionStates>(
          bloc: _previousConversionsBloc,
          listener: (context, state) {
            setState(() {
              if (state is LoadingState) {
                isLoadingProgress = true;
              }
              if (state is GetAllPreviousConversionsSuccess) {
                setState(() {
                  previousConversionList = state.response;
                  isLoadingProgress = false;
                });
              }
            });
          },
          child: buildScreen(),
        ),
        inAsyncCall: isLoadingProgress,
        progressIndicator: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.04,
            height: MediaQuery.of(context).size.height * 0.02,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget buildScreen() {
    return previousConversionList == null || previousConversionList!.length == 0
        ? Center(
            child: Container(
              child: Text("No conversions yet"),
            ),
          )
        : Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
            child: ListView.builder(
                itemCount: previousConversionList!.length,
                itemBuilder: (context, index) {
                  return itemConversion(previousConversionList![index]);
                }),
          );
  }

  Widget itemConversion(PreviousConversionModel previousConversionDTO) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(
          left: screenSize.width * 0.03,
          right: screenSize.width * 0.03,
          top: screenSize.height * 0.02,
          bottom: screenSize.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenSize.height * 0.03,
          ),
          Text("${formatDateddMMyyyy(previousConversionDTO.date)}",style: TextStyle(fontSize: screenSize.height * 0.015),),
          SizedBox(
            height: screenSize.height * 0.03,
          ),
          conversionText(previousConversionDTO),
          SizedBox(
            height: screenSize.height * 0.03,
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
  Widget conversionText(PreviousConversionModel previousConversionDTO){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            constraints:
            BoxConstraints(maxWidth: screenSize.width * 0.4),
            child: Text(
              "${previousConversionDTO.sourceValue} ${previousConversionDTO.sourceCurrency!.value}",
              style:
              TextStyle(fontSize: screenSize.height * 0.015, fontWeight: FontWeight.normal),
            )),
        SizedBox(
          width: screenSize.width * 0.05,
        ),
        Text(
          "=",
          style: TextStyle(fontSize: screenSize.height * 0.015, fontWeight: FontWeight.normal),
        ),
        SizedBox(
          width: screenSize.width * 0.05,
        ),
        Container(
            constraints:
            BoxConstraints(maxWidth: screenSize.width * 0.4),
            child: Text(
              "${previousConversionDTO.targetValue} ${previousConversionDTO.targetCurrency!.value}",
              style:
              TextStyle(fontSize: screenSize.height * 0.015, fontWeight: FontWeight.normal),
            )),
      ],
    ) ;
  }
}
