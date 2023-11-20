import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Dog> dogList = [
    Dog(
      0,
      "Hachiko",
      3.5,
      "Male",
      "Brown",
      12.9,
      "389m away",
      "ressources/drawable/blue_dog.png",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
      Owner(
        "John Doe",
        "Dog Trainer",
        "ressources/drawable-v24/owner.png",
      ),
    ),
    // Add more dogs as needed...
    Dog(
      0,
      "Buddy",
      2.5,
      "Male",
      "White",
      10.5,
      "421m away",
      "ressources/drawable/white_dog.png",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
      Owner(
        "Jane Smith",
        "Dog Enthusiast",
        "ressources/drawable-v24/owner.png",
      ),
    ),
    Dog(
      0,
      "Max",
      4.0,
      "Male",
      "Orange",
      15.0,
      "300m away",
      "ressources/drawable/orange_dog.png",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
      Owner(
        "Alice Johnson",
        "Animal Lover",
        "ressources/drawable-v24/owner.png",
      ),
    ),
    Dog(
      0,
      "Ruby",
      2.0,
      "Female",
      "Red",
      8.5,
      "250m away",
      "ressources/drawable/red_dog.png",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry...",
      Owner(
        "Bob Brown",
        "Pet Trainer",
        "ressources/drawable-v24/owner.png",
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Dog List")),
        body: ListView.builder(
          itemCount: dogList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to the detail page when a list item is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DogDetailPage(dog: dogList[index]),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  leading: Image.asset(
                    dogList[index].imagePath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(dogList[index].name),
                  subtitle: Text(
                    "Age: ${dogList[index].age} years\n"
                    "Gender: ${dogList[index].gender}\n"
                    "Color: ${dogList[index].color}\n"
                    "Weight: ${dogList[index].weight} kg\n"
                    "Distance: ${dogList[index].distance}\n"
                    "Owner: ${dogList[index].owner.name}",
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DogDetailPage extends StatelessWidget {
  final Dog dog;

  DogDetailPage({required this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dog.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              dog.imagePath,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text("Age: ${dog.age} years"),
            Text("Gender: ${dog.gender}"),
            Text("Color: ${dog.color}"),
            Text("Weight: ${dog.weight} kg"),
            Text("Distance: ${dog.distance}"),
            Text("Owner: ${dog.owner.name} (${dog.owner.occupation})"),
            Text("Description: ${dog.description}"),
          ],
        ),
      ),
    );
  }
}

class Owner {
  final String name;
  final String occupation;
  final String imagePath;

  const Owner(this.name, this.occupation, this.imagePath);
}

class Dog {
  final int id;
  final String name;
  final double age;
  final String gender;
  final String color;
  final double weight;
  final String distance;
  final String imagePath;
  final String description;
  final Owner owner;

  const Dog(
    this.id,
    this.name,
    this.age,
    this.gender,
    this.color,
    this.weight,
    this.distance,
    this.imagePath,
    this.description,
    this.owner,
  );
}
