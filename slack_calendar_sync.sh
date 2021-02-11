#!/bin/bash
# slack-status-calendar-sync
PATH="$PATH:$HOME/brew/bin"
all=$(icalBuddy -nc -iep title eventsToday)
now=$(icalBuddy -ea -nc -iep title eventsNow)
case $all in
  *WFH*)
    default_status="Working remotely"
    default_icon=":house_with_garden:"
    default_menu="#h"
    default_exit=false
    ;;
  *Sick*)
    default_status="Out sick"
    default_icon=":face_with_thermometer:"
    default_menu="#s"
    default_exit=true
    ;;
  *Vacation* | *OoO*)
    default_status="Vacation/Day Off"
    default_icon=":palm_tree:"
    default_menu="#v"
    default_exit=true
    ;;
  *OoO*)
    default_status="Out of office"
    default_icon=":office:"
    default_menu="#o"
    default_exit=true
    ;;
  *)
    default_status=""
    default_exit=false
    ;;
esac
if $default_exit; then
  slack status edit "$default_status" $default_icon >/dev/null
  echo -e "$default_menu\n---\n$default_status"
  exit 0
fi
if [ -z "$now" ]; then
  if [ -z "$default_status" ]; then
    slack status clear >/dev/null
    echo "#"
  else
    slack status edit "$default_status" $default_icon >/dev/null
    echo -e "$default_menu\n---\n$default_status"
  fi
elif [[ $now == *Lunch* ]]; then
  slack status edit "Out for lunch" :hamburger: >/dev/null
  echo -e "#l\n---\nOut for lunch"
elif [[ $now == *OoO* ]]; then
  slack status edit "Out of office" :office: >/dev/null
  echo -e "#o\n---\nOut of office"
else
  slack status edit "In a meeting" :spiral_calendar_pad: >/dev/null
  echo -e "#m\n---\nIn a meeting"
fi
