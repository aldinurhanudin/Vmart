part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Halo Semuanya!',
          style: GoogleFonts.poppins(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
