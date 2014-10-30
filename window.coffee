Function.delay = (amount, f) -> setTimeout(f, amount)

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

document.body.addEventListener "input", (event) ->
  renderMailToOutput()

document.body.addEventListener "keydown", (event) ->
  if event.keyCode is 13 and document.activeElement.id is "title_input"
    document.body.querySelector("#commit_input").click()

document.body.addEventListener "click", (event) ->
  if /commit_input/.test event.target.id
    if event.target.classList.contains("activated")
      event.preventDefault()
    else
      event.target.classList.add("activated")
      event.target.parentNode.querySelector("#mail_to_output").click()
      Function.delay 999, -> event.target.classList.remove("activated")
  if /mail_to_output/.test event.target.id
    renderMailToOutput()

renderMailToOutput = (event) ->
  document.body.querySelector("#mail_to_output").href = proposalMailToURL()

proposalMailToURL = ->
  titleInput = document.body.querySelector "#title_input"
  abstractInput = document.body.querySelector "#abstract_input"
  audienceInput = document.body.querySelector "#audience_input"
  biographyInput = document.body.querySelector "#biography_input"
  address = encodeURIComponent "input@ottawa.accessibility.unconference.ca"
  subject = encodeURIComponent titleInput.value or titleInput.placeholder
  body = encodeURIComponent """
    Abstract:
    #{abstractInput.value or abstractInput.placeholder}

    Audience:
    #{audienceInput.value or audienceInput.placeholder}

    Biography:
    #{biographyInput.value or biographyInput.placeholder}
  """
  return "mailto:#{address}?Subject=#{subject}&Body=#{body}"

proposalsContainer = document.body.querySelector "#proposals_container"
proposalsContainer.scrollLeft = proposalsContainer.scrollWidth
proposalSurface = document.body.querySelector "#proposals div.surface"
proposals = document.body.querySelectorAll "#proposals article.proposal"
proposalSurface.style.width = (proposals.length * 355) + "px"
document.body.classList.add("ready")
