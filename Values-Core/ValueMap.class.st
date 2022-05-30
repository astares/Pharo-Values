"
A ValueMap is an ordered dictionary preserving the order in which entries are added.

Instances are also used as ordered volatile dictionary, not just as value.

In VisualWorks, ValueMap is subclassed from Dictionary to inherit the dictionary API.

Instance Variables:
	order	<`SequenceableCollection` of: Object>		the ordered keys


The class used to be named `OrderedDictionary`, but was renamed for dialect compatibility with Pharo, which has a class named `OrderedDictionary` with different semantics.
"
Class {
	#name : #ValueMap,
	#superclass : #OrderedDictionary,
	#category : #'Values-Core-Collections'
}
