@status
Feature: User Status

	Background: signed in
		Given I am signed in to my teams page

	@active
	Scenario: The one where Im available
		Then my status should show that Im available

	@mute
	Scenario: The one where I mute notifications
		When I decide to mute all messages
		Then it should be visably clear that I have

	@away
	Scenario: The one where Im not available
		When I want other team members to be aware that Im away
		Then my status should tell them this

