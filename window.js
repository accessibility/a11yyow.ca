// Generated by CoffeeScript 1.8.0
(function() {
  var proposalsContainer;

  document.body.addEventListener("focusin", function(event) {
    var element, filtered, parents;
    element = /_input/.test(event.target.id) ? (element = event.target, parents = ((function() {
      var _ref, _results;
      _results = [];
      while ((_ref = element.parentNode) != null ? _ref.classList : void 0) {
        _results.push(element = element.parentNode);
      }
      return _results;
    })()), filtered = parents.filter(function(element) {
      return element.classList.contains("proposal");
    }), filtered[0]) : event.target;
    return element.classList.add("activated");
  });

  document.body.addEventListener("focusout", function(event) {
    var element, _i, _len, _ref, _results;
    _ref = document.getElementsByClassName("activated");
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      element = _ref[_i];
      _results.push(element.classList.remove("activated"));
    }
    return _results;
  });

  proposalsContainer = document.body.querySelector("#proposals_container");

  proposalsContainer.scrollLeft = proposalsContainer.scrollWidth;

}).call(this);