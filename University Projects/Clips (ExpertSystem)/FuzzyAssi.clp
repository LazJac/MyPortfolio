(deftemplate speed 
	0 60 minutes
	(
		(fast (5 1)(15 0) )
		(medium (10 0)(25 1)(40 0) )
		(slow (30 0)(45 1) )
	)
)

(deftemplate TipConstrants 
	(slot meal)
	(slot service (type FUZZY-VALUE speed))
	(slot maxi)
)

(deftemplate checklist
	(slot isFast)
	(slot isMedium)
	(slot isSlow)
)

(deffacts init
	(checklist (isFast nil)(isMedium nil)(isSlow nil))
)


(defrule Start ;rule
	(declare (salience 2))

	=>
	(printout t "How much did the meal cost?: (R)" crlf)
	(bind ?meal (readline))
	(printout t "Was the service ..." crlf "	1 - Fast" crlf "	2 - Medium" crlf "	3 - Slow" crlf)
	(bind ?ans (readline))
	(printout t "What is the highest percentage tip you are willing to give?: (%)")
	(bind ?max (readline))
	
	(if (eq ?ans "1")
	then
		(assert(TipConstrants (meal ?meal)(service fast)(maxi ?max)))
	else
		(if (eq ?ans "2")
		then
			(assert(TipConstrants (meal ?meal)(service medium)(maxi ?max)))
		else
			(if (eq ?ans "3")
			then
				(assert(TipConstrants (meal ?meal)(service slow)(maxi ?max)))
			else
				(exit)
			)
		)
	)
)

(defrule rule1 
	(declare (salience 1))
	
	(TipConstrants (meal ?)(service fast)(maxi ?) ) 
	?f1 <- (checklist (isFast ?)(isMedium ?)(isSlow ?))
	=>
	(modify ?f1 (isFast "yes"))
)

(defrule rule2 
	(declare (salience 1))
	
	(TipConstrants (meal ?)(service medium)(maxi ?) ) 
	?f1 <- (checklist (isFast ?)(isMedium ?)(isSlow ?))
	=>
	(modify ?f1 (isMedium "yes"))
)

(defrule rule3 
	(declare (salience 1))
	
	(TipConstrants (meal ?)(service slow)(maxi ?) ) 
	?f1 <- (checklist (isFast ?)(isMedium ?)(isSlow ?))
	=>
	(modify ?f1 (isSlow "yes"))
)

(defrule rule4 
	(declare (salience 0))
	
	(TipConstrants (meal ?meal)(service ?)(maxi ?maxi)) 
	(checklist (isFast ?f)(isMedium ?m)(isSlow ?s))
	=>
	(if (eq ?f "yes")
	then
		(bind ?ans (/ (* (numberp ?meal) (* (/ 75 100) (numberp ?maxi)) 100) ))
	else
		(if (and (eq ?m "yes") (eq ?m "yes") (eq ?m "yes") )
		then
			(bind ?ans (/ (* (numberp ?meal) (* (/ 50 100) (numberp ?maxi)) 100) ))
		else
			(if (eq ?s "yes")
			then
				(bind ?ans (/ (* (numberp ?meal) (* (/ 25 100) (numberp ?maxi)) 100) ))
			)
		)
	)
	(printout t crlf "Tip should be about: R" ?ans crlf)
)















