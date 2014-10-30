document.body.addEventListener "focusin", (event) ->
  element = if /_input/.test event.target.id
    element = event.target
    parents = (element = element.parentNode while element.parentNode?.classList)
    filtered = parents.filter (element) -> element.classList.contains("proposal")
    filtered[0]
  else
    event.target
  element.classList.add("focused")

document.body.addEventListener "focusout", (event) ->
  element.classList.remove("focused") for element in document.getElementsByClassName("focused")

proposalsContainer = document.body.querySelector("#proposals_container")
proposalsContainer.scrollLeft = proposalsContainer.scrollWidth
