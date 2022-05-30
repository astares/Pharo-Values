Extension { #name : #Color }

{ #category : #'*Values-Core' }
Color >> asColorValue [

	^ ColorValue red: self red green: self green blue: self blue
]
