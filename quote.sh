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
index=$((day % 7))

readme=$(cat README.md)
new_readme=$(echo "$readme" | awk -v new_quote="${quotes[$index]}" '/quote:/ {$0="quote: "new_quote} 1')

echo "$new_readme" > README.md

git add README.md
git commit -m "chore: update daily quote"
git push origin main
