# Private Events - README

This is a project from The Odin Project to test understanding of database model associations.
More specifically on how to appropriate connect tables together when the models are creatively named,
such as User being able to be a :host as well as a :guest, and how an Event can have only one host,
but can have many guests, all while still maintaining Rails conventions and their helper methods.

The project itself is a website where a host can create an event at a date and location, and any number
of guests may join the event, where users and events are connected in a Guest List through table.

Finer details about the project can be found here at the source:
https://www.theodinproject.com/lessons/ruby-on-rails-private-events