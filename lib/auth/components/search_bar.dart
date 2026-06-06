import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late final FocusNode _focusNode;
  late TextEditingController _textEditingController;
  bool _isTextFieldVisible = false;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textEditingController = TextEditingController();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          _isTextFieldVisible = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        width: 250,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).colorScheme.inversePrimary,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                _isSearching ? Icons.arrow_back : Icons.search,
                color: Theme.of(context).colorScheme.inversePrimary,

              ),
              onPressed: () {
                if (!_isTextFieldVisible) {
                  setState(() {
                    _isSearching = true;
                    _isTextFieldVisible = true;
                    _focusNode.requestFocus();
                  });
                } else {
                  setState(() {
                    _isSearching = false;
                    _isTextFieldVisible = false;
                    _focusNode.unfocus();
                    _textEditingController.clear();
                  });
                }
              },
              padding: EdgeInsets.zero,
              color: const Color.fromARGB(0, 255, 0, 0),
              iconSize: 24,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (!_isTextFieldVisible) {
                    setState(() {
                      _isSearching = true;
                      _isTextFieldVisible = true;
                      _focusNode.requestFocus();
                    });
                  }
                },
                child: _isTextFieldVisible
                    ? Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _textEditingController,
                              focusNode: _focusNode,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  return;
                                }
                                setState(() {
                                  _isTextFieldVisible = false;
                                  _focusNode.unfocus();
                                });
                              },
                              onSubmitted: (String value) {
                                setState(() {
                                  _isTextFieldVisible = false;
                                });
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                              ),
                              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,),
                              cursorColor: Theme.of(context).colorScheme.inversePrimary,

                              autofocus: true,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                _textEditingController.clear();
                              });
                            },
                            color: Theme.of(context).colorScheme.inversePrimary,
                            iconSize: 24,
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}