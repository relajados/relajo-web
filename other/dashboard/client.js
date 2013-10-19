var Firebase = require('firebase');
var myRootRef = new Firebase('https://relajoapp.firebaseio.com');
myRootRef.on('child_added', function(childSnapshot, prevChildName) {
  console.log(childSnapshot.val());
});
