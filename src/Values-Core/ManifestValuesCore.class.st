"
Values are simple immutable literal objects

Defines the root class Value and provides
- printing instances
- equality
- an example

Specifies the responsibilities of subclasses to define the #localSpecification
"
Class {
	#name : #ManifestValuesCore,
	#superclass : #PackageManifest,
	#category : #'Values-Core-Manifest'
}

{ #category : #'code-critics' }
ManifestValuesCore class >> ruleBadMessageRule2V1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Value #isEqualValue: #false)) #'2022-05-30T19:42:13.003+02:00') #(#(#RGMethodDefinition #(#Value #hash #false)) #'2022-05-30T19:42:50.205+02:00') )
]

{ #category : #'code-critics' }
ManifestValuesCore class >> ruleNotEliminationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Value #isNotEmpty #false)) #'2022-05-30T19:52:31.284+02:00') )
]
