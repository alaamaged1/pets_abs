import 'package:flutter/material.dart';
import 'package:pets_abs/models/pet_model.dart';

List<Pet> petList = [
  Pet(
    "Dog",
    "Golden",
    20,
    "https://drive.google.com/uc?export=view&id=1SVXNgYjWidATdPpPfswlWtS31DnhjB-2",
  ),
  Pet(
    "Dog",
    "Labrador",
    18,
    "https://drive.google.com/uc?export=view&id=152WsHjSIgQUy0gS_WQEo3mWOSMK8v1kM",
  ),
  Pet(
    "Dog",
    "Cardigan",
    12,
    "https://drive.google.com/uc?export=view&id=1fHoNz-wywIk_ta4RIJzXm7yLrObyKDty",
  ),
  Pet(
    "Cat",
    "Street Cat",
    17,
    "https://drive.google.com/uc?export=view&id=1SL7ZirhhuTpgk7wRe_t0vB_3xD9iqCGm",
  ),
  Pet(
    "Cat",
    "White Cat",
    19,
    "https://drive.google.com/uc?export=view&id=1C_S4qQ4wck3LasJ1Bs5Lz8yhwN60SmTH",
  ),
  Pet(
    "Cat",
    "Kitten",
    18,
    "https://drive.google.com/uc?export=view&id=1qQILdlJ3gtm_0VBzmSoqgTbisVZ-7kr9",
  ),
  Pet(
    "Bird",
    "House Bird",
    15,
    "https://drive.google.com/uc?export=view&id=1LbUWy1JxxkSGSd4cu4dMBK5ChilbFud8",
  ),
  Pet(
    "Bird",
    "Parrot",
    14,
    "https://drive.google.com/uc?export=view&id=1B9eAFq_9D75eXtn0BJM6gtq811eby6QN",
  ),
  Pet(
    "Bird",
    "Pink Bird",
    15,
    "https://drive.google.com/uc?export=view&id=1Sg8plSKxYt1kRQn_DH_OdvHiE2FoeQah",
  ),
  Pet(
    "Bird",
    "Talking Parrot",
    17,
    "https://drive.google.com/uc?export=view&id=1Sg8plSKxYt1kRQn_DH_OdvHiE2FoeQah",
  ),
  Pet(
    "Rat",
    "Hamster",
    9,
    "https://drive.google.com/uc?export=view&id=11tVuPyyv23mByiFNHrJRuE55gyhMrGA2",
  ),
  Pet(
    "Rabbit",
    "Brown Rabbit",
    16,
    "https://drive.google.com/uc?export=view&id=1huzYq6qlL4BiFzXqD7SuMYM67J5Ea0bV",
  ),
  Pet(
    "Rabbit",
    "Gray Rabbit",
    17,
    "https://drive.google.com/uc?export=view&id=1lxI-yXMPIp2nz2MLc7duJ5Sw6lrA-AsJ",
  ),
];

class PetMarket extends StatefulWidget {
  const PetMarket({super.key});

  @override
  _PetMarketState createState() => _PetMarketState();
}

class _PetMarketState extends State<PetMarket> {
  List<Pet> displayedPets = petList;

  void _filterPets(String query) {
    final pets = petList.where((pet) {
      final petTypeLower = pet.type.toLowerCase();
      final searchLower = query.toLowerCase();

      return petTypeLower.contains(searchLower);
    }).toList();

    setState(() {
      displayedPets = pets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Pet Market',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: textFieldOfSearch(),
          ),
          Expanded(
            child: listViewOfPets(),
          ),
        ],
      ),
    );
  }

  ListView listViewOfPets() {
    return ListView.builder(
      itemCount: displayedPets.length,
      itemBuilder: (context, index) {
        final pet = displayedPets[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              child: Row(
            children: [
              Expanded(
                child: Image.network(
                  pet.imageUrl,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        pet.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        pet.type,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icon.png',
                          height: 26,
                        ),
                        SizedBox(width: 8.0),
                        Text('Pet Love: ${pet.petLove}'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
        );
      },
    );
  }

  TextField textFieldOfSearch() {
    return TextField(
      onChanged: _filterPets,
      decoration: InputDecoration(
        labelText: 'Search by pet type',
        prefixIcon: Icon(
          Icons.search,
          color: Colors.yellow[400],
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
