Class {
	#name : #TextEmitterTest,
	#superclass : #TestCase,
	#category : #'Values-Core-Tests-Formatting'
}

{ #category : #'tests - class' }
TextEmitterTest >> testIsAbstract [

	self assert: TextEmitter isAbstract
]
