// Generated by CoffeeScript 1.8.0
(function() {
  var proposalMailToURL, proposalSurface, proposals, proposalsContainer, renderMailToOutput;

  Function.delay = function(amount, f) {
    return setTimeout(f, amount);
  };

  document.body.addEventListener("focusin", function(event) {
    var element, filtered, parents, _i, _len, _ref;
    _ref = document.getElementsByClassName("activated");
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      element = _ref[_i];
      if (element != null ? element.classList : void 0) {
        element.classList.remove("activated");
      }
    }
    element = /_input|mail_to_output/.test(event.target.id) ? (element = event.target, parents = ((function() {
      var _ref1, _results;
      _results = [];
      while ((_ref1 = element.parentNode) != null ? _ref1.classList : void 0) {
        _results.push(element = element.parentNode);
      }
      return _results;
    })()), filtered = parents.filter(function(element) {
      return element.classList.contains("proposal");
    }), filtered[0]) : event.target;
    return element.classList.add("activated");
  });

  document.body.addEventListener("input", function(event) {
    return renderMailToOutput();
  });

  document.body.addEventListener("keydown", function(event) {
    if (event.keyCode === 13 && document.activeElement.id === "title_input") {
      return document.body.querySelector("#commit_input").click();
    }
  });

  document.body.addEventListener("click", function(event) {
    if (/commit_input/.test(event.target.id)) {
      if (event.target.classList.contains("activated")) {
        event.preventDefault();
      } else {
        event.target.classList.add("activated");
        event.target.parentNode.querySelector("#mail_to_output").click();
        Function.delay(999, function() {
          return event.target.classList.remove("activated");
        });
      }
    }
    if (/mail_to_output/.test(event.target.id)) {
      return renderMailToOutput();
    }
  });

  renderMailToOutput = function(event) {
    return document.body.querySelector("#mail_to_output").href = proposalMailToURL();
  };

  proposalMailToURL = function() {
    var abstractInput, address, audienceInput, biographyInput, body, subject, titleInput;
    titleInput = document.body.querySelector("#title_input");
    abstractInput = document.body.querySelector("#abstract_input");
    audienceInput = document.body.querySelector("#audience_input");
    biographyInput = document.body.querySelector("#biography_input");
    address = encodeURIComponent("input@ottawa.accessibility.unconference.ca");
    subject = encodeURIComponent(titleInput.value || titleInput.placeholder);
    body = encodeURIComponent("Abstract:\n" + (abstractInput.value || abstractInput.placeholder) + "\n\nAudience:\n" + (audienceInput.value || audienceInput.placeholder) + "\n\nBiography:\n" + (biographyInput.value || biographyInput.placeholder));
    return "mailto:" + address + "?Subject=" + subject + "&Body=" + body;
  };

  proposalsContainer = document.body.querySelector("#proposals_container");

  proposalsContainer.scrollLeft = proposalsContainer.scrollWidth;

  proposalSurface = document.body.querySelector("#proposals div.surface");

  proposals = document.body.querySelectorAll("#proposals article.proposal");

  proposalSurface.style.width = (proposals.length * 355) + "px";

  document.body.classList.add("ready");

}).call(this);
