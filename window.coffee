document.body.addEventListener "focusin", (event) ->
  element.classList.remove("activated") for element in document.getElementsByClassName("activated") when element?.classList
  element = if /_input|mail_to_output/.test event.target.id
    element = event.target
    parents = (element = element.parentNode while element.parentNode?.classList)
    filtered = parents.filter (element) -> element.classList.contains("proposal")
    filtered[0]
  else
    event.target
  element.classList.add("activated")

proposalsContainer = document.body.querySelector("#proposals_container")
proposalsContainer.scrollLeft = proposalsContainer.scrollWidth

proposals = document.body.querySelectorAll("#proposals_container article.proposal")
document.body.querySelector("#proposals_container div.surface").style.width = (proposals.length * 355) + "px"

document.body.addEventListener "click", (event) ->
  if /commit_input/.test event.target.id
    event.target.classList.add("activated")
    console.info event.target.parentNode.querySelector("a[href^=mailto]")
  if /mail_to_output/.test event.target.id
    event.preventDefault()
    event.target.parentNode.focus()
