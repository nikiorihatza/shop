class MapFunctions {
  int _getKeyIndex(Map<Object, Object> map, Object key) {
    int index = 0;

    for (Object o in map.keys) {
      if (o == key) {
        return index;
      }
      index++;
    }
    throw Exception('Invalid key');
  }

  Object getValue(Map<Object, Object> map, Object key) {
    int index = _getKeyIndex(map, key);

    if (map.containsKey(key)) {
      return map.values.elementAt(index);
    }

    throw Exception('Invalid key');
  }
}