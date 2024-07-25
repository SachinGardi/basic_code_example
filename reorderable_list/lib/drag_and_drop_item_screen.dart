import 'package:flutter/material.dart';

class DragAndDropItem extends StatefulWidget {
  final List<String> items;
  const DragAndDropItem({super.key,required this.items});

  @override
  State<DragAndDropItem> createState() => _DragAndDropItemState();
}

class _DragAndDropItemState extends State<DragAndDropItem> {

  final List<String> _items = [];

  @override
  void initState() {
    _items.addAll(widget.items);
    super.initState();
  }

  void _onReorder(int oldIndex, int newIndex){
        setState(() {
          if(newIndex > oldIndex){
            newIndex-= 1;
          }

          final String item  = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
  }

  @override
  Widget build(BuildContext context) {
    print(_items.length);
    return Scaffold(
    appBar: AppBar(
      title: Text('Reorder Item Widget'),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
      body: ReorderableListView(

          onReorder: _onReorder,
          children:_items.map((item){
            return      ListTile(
              key: ValueKey(item),
              title: Text(item),
              trailing: Icon(Icons.drag_handle),
            );
          }) .toList()

      ),
    );
  }
}
