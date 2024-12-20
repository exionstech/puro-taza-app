import 'package:flutter/material.dart';
import 'package:purotaja/utils/internal_permissions.dart';

class AccessLocationScreen extends StatelessWidget {
  const AccessLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    InternalPermissions internalPermissions = InternalPermissions();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height, // Full screen height
          child: Center( // Center vertically and horizontally
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Minimize the column height
                children: [
                  Image.asset(
                    'assets/location.png',
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Enable Location',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'PURO-TAJA WILL ACCESS YOUR LOCATION ONLY WHILE USING THE APP.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        internalPermissions.askLocationPermission();
                      },
                      label: const Text("ACCESS LOCATION"),
                      icon: Image.asset('assets/map_pin.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
