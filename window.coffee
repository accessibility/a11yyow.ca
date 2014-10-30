document.body.addEventListener "focusin", (event) ->
  element = if /_input/.test event.target.id
    event.target.parentNode.parentNode
  else
    event.target
  element.classList.add("focused")

document.body.addEventListener "focusout", (event) ->
  element.classList.remove("focused") for element in document.getElementsByClassName("focused")

proposalsContainer = document.body.querySelector("#proposals_container")
proposalsContainer.scrollLeft = proposalsContainer.scrollWidth
