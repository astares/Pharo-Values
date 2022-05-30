"
DictionaryPrintValue is used for printing Dictionaries

Instance Variables:
	arguments	<`SequenceableCollection` of `DictionaryPrintArgument`>	the PrintArguments for each entry
"
Class {
	#name : #DictionaryPrintValue,
	#superclass : #PrintValue,
	#instVars : [
		'arguments',
		'isOrdered'
	],
	#category : #'Values-Core-Base'
}
