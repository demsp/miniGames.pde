// https://github.com/nature-of-code/NOC-S17-2-Intelligence-Learning/blob/master/week1-graphs/01_binary_tree/tree.js

var tree;

function setup() {
 // noCanvas();
createCanvas(500,500);

  // New tree
  tree = new Tree();

  // Add ten random values
  for (var i = 0; i < 10; i++) {
    tree.addValue(floor(random(0, 100)));
  }

  // Traverse the tree 
  tree.traverse();

  // Search the tree for 10
  var result = tree.search(10);
  if (result == null) {
    console.log('not found');
  } else {
    console.log(result);
  }
}
//###########################
function Node(val) {
  this.value = val;
  this.left = null;
  this.right = null;
}

// Search the tree for a value

Node.prototype.search = function(val) {
  if (this.value == val) {
    return this;
  } else if (val < this.value && this.left != null) {
    return this.left.search(val);
  } else if (val > this.value && this.right != null) {
    return this.right.search(val);
  }
  return null;
};


// Visit a node
Node.prototype.visit = function() {
  // Recursively go left
  if (this.left != null) {
    this.left.visit();
  }
  // Print out value
  console.log(this.value);
  noStroke();
  text(this.value,this.x,this.y);
  // Recursively go right
  if (this.right != null) {
    this.right.visit();
  }
};

// Add a node
Node.prototype.addNode = function(n) {
  if (n.value < this.value) {
    if (this.left == null) {
      this.left = n;
    } else {
      this.left.addNode(n);
    }
  } else if (n.value > this.value) {
    if (this.right == null) {
      this.right = n;
    } else {
      this.right.addNode(n);
    }
  }
};
// end Node


// Tree object
function Tree() {
  // Just store the root
  this.root = null;
}

// Start by visiting the root
Tree.prototype.traverse = function() {
  this.root.visit();
};

// Start by searching the root
Tree.prototype.search = function(val) {
  var found = this.root.search(val);
  return found;
};

// Add a new value to the tree
Tree.prototype.addValue = function(val) {
  var n = new Node(val);
  if (this.root == null) {
    this.root = n;
    this.root.x=width/2;
    this.root.y=height/2;
  } else {
    this.root.addNode(n);
  }
};
