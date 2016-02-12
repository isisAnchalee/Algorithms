var each = function(collection, callback) {
  if (Array.isArray(collection)) {
    var length = collection.length;

    for (var i = 0; i < length; i++) {
      callback(collection[i], i, collection);
    }
  } else {
    for (var key in collection) {
      callback(collection[key], key, collection);
    }
  }
};

var map = function(collection, callback) {
  var result = [];

  each(collection, function(el) {
    result.push(callback(el));
  });

  return result;
};

var filter = function(collection, predicate) {
  var result = [];

  each(collection, function(el) {
    if (predicate(el)) {
      result.push(el);
    }
  });

  return result;
};

var reject = function(collection, predicate) {
  return filter(collection, function(el) {
    return !predicate(el);
  });
};

var reduce = function(collection, callback) {
  var base = collection[0];
  collection.slice(1).forEach(function(el) {
    base = callback(base, el);
  });

  return base;
};

var flatten = function(collection) {
  var flattened = [];

  collection.forEach(function(el) {
    if (Array.isArray(el)) {
      flattened = flattened.concat(flatten(el));
    } else {
      flattened.push(el)
    }
  });

  return flattened;
};

var uniq = function(array) {
  var dupFreeArr = [];
  var seen = {};

  for(var i = 0; i < array.length; i++){
    if(!seen[array[i]]){
      dupFreeArr.push(array[i])
      seen[arr[i]] = true;
    }
  }
  return dupFreeArr;
};


var find = function(collection, predicate) {
var len = collection.length;
var i = 0;

  while (i < len) {
    if (predicate(collection[i])) {
      return collection[i];
    }
    i --;
  }
}
