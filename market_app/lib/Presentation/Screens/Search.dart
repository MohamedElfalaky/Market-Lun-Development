import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/Presentation/Screens/OrderDetails.dart';
import 'package:market_app/Presentation/Widgets/Orders%20widgets/Delivery_Order.dart';
import 'package:market_app/Presentation/Widgets/Orders%20widgets/Horizontal_filter_bar.dart';
import 'package:market_app/Presentation/Widgets/Orders%20widgets/Navigation_Drawer%20_Widget.dart';
import 'package:market_app/business_logic/cubits/Orders_cubit/orders_cubit.dart';
import 'package:market_app/business_logic/cubits/Search_cubit/search_cubit.dart';
import 'package:market_app/data/Shared/CacheHelper.dart';
import '../../data/Shared/AppLocalizations.dart';
import 'package:sizer/sizer.dart';

class Search extends StatefulWidget {
  Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final myController = TextEditingController();

  @override
  void initState() {
    SearchCubit.get(context).searchOrder(
        delivery: 1,
        pickup: 1,
        apiToken: CacheHelper.getFromShared("token"),
        searchString: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: AutoSizeText("Search".tr(context)),
        // iconTheme: IconThemeData(color: Colors.red),

        // bottom: HorizontalFilterBar(),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.95,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1),
                        color: const Color.fromARGB(207, 244, 236, 236)),
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                            child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextField(
                            controller: myController,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: "Search..".tr(context),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20)),
                            cursorHeight: 30,
                            // autofocus: true,
                          ),
                        )),
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 30.sp,
                          ),
                          onPressed: () {
                            SearchCubit.get(context).searchOrder(
                                delivery: 1,
                                pickup: 1,
                                apiToken: CacheHelper.getFromShared("token"),
                                searchString: myController.text);
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: BlocConsumer<SearchCubit, SearchState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return ListView.builder(
                            itemCount: state is! SearchSuccess
                                ? 1
                                : state.myOrderModel.data.length,
                            itemBuilder: (context, index) {
                              return state is! SearchSuccess
                                  ? Center(
                                      child: Container(
                                          margin: EdgeInsets.only(top: 300),
                                          child: CircularProgressIndicator()),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OrderDetails(
                                                      id: state.myOrderModel
                                                          .data[index].orderId,
                                                      status: state
                                                          .myOrderModel
                                                          .data[index]
                                                          .orderStatus,
                                                    )));
                                      },
                                      child: DeliveryOrder(
                                        id: state
                                            .myOrderModel.data[index].orderId,
                                        name: state.myOrderModel.data[index]
                                            .clientName,
                                        paymentMethod: state.myOrderModel
                                            .data[index].paymentMethod,
                                        driverName: state.myOrderModel
                                            .data[index].driverName,
                                        total: state
                                            .myOrderModel.data[index].total,
                                        status: state.myOrderModel.data[index]
                                            .orderStatus,
                                        receiveMethod: state.myOrderModel
                                            .data[index].receiveMethod,
                                        time: state.myOrderModel.data[index]
                                            .preparingTime,
                                        expiration: state
                                            .myOrderModel.data[index].expiredAt,
                                        timeZone: state
                                            .myOrderModel.data[index].timezone,
                                      ),
                                    );
                            });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
