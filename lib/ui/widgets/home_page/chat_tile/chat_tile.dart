part of '../../widgets.dart';

class ChatTile extends StatelessWidget {
  final MessageModel message;
  ChatTile(this.message);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailChatPage(
              UninitializedProductModel(),
            ),
          ),
        );
      },
      child: Container(
        height: 80,
        margin: EdgeInsets.only(
          top: 33,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFFFFFFF),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/vmart_on.png',
                    width: 54,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vegetable Mart',
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          message.message,
                          style: secondaryTextStyle.copyWith(
                            fontWeight: light,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Sekarang',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
