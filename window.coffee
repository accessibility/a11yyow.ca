Function.delay = (amount, f) -> setTimeout(f, amount)

proposalsContainer = document.body.querySelector("#proposals_container")
proposalsContainer.scrollLeft = proposalsContainer.scrollWidth
proposals = document.body.querySelectorAll("#proposals_container article.proposal")
document.body.querySelector("#proposals_container div.surface").style.width = (proposals.length * 355) + "px"

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
    event.target.classList.add("activated")
    event.target.parentNode.querySelector("#mail_to_output").click()
    Function.delay 999, -> event.target.classList.remove("activated")
  if /mail_to_output/.test event.target.id
    renderMailToOutput()

renderMailToOutput = (event) ->
  document.body.querySelector("#mail_to_output").href = proposalMailToURL()

proposalMailToURL = ->
  address = encodeURIComponent "input@ottawa.accessibility.unconference.ca"
  subject = encodeURIComponent "Proposal for the Ottawa Accessibility Unconference"
  body    = encodeURIComponent """
    Title:
    #{document.body.querySelector("#title_input").value}

    Abstract:
    #{document.body.querySelector("#abstract_input").value}

    Audience:
    #{document.body.querySelector("#audience_input").value}

    Biography:
    #{document.body.querySelector("#biography_input").value}
  """
  "mailto:#{address}?Subject=#{subject}&Body=#{body}"
