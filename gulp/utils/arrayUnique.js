// Compacts an array removing duplicated elements


function arrayUnique(a) {
  return a.reduce(function(p, c) {
    if (p.indexOf(c) < 0) p.push(c);
    return p;
  }, []);
};

module.exports = arrayUnique;
