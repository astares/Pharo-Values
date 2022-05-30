"
ValuePrintvalue holds the data to print a `Value`.

Instance Variables:
	arguments	<`SequenceableCollection` of: (`PrintArgument` | `EmptyArgument`)> the arguments
	classname	<`String`>
"
Class {
	#name : #ValuePrintValue,
	#superclass : #PrintValue,
	#instVars : [
		'classname',
		'arguments'
	],
	#category : #'Values-Core-Base'
}
