import 'dart:convert';

import 'package:MyZoo/models/animal.dart';
import 'package:test/test.dart';

void main() {
  test("Animals with same property are equal", () {
    Animal animal = Animal(
        name: "Shit",
        description: "This is a monkey",
        type: "Monkey",
        image: "something",
        sound: "Garchu");

    Animal animal1 = Animal(
        name: "Shit",
        description: "This is a monkey",
        type: "Monkey",
        image: "something",
        sound: "Garchu");

    equals(animal == animal1);
  });

  test("Animals with different property are not equal", () {
    Animal animal = Animal(
        name: "shitty",
        description: "This is a monkey",
        type: "Monkey",
        image: "something",
        sound: "Garchu");

    Animal animal1 = Animal(
        name: "Shit",
        description: "This is a monkey",
        type: "Monkey",
        image: "something",
        sound: "Garchu");

    equals(animal != animal1);
  });

  test("Animals can be created from map", () {
    Animal animal = Animal.fromMap({
      "name": "Shit",
      "description": "This is a monkey",
      "type": "Monkey",
      "image": "something",
      "sound": "Garchu"
    });

    equals(animal.name != null);
    equals(animal.name == "Shit");
    equals(animal.description != null);
    equals(animal.description == "This is a monkey");
    equals(animal.type != null);
    equals(animal.type == "Monkey");
    equals(animal.image != null);
    equals(animal.image == "something");
    equals(animal.sound != null);
    equals(animal.sound == "Garchu");
  });

  test("Animals created from map will have field null if field not in map", () {
    Animal animal = Animal.fromMap({
      "name": "Shit",
      "description": "This is a monkey",
      "type": "Monkey",
      "image": "something"
    });

    equals(animal.sound == null);
  });

  test("Animals can be created from json", () {
    Animal animal = Animal.fromJson(jsonEncode({
      "name": "Shit",
      "description": "This is a monkey",
      "type": "Monkey",
      "image": "something",
      "sound": "Garchu"
    }));

    equals(animal.name != null);
    equals(animal.name == "Shit");
    equals(animal.description != null);
    equals(animal.description == "This is a monkey");
    equals(animal.type != null);
    equals(animal.type == "Monkey");
    equals(animal.image != null);
    equals(animal.image == "something");
    equals(animal.sound != null);
    equals(animal.sound == "Garchu");
  });

  test("Animals created from Json will have null if field not exists in json",
      () {
    Animal animal = Animal.fromJson(jsonEncode({
      "name": "Shit",
      "description": "This is a monkey",
      "type": "Monkey",
      "image": "something"
    }));

    equals(animal.sound == null);
  });

  test("Animals properties can be copied with other values", () {
    Animal animal = Animal(
        name: "shitty",
        description: "This is a monkey",
        type: "Monkey",
        image: "something",
        sound: "Garchu");

    Animal animal1 = animal.copyWith(
        name: "Someone",
        description: "This is someone",
        type: "Dog",
        image: "lol");

    equals(animal1.name == "Someone");
    equals(animal1.description == "This is someone");
    equals(animal1.type == "Dog");
    equals(animal1.image == "lol");
    equals(animal1.sound == "Garchu");
  });
}
