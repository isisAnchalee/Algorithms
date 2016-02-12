
function Model() {
};

Model.prototype.set = function(key, value) {
  this.dataStore[key] = value;
  this.checkEventStore('set');
};

Model.prototype.get = function(key) {
  this.checkEventStore('get');
  return this.dataStore[key];
};

Model.prototype.checkEventStore = function(eventType) {
  if (this.eventStore[eventType]) {
    this.eventStore[eventType].forEach(function(callback) {
      callback.call(this);
    });
  }
};

Model.prototype.on = function(eventType, callback) {
  if(this.eventStore[eventType]) {
    this.eventStore[eventType].push(callback);
  } else {
    this.eventStore[eventType] = [callback];
  }
};

Model.prototype.eventStore = {};
Model.prototype.dataStore = {};

var cat = new Model();

cat.on('set', function () {
  console.log('the cat is changing');
});

cat.on('set', function () {
  console.log('the cat is changing again');
});

// cat.on('access')

cat.set('set', 'OH NOSE');
cat.set('name',"pepe")
console.log(cat.get("name"));
