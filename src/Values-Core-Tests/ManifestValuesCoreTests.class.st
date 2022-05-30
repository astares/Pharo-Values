"
Tests for Values-Core package - Values are simple immutable literal objects.

Includes conformance tests for all leaf classes of `Value` and other.
"
Class {
	#name : #ManifestValuesCoreTests,
	#superclass : #PackageManifest,
	#category : #'Values-Core-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestValuesCoreTests class >> ruleReTemporaryNeitherReadNorWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#TestValue #foo #false)) #'2022-05-30T11:47:26.553+02:00') )
]

{ #category : #'code-critics' }
ManifestValuesCoreTests class >> ruleRefersToClassRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'TestValue class' #example #true)) #'2022-05-31T01:35:22.656+02:00') )
]
