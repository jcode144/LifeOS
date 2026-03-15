## Timothy Fazio - Signup Text vs Signup Button
# US2: Account Login
# Heart Metrics
* Number of accounts created per week.
* Click-through rate of the account creation button.
* Successful account creation completion rate.
# Hypothesis
If the account creation option is presented as a prominent button instead of text, then more users will notice it and create an account, because buttons are more visually recognizable as actions and improve call-to-action visibility.
# Experiment
Tools
* Firebase A/B Testing
* Firebase Remote Config
* Firebase Analytics

Audience
Target users:
* All users who open the login screen
* Primarily new users without accounts

Traffic Allocation:
* 50% Control Group
* 50% Experiment Group

Events to track with Firebase Analytics:
login_screen_view:	User opens login page
signup_option_clicked:	User clicks signup link or button
account_creation_started:	Signup process begins
account_created:	Account successfully created

# Variations
Current design:
[Current design][Current design] <br />

[Current design]: https://drive.google.com/file/d/1TP4qbDyEdubSxuxc4MBKxf7G0_AcqoVx/view?usp=sharing

Replace the text with a button:
[Changed design][Changed design] <br />

[Changed design]: https://drive.google.com/file/d/15zh7W1oIgdM-FG-stXgMggTKk778sHIO/view?usp=sharing
