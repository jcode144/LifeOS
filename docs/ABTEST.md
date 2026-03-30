# Timothy Fazio - Signup Text vs Signup Button
## US2: Account Login
## Heart Metrics
* Number of accounts created per week.
* Click-through rate of the account creation button.
* Successful account creation completion rate.
## Hypothesis
If the account creation option is presented as a prominent button instead of text, then more users will notice it and create an account, because buttons are more visually recognizable as actions and improve call-to-action visibility.
## Experiment
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

## Variations
Current design:
[Current design][Current design] <br />

[Current design]: https://drive.google.com/file/d/1TP4qbDyEdubSxuxc4MBKxf7G0_AcqoVx/view?usp=sharing

Replace the text with a button:
[Changed design][Changed design] <br />

[Changed design]: https://drive.google.com/file/d/15zh7W1oIgdM-FG-stXgMggTKk778sHIO/view?usp=sharing

# Jackson Albro - Inspirational Quote on Dashboard vs No Quote
## US4: Golden Path
## Heart Metrics
* Happiness: User feedback
* Engagement: Daily app opens, Tasks checked/completed per session
* Retention: Day 1 / Day 3 return rate
## Hypothesis
* If we add a short inspirational quote to the dashboard, then users will feel more motivated and engaged, leading to increased retention and task completion.
## Experiment
Tools
* Firebase A/B Testing
* Firebase Remote Config
* Firebase Analytics

Audience
Target users:
* All users who land on the dashboard and use the app regularly

Traffic Allocation:
* 50% Control Group
* 50% Experiment Group

Events to track with Firebase Analytics:
* dashboard_viewed:	User lands on dashboard (default page if user has account)
* task_completed: User completes a task
* habit_check: User completes a habit iteration

## Variations
Current design:
[Current design][Dashboard Current design] <br />

[Dashboard Current design]: https://drive.google.com/file/d/1Yb_y7I55e-vk9YtuWSo_Yr-4vfn7RXCh/view?usp=drive_link

Placed an inspirational quote under the AI summary on the dashboard
[Changed design][Dashboard Changed design] <br />

[Dashboard Changed design]: https://drive.google.com/file/d/1Av-iIbp_JHoDz4lOU-PQqIWs5V1NA1gX/view?usp=drive_link

# Vince Halloran - AI Summary Shown on Dashboard Load vs AI Summary Hidden Behind "Show My Overview" Button
## US4: Golden Path
## Heart Metrics
* Happiness: User satisfaction with the dashboard experience
* Engagement: Daily app opens, AI summary views per session
* Retention: Day 1 / Day 7 return rate
## Hypothesis
If the Gemini AI summary is displayed automatically on dashboard load, then users will engage with the app more frequently and return daily, because the value of the app is delivered instantly without requiring extra steps.
## Experiment
Tools
* Firebase A/B Testing
* Firebase Remote Config
* Firebase Analytics
Audience
Target users:
* All users who land on the dashboard after logging in
Traffic Allocation:
* 50% Control Group
* 50% Experiment Group
Events to track with Firebase Analytics:
* dashboard_viewed: User lands on the dashboard
* ai_summary_viewed: AI summary is visible on screen
* show_overview_tapped: User taps the "Show My Overview" button (Variant B only)
* task_completed: User completes a task after viewing the dashboard
* habit_check: User completes a habit after viewing the dashboard
## Variations
Current design:
[Current design][Dashboard Current design] <br />
[Dashboard Current design]: https://your-screenshot-link-here

Replaced the auto-loaded AI summary with a "Show My Overview" button that reveals the summary on tap:
[Changed design][Dashboard Changed design] <br />
[Dashboard Changed design]: https://your-screenshot-link-here

# Anthony Jimenez - Login Navigation Text Under Signup vs No Navigation
## US2: Account Login
## Heart Metrics
* Number of successful logins per week.
* Click-through rate of the login navigation text.
* Login completion rate.
## Hypothesis
If we add “Already have an account? Log in” text under the create account section, then more users will be able to find and access the login page, because it improves visibility and makes navigation easier for returning users.
## Experiment
Tools
* Firebase A/B Testing
* Firebase Remote Config
* Firebase Analytics

Audience
Target users:
* All users who open the signup screen
* Returning users who already have accounts

Traffic Allocation:
* 50% Control Group
* 50% Experiment Group

Events to track with Firebase Analytics:
login_screen_view:	User opens signup page
login_nav_clicked:	User clicks the login navigation text
login_started:	User begins login process
login_success:	User successfully logs in

## Variations
Current design:
[Current design][Current design] <br />

[Current design]: https://drive.google.com/drive/u/0/home

Added navigation text under signup:
[Changed design][Changed design] <br />

[Changed design]: https://drive.google.com/file/d/1MMD-dfln5anUxU7iiQA73Ri60VyhJjku/view?usp=sharing
