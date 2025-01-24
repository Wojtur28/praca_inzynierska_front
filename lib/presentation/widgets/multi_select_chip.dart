import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final List<String> items;
  final List<String> initialSelected;
  final Function(List<String>) onSelectionChanged;
  final String label;

  const MultiSelectChip({
    super.key,
    required this.items,
    required this.initialSelected,
    required this.onSelectionChanged,
    required this.label,
  });

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices = [];

  @override
  void initState() {
    super.initState();
    selectedChoices = List.from(widget.initialSelected);
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: widget.items.map((item) {
            final bool isSelected = selectedChoices.contains(item);
            return FilterChip(
              label: Text(
                item,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight:
                  isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              selected: isSelected,
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    selectedChoices.add(item);
                  } else {
                    selectedChoices.remove(item);
                  }
                  widget.onSelectionChanged(selectedChoices);
                });
              },
              selectedColor: primaryColor,
              backgroundColor: isSelected
                  ? primaryColor
                  : Colors.transparent,
              side: BorderSide(
                color: primaryColor,
                width: 1,
              ),
              padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
