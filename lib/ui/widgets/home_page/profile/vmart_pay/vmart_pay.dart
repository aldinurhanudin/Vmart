part of '../../../widgets.dart';

class VmartPay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        width: 400,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('data')
                .doc('vmartPay')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              final data = snapshot.data!.data() as Map<String, dynamic>?;
              final amount = data?['amount'] ?? 'Loading...';
              final points = data?['points'] ?? 'Loading...';

              return Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/wallet.png',
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'VmartPay',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  amount.toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/koin.png',
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Vmartpoin',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  points.toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
