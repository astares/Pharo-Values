"
A baseline for [https://github.com/astares/Pharo-Values](https://github.com/astares/Pharo-Values)
"
Class {
	#name : #BaselineOfValues,
	#superclass : #BaselineOf,
	#category : #BaselineOfValues
}

{ #category : #baselines }
BaselineOfValues >> baseline: spec [
	<baseline>

	spec for: #common do: [
		"Packages"
		spec
			package: 'Values-Core';
			package: 'Values-Core-Tests' with: [ spec requires: #( 'Values-Core' ) ].

		"Group"
		spec
			group: 'Core' with: #('Values-Core' );
			group: 'Tests' with: #('Values-Core-Tests');
			group: 'CI' with: #('Tests').

		"Virtual groups"
		spec
			group: 'all' with: #('Core' 'Tests');
			group: 'default' with: #('all') ]
]
