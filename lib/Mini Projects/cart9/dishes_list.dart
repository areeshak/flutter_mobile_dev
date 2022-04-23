//user select any item from this page and add to the cart
//items in cart can be view on cart_screen

import 'package:flutter/material.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'details.dart';
import 'cart_screen.dart';

class DishesListPage extends StatefulWidget {
  const DishesListPage({Key? key}) : super(key: key);

  @override
  State<DishesListPage> createState() => _DishesListPageState();
}

class _DishesListPageState extends State<DishesListPage> {

  List<Details> dishesDetails = [
    Details(type: 'D', dishName: 'Brownies'),
    Details(type: 'D', dishName: 'Cookies'),
    Details(type: 'D', dishName: 'Cupcakes'),
    Details(type: 'D', dishName: 'Cake'),
    Details(type: 'S', dishName: 'Wings'),
    Details(type: 'S', dishName: 'Garlic Bread'),
    Details(type: 'S', dishName: 'Fries'),
    Details(type: 'S', dishName: 'Chicken strips'),
    Details(type: 'S', dishName: 'Curly Fries'),
    Details(type: 'M', dishName: 'Pizza'),
    Details(type: 'M', dishName: 'Steak'),
    Details(type: 'M', dishName: 'Burger'),
    Details(type: 'M', dishName: 'Sandwich'),
    Details(type: 'M', dishName: 'Grilled Chicken'),
    Details(type: 'M', dishName: 'Roll'),
  ];

  List<Details> selectedDishes = [];

  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: ListView.separated(
        itemCount: dishesDetails.length,
        separatorBuilder: (context, index) => const Divider(
          color: Colors.black12,
        ),
        itemBuilder: (context, index) => ListTile(
          leading : CircleAvatar(child: Text(dishesDetails[index].type),
            backgroundColor:                                                     //dishes icon color based on their type/category
            (dishesDetails[index].type == 'D') ? Colors.purple :
            (dishesDetails[index].type == 'S') ? Colors.blueGrey :
            Colors.blue,
          ),
          title: Text(dishesDetails[index].dishName),
          trailing: GestureDetector(                                            //make trailing icon tappable to add/remove item
            onTap: () {
              setState(() {
                var item = dishesDetails[index];
                if(selectedDishes.contains(item) == true)
                {
                  selectedDishes.remove(item);
                }
                else
                {
                  selectedDishes.add(dishesDetails[index]);
                }
              });
            },
            child: selectedDishes.contains(dishesDetails[index]) ?
            const Icon(Icons.remove_circle, color: Colors.indigo, size: 28) :
            const Icon(Icons.add_circle, size: 28),
          ),
        ),
      ),
      floatingActionButton: Align(
        child:DraggableFab(                                                                      //makes floating action button draggable
          child: FloatingActionButton(
            child: const Icon(Icons.shopping_cart_sharp),
            onPressed: (){
              Navigator.of(context).push(                                                       //goes to cart screen
                MaterialPageRoute(
                  builder: (context) => CartScreen(
                    cartDetails: selectedDishes,
                    onUpdate: (value) {
                      String temp = value;
                      int index = selectedDishes.indexWhere((element) => element.dishName == temp);
                      selectedDishes.removeAt(index);                                        //remove from selected dishes list
                      setState(() {

                      });
                    },
                  ),
                ),
              );
            },
            elevation: 12,
          ),
        ),
        alignment: const Alignment(0.895,1),
      ),
    );
  }
}

