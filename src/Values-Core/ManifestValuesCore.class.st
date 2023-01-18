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
ManifestValuesCore class >> ruleClassNameInSelectorRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'Value class' #namedValuesRegistry #true)) #'2023-01-18T23:19:48.312596+01:00') )
]

{ #category : #'code-critics' }
ManifestValuesCore class >> ruleExcessiveArgumentsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'Timestamp class' #d:m:y:h:m:s: #true)) #'2023-01-18T23:19:32.613006+01:00') )
]

{ #category : #'code-critics' }
ManifestValuesCore class >> ruleLiteralArrayContainsSuspiciousTrueFalseOrNilRuleV1FalsePositive [
	^ #(#(#(#RGMetaclassDefinition #(#'ManifestValuesCore class' #ManifestValuesCore)) #'2023-01-18T23:21:08.606063+01:00') )
]

{ #category : #'code-critics' }
ManifestValuesCore class >> ruleNotEliminationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Value #isNotEmpty #false)) #'2022-05-30T19:52:31.284+02:00') )
]
