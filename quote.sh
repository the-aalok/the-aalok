#!/bin/bash

quotes=(
  "Great software is built one focused day at a time.",
  "Every bug you solve is another step toward mastering your craft.",
  "Your career is written by the code you consistently ship.",
  "Discipline writes the code that motivation never starts.",
  "Success isn't about knowing every language—it's about never stopping learning.",
  "Focus on building skills today, and opportunities will find you tomorrow.",
  "Dream boldly, code relentlessly, and let your work speak for itself."
)

day=$(date +%w)
quote="${quotes[$day]}"

awk -v new_quote="$quote" '
/^quote:/ {
    print "quote: " new_quote
    next
}
{ print }
' README.md > README.tmp

mv README.tmp README.md
