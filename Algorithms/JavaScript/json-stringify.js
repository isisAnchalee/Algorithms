// Write a function that takes in an object and serializes it to JSON.

JSON = {}

JSON.stringify = JSON.stringify || function (obj) {
  var stringified = '';
  var type  = typeof (obj);

  if (type != "object" || obj === null) {
    stringified += '"'+obj+'"';
    return stringified

  } else {
    var json = [], isArr = (obj && obj.constructor == Array);

    for (var key in obj) {
      var value = obj[key],
              t = typeof(value);
                    
      if (t == "string"){
        value = '"' + value + '"';
      } else if (t == "object" && value !== null){
        value = JSON.stringify(value);
      } 

      json.push((isArr ? "" : '"' + key + '":') + String(value));
    }

    return (isArr ? "[" : "{") + String(json) + (isArr ? "]" : "}");
  }

};

cat = { 'hi': 2, 'secondkey': {'test': 2 }, 'third-key': [1,2,3] }

JSON.stringify(cat)
