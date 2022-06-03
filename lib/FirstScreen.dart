import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'Controller/Api_Controller.dart';
import 'Controller/dropdown_Controller.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  DropDownController _dropDownController = Get.put(DropDownController());
  ApiController _apiController = Get.put(ApiController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiController.apiData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 8.h,
          title: Text(
            "Feed Generator",
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFFEA71C),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 0.5.h),
                        child: Column(
                          children: [
                            Container(
                                padding:
                                    EdgeInsets.only(bottom: 1.h, left: 1.h),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Media Type",
                                  style: TextStyle(
                                    color: Color(0xFFFEA71C),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                )),
                            Container(
                              height: 5.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: Colors.black, width: 0.4.w),
                              ),
                              child: Obx(
                                () => DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isDense: false,
                                    value: _dropDownController
                                        .selectedMediaType.value,
                                    onChanged: (newValue) {
                                      _dropDownController.selectedMediaType
                                          .value = newValue.toString();
                                      _dropDownController
                                          .selectNewMedia(newValue.toString());
                                      print(
                                          "MediaTypeList == ${_dropDownController.selectedMediaType}");
                                      _apiController.apiData();
                                    },
                                    items: _dropDownController.mediaTypes
                                        .map((selectedType) {
                                      return DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 1.5.h),
                                          child: Text(
                                            selectedType['name'],
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        value: selectedType['name'],
                                      );
                                    }).toList(),
                                    autofocus: true,
                                    isExpanded: true,
                                    alignment: Alignment.center,
                                    iconSize: 36,
                                    icon: Icon(Icons.arrow_drop_down_outlined),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 0.5.h),
                        child: Column(
                          children: [
                            Container(
                                padding:
                                    EdgeInsets.only(bottom: 1.h, left: 1.h),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Storefront",
                                  style: TextStyle(
                                    color: Color(0xFFFEA71C),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                )),
                            Container(
                              height: 5.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: Colors.black, width: 0.4.w),
                              ),
                              child: Obx(
                                () => DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isDense: false,
                                    value: _dropDownController
                                        .selectedContry.value,
                                    onChanged: (newValue) {
                                      _dropDownController.selectedContry.value =
                                          newValue.toString();
                                      _apiController.apiData();
                                    },
                                    items: _dropDownController.countrys.keys
                                        .map((selectedType) => DropdownMenuItem(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 1.5.h),
                                                child: Text(
                                                  selectedType.toString(),
                                                  style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                              value: selectedType.toString(),
                                            ))
                                        .toList(),
                                    autofocus: true,
                                    isExpanded: true,
                                    alignment: Alignment.center,
                                    iconSize: 36,
                                    icon: Icon(Icons.arrow_drop_down_outlined),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 0.5.h),
                        child: Column(
                          children: [
                            Container(
                                padding:
                                    EdgeInsets.only(bottom: 1.h, left: 1.h),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Type",
                                  style: TextStyle(
                                    color: Color(0xFFFEA71C),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                )),
                            Container(
                              height: 5.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: Colors.black, width: 0.4.w),
                              ),
                              child: Obx(
                                () => DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isDense: false,
                                    value:
                                        _dropDownController.selectedType.value,
                                    onChanged: (newValue) {
                                      _dropDownController.selectedType.value =
                                          newValue.toString();
                                      _apiController.apiData();
                                    },
                                    items: _dropDownController.TypeList.map(
                                        (selectedType) {
                                      return DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 1.5.h),
                                          child: Text(
                                            selectedType.toString(),
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        value: selectedType.toString(),
                                      );
                                    }).toList(),
                                    autofocus: true,
                                    isExpanded: true,
                                    alignment: Alignment.center,
                                    iconSize: 36,
                                    icon: Icon(Icons.arrow_drop_down_outlined),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 0.5.h),
                        child: Column(
                          children: [
                            Container(
                                padding:
                                    EdgeInsets.only(bottom: 1.h, left: 1.h),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Feed",
                                  style: TextStyle(
                                    color: Color(0xFFFEA71C),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                )),
                            Container(
                              height: 5.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: Colors.black, width: 0.4.w),
                              ),
                              child: Obx(
                                () => DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isDense: false,
                                    onChanged: (newValue) {
                                      _dropDownController.selectedFeed.value =
                                          newValue.toString();
                                      _apiController.apiData();
                                    },
                                    value:
                                        _dropDownController.selectedFeed.value,
                                    items: _dropDownController
                                        .feedList.value.keys
                                        .map((selectedType) {
                                      return DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 1.5.h),
                                          child: Text(
                                            selectedType.toString(),
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        value: selectedType.toString(),
                                      );
                                    }).toList(),
                                    autofocus: true,
                                    isExpanded: true,
                                    alignment: Alignment.center,
                                    iconSize: 36,
                                    icon: Icon(Icons.arrow_drop_down_outlined),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 0.5.h),
                        child: Column(
                          children: [
                            Container(
                                padding:
                                    EdgeInsets.only(bottom: 1.h, left: 1.h),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Result Limit",
                                  style: TextStyle(
                                    color: Color(0xFFFEA71C),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                )),
                            Container(
                              height: 5.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: Colors.black, width: 0.4.w),
                              ),
                              child: Obx(
                                () => DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isDense: false,
                                    value: _dropDownController
                                        .selectedItemCount.value
                                        .toString(),
                                    onChanged: (newValue) {
                                      _dropDownController.selectedItemCount
                                          .value = newValue.toString();
                                      _apiController.apiData();
                                    },
                                    items: _dropDownController
                                        .showItemsonpageList
                                        .map((selectedType) {
                                      return DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 1.5.h),
                                          child: Text(
                                            selectedType.toString(),
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        value: selectedType.toString(),
                                      );
                                    }).toList(),
                                    autofocus: true,
                                    isExpanded: true,
                                    alignment: Alignment.center,
                                    iconSize: 36,
                                    icon: Icon(Icons.arrow_drop_down_outlined),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 0.5.h),
                        child: Column(
                          children: [
                            Container(
                                padding:
                                    EdgeInsets.only(bottom: 1.h, left: 1.h),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Format",
                                  style: TextStyle(
                                    color: Color(0xFFFEA71C),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                )),
                            Container(
                              height: 5.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: Colors.black, width: 0.4.w),
                              ),
                              child: Obx(
                                () => DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isDense: false,
                                    onChanged: (newValue) {
                                      _dropDownController.selectedFormat.value =
                                          newValue.toString();
                                      _apiController.apiData();
                                    },
                                    value: _dropDownController
                                        .selectedFormat.value,
                                    items: _dropDownController
                                        .FormatList.value.keys
                                        .map((selectedType) {
                                      return DropdownMenuItem(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 1.5.h),
                                          child: Text(
                                            selectedType.toString(),
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        value: selectedType.toString(),
                                      );
                                    }).toList(),
                                    autofocus: true,
                                    isExpanded: true,
                                    alignment: Alignment.center,
                                    iconSize: 36,
                                    icon: Icon(Icons.arrow_drop_down_outlined),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(
                  () => _dropDownController.responsedata.length != 0
                      ? GridView.builder(
                          padding: const EdgeInsets.all(7),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 9 / 15,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: _dropDownController.responsedata.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(0.5.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(1.3.h),
                                    child: Column(
                                      children: [
                                        Image(
                                          image: NetworkImage(
                                              _dropDownController
                                                  .responsedata[index]
                                                  .artworkUrl100),
                                          fit: BoxFit.cover,
                                          height: 15.h,
                                          width: 15.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 0.5.h, left: 0.2.h),
                                      child: Text(
                                        _dropDownController
                                            .responsedata[index].name,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontSize: 12.5.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 0.2.h, left: 0.3.h),
                                      child: Text(
                                        _dropDownController
                                            .responsedata[index].artistName,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          })
                      : Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFFFEA71C),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
