"
A PrintArgument holds the data to print one instance variable (constant) and its value.

	- name 	<`String`> 		the name of the argument
	- value 	<`PrintValue`>	the print value of the value
			
With `PrintValue` it represents the source for a Value
"
Class {
	#name : #PrintArgument,
	#superclass : #Value,
	#instVars : [
		'name',
		'value'
	],
	#category : #'Values-Core-Base'
}
