part of '../../../widgets.dart';

class SelectDelivery extends StatefulWidget {
  const SelectDelivery({super.key});

  @override
  State<SelectDelivery> createState() => _SelectDeliveryState();
}

class _SelectDeliveryState extends State<SelectDelivery> {
  final String apiKey = 'd6e171a68e0353d3f840306a11756725';
  final String origin = '22';
  final String destination = '22';
  final int weight = 1000;

  List<dynamic> shippingCosts = [];
  bool isLoading = false;

  Future<void> fetchShippingCosts(String courier) async {
    setState(() {
      isLoading = true;
    });

    try {
      final String apiUrl = 'https://api.rajaongkir.com/starter/cost';

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'key': apiKey,
          'content-type': 'application/x-www-form-urlencoded',
        },
        body: {
          'origin': origin,
          'destination': destination,
          'weight': weight.toString(),
          'courier': courier,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          shippingCosts = data['rajaongkir']['results'];
        });
      } else {
        throw Exception('Failed to fetch shipping cost');
      }
    } catch (error) {
      print(error.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text('Pilih Pengiriman',
            style: primaryTextStyle.copyWith(
              fontSize: 20,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // DropdownSearch<String>(
            //   mode: Mode.MENU,
            //   // showSelectedItem: true,
            //   items: ['jne', 'tiki', 'pos'],
            //   label: 'Pilih Pengiriman',
            //   onChanged: (String? newValue) {
            //     fetchShippingCosts(newValue!);
            //   },
            //   // selectedItem: selectedShipping,
            // ),
            DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSelectedItems: true,
                disabledItemFn: (String s) => s.startsWith('I'),
              ),
              items: ["jne", "tiki", "pos"],
              dropdownSearchDecoration: InputDecoration(
                labelText: "Pilih Pengiriman",
                hintText: "Pilih Pengiriman",
              ),
              onChanged: (String? newValue) {
                fetchShippingCosts(newValue!);
              },
              // selectedItem: selectedShipping,
            ),

            DropdownSearch<String>(
              items: ['jne', 'tiki', 'pos'],
              // label: 'Pilih Pengiriman',
              onChanged: (String? newValue) {
                fetchShippingCosts(newValue!);
              },
            ),

            if (isLoading)
              Center(
                child: CircularProgressIndicator(
                  strokeWidth: 4.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              )
            else
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: shippingCosts.length,
                  itemBuilder: (ctx, index) {
                    final cost = shippingCosts[index];
                    final serviceName = cost['name'];
                    final serviceCost = cost['costs'][0]['cost'][0]['value'];

                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/checkout');
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(serviceName),
                          subtitle: Text('Harga: Rp $serviceCost'),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
