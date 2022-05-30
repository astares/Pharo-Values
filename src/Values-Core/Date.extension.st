Extension { #name : #Date }

{ #category : #'*Values-Core' }
Date class >> d: dayInteger m: monthInteger y: yearInteger [

	^ self year: yearInteger month: monthInteger day: dayInteger
]
