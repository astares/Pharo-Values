"
Emitter outputs a Printvalue as formatted source code to a stream.
Subclasses write source or text.
This implements the second pass of the source generation for `Values`.

Instance Variables
	printer	<`ValuePrinter`>				the printer to resolve namespace names
	level		<`Integer`>						the indentionS level
	stream		<`WriteStream` | `TextStream`>		the output stream
"
Class {
	#name : #Emitter,
	#superclass : #Object,
	#instVars : [
		'printer',
		'stream',
		'level'
	],
	#category : #'Values-Core-Formatting'
}
