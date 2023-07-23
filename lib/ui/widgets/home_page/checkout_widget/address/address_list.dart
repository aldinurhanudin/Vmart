part of '../../../widgets.dart';


class AddressList extends StatefulWidget {
  const AddressList({Key? key});

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Alamat Saya',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: greyColor,
            height: 1.0,
            thickness: 1.2,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/home'));
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('addresses').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          List<DocumentSnapshot> documents = snapshot.data!.docs;

          if (documents.isEmpty) {
            return emptyAddress();
          }

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (BuildContext context, int index) {
              Map<String, dynamic> data =
                  documents[index].data() as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Container(
                  width: 325,
                  height: 93,
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 2), 
                      ),
                    ],
                    border: Border.all(
                      color: primaryColor,
                      width: 1,
                    ),
                    color: backgroundColor1,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 28,
                        right: 5,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.green,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              top: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      data['name'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      data['phone'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  data['address'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: saveButton(),
    );
  }

  Widget saveButton() {
    return Container(
      height: 70,
      child: Column(
        children: [
          Divider(
            thickness: 1.3,
            color: Colors.grey,
            height: 1.0,
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 150,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addAddress');
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: primaryColor,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Tambah Alamat',
                      style: greenTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Container(
                  height: 50,
                  width: 150,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/checkout', (route) => false);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Pilih alamat',
                      style: GoogleFonts.poppins(
                          color: backgroundColor1,
                          fontWeight: bold,
                          fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget emptyAddress() {
    return Container(
      width: double.infinity,
      color: backgroundColor3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons_googlemaps.png',
            width: 74,
          ),
          SizedBox(
            height: 23,
          ),
          Text(
            'Tidak ada alamat yang tersimpan',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
