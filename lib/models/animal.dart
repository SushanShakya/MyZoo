import 'dart:convert';

class Animal {
  String name;
  String image;
  String description;
  String sound;
  String type;
  
  Animal({
    this.name,
    this.image,
    this.description,
    this.sound,
    this.type,
  });

  Animal copyWith({
    String name,
    String image,
    String description,
    String sound,
    String type,
  }) {
    return Animal(
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      sound: sound ?? this.sound,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'sound': sound,
      'type': type,
    };
  }

  factory Animal.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Animal(
      name: map['name'],
      image: map['image'],
      description: map['description'],
      sound: map['sound'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Animal.fromJson(String source) => Animal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Animal(name: $name, image: $image, description: $description, sound: $sound, type: $type)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Animal &&
        o.name == name &&
        o.image == image &&
        o.description == description &&
        o.sound == sound &&
        o.type == type;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        description.hashCode ^
        sound.hashCode ^
        type.hashCode;
  }
}
