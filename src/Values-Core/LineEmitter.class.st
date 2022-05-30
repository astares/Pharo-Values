"
Emits source as one line
"
Class {
	#name : #LineEmitter,
	#superclass : #SourceEmitter,
	#category : #'Values-Core-Formatting'
}

{ #category : #writing }
LineEmitter >> emitSeparator [

	self stream space
]
