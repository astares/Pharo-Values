Class {
	#name : #ColorValueTest,
	#superclass : #TestCase,
	#instVars : [
		'white',
		'black'
	],
	#category : #'Values-Core-Tests-Colors'
}

{ #category : #running }
ColorValueTest >> setUp [

	super setUp.
	white := ColorValue white.
	black := ColorValue black
]

{ #category : #tests }
ColorValueTest >> testConversionToByteArray [

	self 
		assert: black asByteArray equals: #[ 0 0 0 ];
		assert: white asByteArray equals: #[ 255 255 255 ]
		
]

{ #category : #tests }
ColorValueTest >> testConversionToColorValue [

	self 
		assert: black asColorValue identicalTo: black;
		assert: white asColorValue identicalTo: white
]

{ #category : #tests }
ColorValueTest >> testConversionToColorValueFromColor [

	self 
		assert: black asColorValue equals: (ColorValue red: 0 green: 0 blue: 0);
		assert: white asColorValue equals: (ColorValue red: 1 green: 1 blue: 1) 
]

{ #category : #tests }
ColorValueTest >> testConversionToGrayValue [

	self 
		assert: black asGrayValue equals: 0.0;
		assert: white asGrayValue equals: 1.0
]

{ #category : #tests }
ColorValueTest >> testNamedColors [

	self assert: ColorValue black class equals: ColorValue.
	
	ColorValue namedValueNames do: [:selector | 
		self assert: (ColorValue perform: selector) equals: (Color perform: selector) asColorValue ].
	
	self assert: ColorValue namedValueNames size equals: 8
		
]
