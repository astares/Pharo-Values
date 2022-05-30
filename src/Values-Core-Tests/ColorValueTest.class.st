Class {
	#name : #ColorValueTest,
	#superclass : #TestCase,
	#instVars : [
		'white'
	],
	#category : #'Values-Core-Tests-Colors'
}

{ #category : #running }
ColorValueTest >> setUp [

	super setUp.
	white := ColorValue red: 1 green: 1 blue: 1
]

{ #category : #tests }
ColorValueTest >> testConversionToByteArray [

	self assert: white asByteArray equals: #[ 255 255 255 ]
]
