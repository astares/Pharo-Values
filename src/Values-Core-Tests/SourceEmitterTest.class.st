Class {
	#name : #SourceEmitterTest,
	#superclass : #TestCase,
	#category : #'Values-Core-Tests-Formatting'
}

{ #category : #'tests - class' }
SourceEmitterTest >> testIsAbstract [

	self assert: SourceEmitter isAbstract
]
