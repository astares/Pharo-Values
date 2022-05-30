"
TextLineEmitter emits text as one line
"
Class {
	#name : #TextLineEmitter,
	#superclass : #TextEmitter,
	#category : #'Values-Core-Formatting'
}

{ #category : #writing }
TextLineEmitter >> emitSeparator [

	self stream space
]
