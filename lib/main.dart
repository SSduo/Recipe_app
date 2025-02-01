import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Splash Screen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RecipePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant_menu,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Recipe App',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Recipe Page
class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  int _selectedRecipe = 0;

  final List<String> _recipeImages = [
    'assets/sushi.jpg', // Local asset for Sushi
    'assets/ramen.jpg', // Local asset for Ramen
    'assets/tempura.jpg', // Local asset for Tempura
  ];

  final List<String> _recipes = [
    '''
**Sushi Recipe**
- Ingredients:
  - 2 cups sushi rice
  - 4 cups water
  - 1/2 cup rice vinegar
  - 1 tbsp sugar
  - 1 tsp salt
  - Nori (seaweed sheets)
  - Fresh fish or vegetables for filling

- Instructions:
  1. Rinse the sushi rice until the water runs clear.
  2. Cook the rice with water in a rice cooker.
  3. Mix rice vinegar, sugar, and salt in a small bowl.
  4. Spread the rice on a flat surface and let it cool.
  5. Place a nori sheet on a bamboo mat, spread rice evenly, add fillings, and roll tightly.
  6. Slice into pieces and serve with soy sauce.
''',
    '''
**Ramen Recipe**
- Ingredients:
  - 200g ramen noodles
  - 4 cups chicken broth
  - 2 tbsp soy sauce
  - 1 tbsp miso paste
  - 1 boiled egg
  - Sliced pork (chashu)
  - Green onions, sliced

- Instructions:
  1. Cook ramen noodles according to package instructions.
  2. In a pot, heat chicken broth, soy sauce, and miso paste.
  3. Add cooked noodles to the broth.
  4. Top with sliced pork, boiled egg, and green onions.
  5. Serve hot.
''',
    '''
**Tempura Recipe**
- Ingredients:
  - 1 cup all-purpose flour
  - 1 egg
  - 1 cup ice-cold water
  - Assorted vegetables (e.g., sweet potato, zucchini)
  - Shrimp or other seafood

- Instructions:
  1. Mix flour, egg, and ice-cold water to make the batter.
  2. Dip vegetables and seafood into the batter.
  3. Fry in hot oil until golden brown.
  4. Serve with tempura dipping sauce.
''',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Japanese Recipes'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        color: Colors.orange[50],
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Select a Recipe:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Radio(
                  value: 0,
                  groupValue: _selectedRecipe,
                  onChanged: (value) {
                    setState(() {
                      _selectedRecipe = value!;
                    });
                  },
                ),
                Text('Sushi'),
                Radio(
                  value: 1,
                  groupValue: _selectedRecipe,
                  onChanged: (value) {
                    setState(() {
                      _selectedRecipe = value!;
                    });
                  },
                ),
                Text('Ramen'),
                Radio(
                  value: 2,
                  groupValue: _selectedRecipe,
                  onChanged: (value) {
                    setState(() {
                      _selectedRecipe = value!;
                    });
                  },
                ),
                Text('Tempura'),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      _recipeImages[_selectedRecipe],
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 20),
                    Text(
                      _recipes[_selectedRecipe],
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}