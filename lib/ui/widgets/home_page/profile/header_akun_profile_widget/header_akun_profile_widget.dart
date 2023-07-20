part of '../../../widgets.dart';

class HeaderAkunProfileWidget extends StatelessWidget {
  const HeaderAkunProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    return Container(
      // color: Colors.white,
      height: 85,

      margin: EdgeInsets.only(
        // top: 20,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
        // borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),

      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/inisial.png',
                width: 60,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 23,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Icon(
                          Icons.border_color_outlined,
                          color: primaryTextColor,
                          size: 17,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Ubah Profil',
                          style: subtitleTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/sign-in', (route) => false);
              },
              child: Image.asset(
                'assets/brokoli.png',
                width: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
