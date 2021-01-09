class Frame {
  int number;

  Frame(this.number);

  @override
  bool operator ==(Object other) {
    if(other is Frame){
      return number == other.number;
    }
    return false;
  }

  @override
  int get hashCode => number.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'number' : number,
    };
  }
}