[LifeOS Heart Framework](https://docs.google.com/presentation/d/1UNMpa46GYfoUQghHTcHfi7cyNXX8xTqsGqum7ubgU2M/edit?usp=sharing)
# Happiness
* NPS (Net Promoter Score) 
# Engagement

# Adoption
* Number of new users per week: Firebase
* First task and habit creation: Query the user database and check to see if each account has a task and habit associated with it.

# Retention
* Retention Rate (Day 1, Day 7, Day 30): Track when a user signs up and store a timestamp. Compare with their last_active date to see if they return within 1, 7, or 30 days. Use Firebase Analytics or Firestore queries to calculate percentages.
* User streak length / habit consistency: Store a streak_count and last_active_day for each user. If they complete a habit daily, increase streak. If they miss a day, reset. Measures consistency.
* Weekly Active Users (WAU) / Monthly Active Users (MAU): Use last_active timestamps. Count unique users active in last 7 days (WAU) and 30 days (MAU). Shows how often people come back.
* Churn rate: Define churn as users inactive for 7+ or 30+ days. Use last_active to identify them. Churn rate = (# inactive users / total users).

# Task Success
