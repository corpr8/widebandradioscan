#!/bin/bash
echo Starting survey

#get working directory
DIR=$(pwd)

#output directory
OUTDIR="../netStorage"

if pidof -x "rtl_power" >/dev/null; then
    echo "RTL already running - aborting new instance"
    exit;
fi

div ()  # Arguments: dividend and divisor
{
	if [ $2 -eq 0 ]; then echo division by 0; exit; fi
        p=12                            # precision
        c=${c:-0}                       # precision counter
        d=.                             # decimal separator
        r=$(($1/$2)); echo -n $r        # result of division
        m=$(($r*$2))
        [ $c -eq 0 ] && [ $m -ne $1 ] && echo -n $d
        [ $1 -eq $m ] || [ $c -eq $p ] && return
        d=$(($1-$m))
        let c=c+1
        div $(($d*10)) $2
}

COUNT=50
SURVEYNAME="SurveySweep-"`date +%Y-%m-%d-%H-%M-%S`
echo "SurveyName will be:" $SURVEYNAME

mkdir ../netStorage/$SURVEYNAME

while [ $COUNT -lt 350 ]
do
  COUNTNEXT=$((COUNT+50))
  sh $DIR/runSurvey1.sh $COUNT $COUNTNEXT 10k 27 1s 5m $COUNT-$COUNTNEXT
  mv $COUNT-$COUNTNEXT.jpg $OUTDIR/$SURVEYNAME
  COUNT=$COUNTNEXT
done

cp $DIR/template/index.html $OUTDIR/$SURVEYNAME
cp $DIR/template/myScript.js $OUTDIR/$SURVEYNAME
cp $DIR/template/style.css $OUTDIR/$SURVEYNAME
