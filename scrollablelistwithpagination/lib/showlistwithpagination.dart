import 'package:flutter/material.dart';

class ShowListWithPagination extends StatefulWidget {
  const ShowListWithPagination({super.key});

  @override
  State<ShowListWithPagination> createState() => _ShowListWithPaginationState();
}

class _ShowListWithPaginationState extends State<ShowListWithPagination> {
  final List<String> _items = List.generate(50, (index) => 'Item $index');
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  bool _isLoading = false;

  void _loadMoreItems() {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });
// Simulate loading more items
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
          _items.addAll(List.generate(20, (index) => 'Item ${_items.length + index}'));
          _currentPage++;
        });
      });
    }
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _loadMoreItems();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paginated List'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length + (_isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _items.length) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListTile(
              title: Text(_items[index]),
            );
          }
        },
      ),
    );
  }
}
