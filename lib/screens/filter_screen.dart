import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const RouteName = 'filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filter Screen"),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                      "Gluten-free",
                      "only include gluten-free meals",
                      _glutenFree, (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                      print("gluten");
                      print(_glutenFree);
                    });
                  }),
                  _buildSwitchListTile(
                      "Lactose-free",
                      "only include lactose-free meals",
                      _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                      print("lactose");
                      print(_lactoseFree);
                    });
                  }),
                  _buildSwitchListTile("Vegetarian",
                      "only include Vegetarian meals", _vegetarian, (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                      print("Vegetarian");
                      print(_vegetarian);
                    });
                  }),
                  _buildSwitchListTile(
                      "Vegan", "only include Vegan meals", _vegan, (newValue) {
                    setState(() {
                      _vegan = newValue;
                      print("Vegan");
                      print(_vegan);
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
