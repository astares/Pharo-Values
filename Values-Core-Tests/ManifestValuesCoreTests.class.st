"
Tests for Values-Core package.

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
