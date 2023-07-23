part of '../../widgets.dart';

class HomeTipsItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String url;
  const HomeTipsItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(url)) {
          launch(url);
        }
      },
      child: Container(
        width: 140,
        height: 171,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor1,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2), 
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.asset(
                imageUrl,
                width: 140,
                height: 95,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Text(
                title,
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
