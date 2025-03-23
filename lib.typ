
#let project_empty(body) = {
  set text(font: "Roboto")

  body
}

#let project_long(body) = {
  show: project_empty.with()

  body
}

#let project_short(body) = {
  show: project_empty.with()

  body
}
