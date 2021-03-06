Class {
	#name : #ProbabilityDistributor,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #creating }
ProbabilityDistributor >> getShuffledCollection: aCollection defaultElement: defaultElement size: anInteger [
	| paddedCollection totalProbability |
	paddedCollection := aCollection asOrderedCollection.
	totalProbability := aCollection
		sum: [ :aProbableObject | aProbableObject probability ].
	totalProbability <= 1
		ifTrue: [ paddedCollection
				add:
					(ProbabilityWrapper
						with: defaultElement
						probability: (1 - totalProbability round: 3)) ]
		ifFalse: [ CreationError signal: 'Probability over 1' ].
	^ self getShuffledCollection: paddedCollection size: anInteger
]

{ #category : #creating }
ProbabilityDistributor >> getShuffledCollection: probableObjects size: length [
	| distributedArray base randy |
	distributedArray := OrderedCollection new.
	length
		timesRepeat: [ randy := Random new next.
			base := 0.
			probableObjects
				detect: [ :probableObject | 
					base := base + probableObject probability.
					randy <= base ]
				ifFound: [ :probableObject | distributedArray add: probableObject element ]
				ifNone: [ CreationError signal: 'Error with probabilities' ] ].
	^ distributedArray shuffle.	
]
