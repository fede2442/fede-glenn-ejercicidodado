Class {
	#name : #Deck,
	#superclass : #Object,
	#instVars : [
		'deck'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Deck class >> with: aCollectionOfCards [ 
	^self new initializeWithCards: aCollectionOfCards
]

{ #category : #accessing }
Deck >> countCards [
	^ deck size
]

{ #category : #accessing }
Deck >> drawCard [
	deck isEmpty ifTrue:[EmptyDeckError signal: 'No more cards in the deck'].
	^ deck removeFirst
]

{ #category : #initialization }
Deck >> initializeWithCards: aCollectionOfCards [ 
	deck := aCollectionOfCards asOrderedCollection.
]

{ #category : #size }
Deck >> isEmpty [
	^ deck isEmpty
]

{ #category : #merging }
Deck >> mixWith: aDeck [ 
	aDeck isEmpty ifTrue:[EmptyDeckError signal: 'Trying to mix with an empty deck' ].
	aDeck countCards timesRepeat: [ self putAtBottom: aDeck drawCard ].
	^self shuffle
	 
]

{ #category : #accessing }
Deck >> putAtBottom: aCard [  
	deck addLast: aCard
]

{ #category : #shuffling }
Deck >> shuffle [
	deck shuffle
]
