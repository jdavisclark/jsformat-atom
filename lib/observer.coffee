# include event-kit to make use of CompositeDisposable
{CompositeDisposable} = require 'event-kit'

class Observer
 constructor: () ->
   @subscriptions = new CompositeDisposable

 addSubscription: (disposableSubscription) ->
   @subscriptions.add disposableSubscription

 destroy: ->
   @subscriptions.dispose() # Dispose of all subscriptions at once
