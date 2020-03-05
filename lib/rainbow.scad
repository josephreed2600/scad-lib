function rainbow(numOfSteps, step) = 
(floor((step / numOfSteps) * 6)%6 == 0)?
	[1,         ((step / numOfSteps) * 6 - floor((step / numOfSteps) * 6)) ,    0] :
(floor((step / numOfSteps) * 6)%6 == 1)?
	[      (1 - ((step / numOfSteps) * 6 - floor((step / numOfSteps) * 6))), 1, 0] :
(floor((step / numOfSteps) * 6)%6 == 2)?
	[0, 1,      ((step / numOfSteps) * 6 - floor((step / numOfSteps) * 6))       ] :
(floor((step / numOfSteps) * 6)%6 == 3)?
	[0,    (1 - ((step / numOfSteps) * 6 - floor((step / numOfSteps) * 6))),    1] :
(floor((step / numOfSteps) * 6)%6 == 4)?
	[           ((step / numOfSteps) * 6 - floor((step / numOfSteps) * 6)) , 0, 1] :
	[1, 0, (1 - ((step / numOfSteps) * 6 - floor((step / numOfSteps) * 6)))      ] ;

//(1 - ((step / numOfSteps) * 6 - floor((step / numOfSteps) * 6))) = 1 - ((step / numOfSteps) * 6 - floor((step / numOfSteps) * 6))
