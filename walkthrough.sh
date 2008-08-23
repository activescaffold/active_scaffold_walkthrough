#!/bin/sh
cd `dirname "$0"`
git config color.diff auto

STEP_INDEX_FILE=".step_index"
let TOTAL_STEPS="`git rev-list master | wc -l | awk '{print $1}'` - 4"

reset () {
  rm -f "$STEP_INDEX_FILE"
  git checkout -q master > /dev/null
}

show_help () {
  cat <<EOF
$0 [start|next|prev|restart|abort|show|help]

Commands:

restart - start over
abort   - stop
start   - start stepping through the history
next    - one step forward in history
prev    - one step back in history
show    - show the info and diff for the current commit
    
EOF
}

write_step_index () {
  printf "$STEP_INDEX" > $STEP_INDEX_FILE
}

show_commit_one_liner () {
  git log HEAD^..HEAD --pretty=oneline
}

checkout_step () {
  let steps_from_head="$TOTAL_STEPS - $STEP_INDEX - 1"
  git checkout -q master~$steps_from_head > /dev/null
}

prev () {
  step "-1"
}

started () {
  if [ -f "$STEP_INDEX_FILE" ]; then
    return 0
  else
    return 1
  fi
}

next () {
  started && step 1 || step 0
}

read_step_index() {
  if [ -f $STEP_INDEX_FILE ]; then
    cat $STEP_INDEX_FILE
  else
    printf 0
  fi
}

step () {
  let STEP_INDEX="`read_step_index` + $1"

  case $STEP_INDEX in
    $TOTAL_STEPS)
      echo "Done"
      reset
      exit
      ;;
    0)
      STEP_INDEX=1
      ;;
  esac
  checkout_step
  show_commit_one_liner
  write_step_index $STEP_INDEX
}


case "$1" in
  restart)
    reset
    next
    ;;
  abort) 
    echo "Aborted."
    reset
    ;;
  help)
    show_help
    ;;
  show)
    git show HEAD
    ;;
  prev)
    prev
    ;;
  next)
    next
    ;;
  start)
    echo 0 > $STEP_INDEX_FILE
    next
    ;;
  *)
    show_help
    ;;
esac
