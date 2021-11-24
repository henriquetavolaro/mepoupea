
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app_widget.dart';
import 'di/injection_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const AppFirebase());
}

class AppFirebase extends StatefulWidget {
  const AppFirebase({Key? key}) : super(key: key);

  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Material(
              child: Text(
                "Não foi possivel inicializar o Firebase",
                textDirection: TextDirection.ltr,
              ));
        }
        if (snapshot.connectionState == ConnectionState.done) {

          return AppWidget();
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}