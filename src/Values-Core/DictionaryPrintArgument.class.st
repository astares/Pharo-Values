"
DictionaryPrintArgument holds the `PrintValue`s for key and value of an entry in a dictionary.
Both key and value can be `Value`s
"
Class {
	#name : #DictionaryPrintArgument,
	#superclass : #PrintArgument,
	#category : #'Values-Core-Base'
}

{ #category : #specification }
DictionaryPrintArgument class >> localSpecification [

	<constant: #name class: #PrintValue>
	<constant: #value class: #PrintValue>
]
