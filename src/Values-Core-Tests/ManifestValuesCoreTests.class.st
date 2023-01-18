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
ManifestValuesCoreTests class >> ruleCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#ValueMapTest #testAddingWithGrowth #false)) #'2023-01-18T23:18:06.47711+01:00') )
]

{ #category : #'code-critics' }
ManifestValuesCoreTests class >> ruleLiteralArrayContainsSuspiciousTrueFalseOrNilRuleV1FalsePositive [
	^ #(#(#(#RGMetaclassDefinition #(#'ManifestValuesCoreTests class' #ManifestValuesCoreTests)) #'2023-01-18T23:20:41.978968+01:00') )
]

{ #category : #'code-critics' }
ManifestValuesCoreTests class >> ruleReTemporaryNeitherReadNorWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#TestValue #foo #false)) #'2022-05-30T11:47:26.553+02:00') )
]

{ #category : #'code-critics' }
ManifestValuesCoreTests class >> ruleRefersToClassRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'TestValue class' #example #true)) #'2022-05-31T01:35:22.656+02:00') )
]
