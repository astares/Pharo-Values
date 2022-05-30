Class {
	#name : #PrintValueTest,
	#superclass : #TestCase,
	#category : #'Values-Core-Tests-Base'
}

{ #category : #'tests - class' }
PrintValueTest >> testIsAbstract [

	self assert: PrintValue isAbstract
]
