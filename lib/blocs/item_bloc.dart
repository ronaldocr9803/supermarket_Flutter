import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/subjects.dart';
import 'package:supermarket/models/Items.dart';

class ItemBloc extends ChangeNotifier {
  final Item item;
  BehaviorSubject<Item> _subjectItem;

  Stream<int> get itemObservableCount => _subjectItem.stream.transform(numOfItem);
  ItemBloc(this.item) {
    _subjectItem = new BehaviorSubject<Item>();
  }

  final numOfItem = StreamTransformer<Item, int>.fromHandlers(
    handleData: (item, sink) {
      sink.add(item.count);
    }
  );

  void increment() {
    this.item.count++;
    _subjectItem.sink.add(this.item);
    
  } 

  static ItemBloc of(BuildContext context) {
    return Provider.of<ItemBloc>(context);
  }

  void decrement() {
    this.item.count--;
    _subjectItem.sink.add(this.item);
  }

  void dispose() {
    _subjectItem.close();
  }
  
  
}