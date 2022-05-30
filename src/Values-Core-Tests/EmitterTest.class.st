Class {
	#name : #EmitterTest,
	#superclass : #TestCase,
	#category : #'Values-Core-Tests-Formatting'
}

{ #category : #'tests - class' }
EmitterTest >> testIsAbstract [

	self assert: Emitter isAbstract
]
