import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../app_theme.dart';
import '../../../../controllers/address_controller.dart';
import '../../../../widgets/placeholder/address_skeleton.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final addressController = Get.put(AddressController());


  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Addresses"),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: Stack(
        children: [
          // Available addresses
          Obx(() {
            return addressController.isLoading.value
                ? Center(child: AddressSkeletonWidget()) : addressController.addresses.isEmpty ? Center(child: Text("No addreses found"),)
                : ListView.builder(
                    itemCount: addressController.addresses.length,
                    // Address boxes
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05, vertical: screenWidth*0.02),
                        child: Container(
                          height: screenWidth*0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppTheme.bgGrey,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth*0.05),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Aligns the row items properly
                              children: [
                                // Label Logo
                                Container(
                                  width: screenWidth*0.1, // Set your desired width
                                  height: 40.0, // Set your desired height
                                  decoration: const BoxDecoration(
                                    color: Colors.white, // White background
                                    shape: BoxShape
                                        .circle, // Ensure the container is circular
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: addressController.addresses[index]
                                                ['label'] ==
                                            "HOME"
                                        ? SvgPicture.asset(
                                            'assets/profile_assets/addresses/home.svg',
                                            width:
                                                20.0, // Same width and height as the container
                                            height:
                                                20.0, // Same width and height as the container
                                          )
                                        : addressController.addresses[index]
                                                    ['label'] ==
                                                "WORK"
                                            ? SvgPicture.asset(
                                                'assets/profile_assets/addresses/work.svg',
                                                width:
                                                    20.0, // Same width and height as the container
                                                height:
                                                    20.0, // Same width and height as the container
                                              )
                                            : Image.asset(
                                                'assets/profile_assets/addresses/location.png',
                                                width:
                                                    20.0, // Same width and height as the container
                                                height:
                                                    20.0, // Same width and height as the container
                                              ),
                                  ),
                                ),
                                SizedBox(width: screenWidth*0.04),
                                // The address
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            addressController.addresses[index]
                                                ['label'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall,
                                          ),
                                          Row(
                                            children: [
                                              // Edit Button
                                              GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                        '/editAddress/${addressController.addresses[index]['id'].toString()}');
                                                    // Get.toNamed('/editAddress/6763e745ad89f6f5ccb90ff6');
                                                  },
                                                  child: SvgPicture.asset(
                                                      'assets/profile_assets/addresses/edit.svg')),
                                              SizedBox(
                                                width: screenWidth*0.08,
                                              ),
                                              // Delete Button
                                              GestureDetector(
                                                  onTap: () {
                                                    addressController
                                                        .deleteAddress(
                                                            addressController
                                                                .addresses[
                                                                    index]['id']
                                                                .toString());
                                                    addressController
                                                        .removeAddress(index);
                                                  },
                                                  child: SvgPicture.asset(
                                                      'assets/profile_assets/addresses/delete.svg')),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: screenWidth*0.02),
                                      Text(
                                        '${addressController.addresses[index]['street']}, '
                                        '${addressController.addresses[index]['address']}, '
                                        '${addressController.addresses[index]['postalCode']}',
                                        softWrap: true, // Allow text to wrap
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
          }),
          // Add address button
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: screenWidth*0.14,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/addAddresses');
                  },
                  child: Text('Add Addresses', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
