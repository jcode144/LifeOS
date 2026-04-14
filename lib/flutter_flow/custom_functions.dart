import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import "package:shadcn_u_i_kit_v48jv9/backend/schema/structs/index.dart"
    as shadcn_u_i_kit_v48jv9_data_schema;
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';
import "package:shadcn_u_i_kit_v48jv9/backend/schema/structs/index.dart"
    as shadcn_u_i_kit_v48jv9_data_schema;
import "package:shadcn_u_i_kit_v48jv9/backend/schema/enums/enums.dart"
    as shadcn_u_i_kit_v48jv9_enums;
import 'package:shadcn_u_i_kit_v48jv9/flutter_flow/custom_functions.dart'
    as shadcn_u_i_kit_v48jv9_functions;

double numberTotalTasksDueD(List<TasksRecord> tasks) {
  int totalTasks = 0;
  int completedTasks = 0;

  for (var task in tasks) {
    if (task.hasCreated()) {
      totalTasks++;
      if (task.completed) {
        completedTasks++;
      }
    }
  }

  return totalTasks > 0 ? completedTasks / totalTasks : 0.0;
}

String numberTotalTasksDueW(List<TasksRecord> tasks) {
  int totalTasks = 0;
  int completedTasks = 0;

  for (var task in tasks) {
    if (task.hasCreated()) {
      totalTasks++;
      if (task.completed) {
        completedTasks++;
      }
    }
  }

  if (totalTasks == 0) {
    return "0%";
  }

  double percentage = (completedTasks / totalTasks) * 100;

  // Truncate to 1 decimal place (not rounding)
  double truncated = (percentage * 10).floor() / 10;

  if (truncated == 100.0) {
    return "100%!";
  }

  return "${truncated.toStringAsFixed(1)}%";
}

double numberWeeklyTasksDueD(List<TasksRecord> tasks) {
  // This function should only use tasks where the due_date is today or within the week. Any due date that is past a week or before today should not be included. Of the tasks left, divide the total number of completed tasks by the total number of tasks and round to the first decimal.
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime endOfWeek = today.add(Duration(days: 7));

  List<TasksRecord> filteredTasks = tasks.where((task) {
    if (task.hasDueTime()) {
      DateTime dueDate = task.dueTime!;
      DateTime due = DateTime(dueDate.year, dueDate.month, dueDate.day);

      return (due.isAtSameMomentAs(today) || due.isAfter(today)) &&
          due.isBefore(endOfWeek);
    }
    return false;
  }).toList();

  int totalTasks = filteredTasks.length;
  int completedTasks = filteredTasks.where((task) => task.completed).length;

  if (totalTasks == 0) return 0.0;
  double result = completedTasks / totalTasks;
  return result;
}

String numberWeeklyTasksDueW(List<TasksRecord> tasks) {
  // This function should only use tasks where the due_date is today or within the week. Any due date that is past a week or before today should not be included. Of the tasks left, divide the total number of completed tasks by the total number of tasks and round to the first decimal.
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime endOfWeek = today.add(Duration(days: 7));

  List<TasksRecord> filteredTasks = tasks.where((task) {
    if (task.hasDueTime()) {
      DateTime dueDate = task.dueTime!;
      DateTime due = DateTime(dueDate.year, dueDate.month, dueDate.day);

      return (due.isAtSameMomentAs(today) || due.isAfter(today)) &&
          due.isBefore(endOfWeek);
    }
    return false;
  }).toList();

  int totalTasks = filteredTasks.length;
  int completedTasks = filteredTasks.where((task) => task.completed).length;

  if (totalTasks == 0) {
    return "0%";
  }

  double percentage = (completedTasks / totalTasks) * 100;

  // Truncate to 1 decimal place (not rounding)
  double truncated = (percentage * 10).floor() / 10;

  if (truncated == 100.0) {
    return "100%!";
  }

  return "${truncated.toStringAsFixed(1)}%";
}

double calculateHabitCompletionPercentage(HabitsRecord habit) {
  // This function will take in a habit document, take the number of elements in the completed_dates list and divide it by the total number of days that have elapsed since the start date. For exaple, if I created the habit today and then marked it complete, the result should be 1/1 or 100%
  if (habit.completedDates.isEmpty) {
    return 0.0; // No completion if no start date or no completed dates
  }

  final totalDays =
      DateTime.now().difference(habit.startDate!).inDays + 1; // Include today
  final completedCount = habit.completedDates.length;

  return completedCount / totalDays * 100; // Return percentage
}

String findHabitWithLowestPercent(List<HabitsRecord> habits) {
  // Takes in a llist of habit documents, checks which one has the lowest  completionratep, and returns the name of that habit
  if (habits.isEmpty) return '';

  HabitsRecord lowestHabit = habits[0];

  for (var habit in habits) {
    if (habit.completionratep < lowestHabit.completionratep) {
      lowestHabit = habit;
    }
  }

  return lowestHabit.name;
}

int calculateBestStreak(HabitsRecord habit) {
  // Takes in a habit document, and finds the best streak of the habit using the completed_dates list. Missing dates will constitute a breaking of the streak.
  List<String> completedDates = habit.completedDates;
  if (completedDates.isEmpty) return 0;

  completedDates.sort(); // Sort the completed dates
  int bestStreak = 0;
  int currentStreak = 1;

  for (int i = 1; i < completedDates.length; i++) {
    DateTime previousDate = DateTime.parse(completedDates[i - 1]);
    DateTime currentDate = DateTime.parse(completedDates[i]);

    // Check if the current date is the next day of the previous date
    if (currentDate.difference(previousDate).inDays == 1) {
      currentStreak++;
    } else {
      bestStreak = math.max(bestStreak, currentStreak);
      currentStreak = 1; // Reset current streak
    }
  }

  // Final check for the last streak
  bestStreak = math.max(bestStreak, currentStreak);
  return bestStreak;
}

String getBestHabitStreakName(List<HabitsRecord> habits) {
  // searches across all habits and returns the name of the habit with the highest best_streak
  if (habits.isEmpty) return '';

  HabitsRecord bestHabit = habits[0];

  for (var habit in habits) {
    if (habit.currentStreak > bestHabit.currentStreak) {
      bestHabit = habit;
    }
  }

  return bestHabit.name;
}

int getBestHabitStreakStreak(List<HabitsRecord> habits) {
  if (habits.isEmpty) return 0;

  HabitsRecord bestHabit = habits[0];

  for (var habit in habits) {
    if (habit.currentStreak > bestHabit.currentStreak) {
      bestHabit = habit;
    }
  }

  return bestHabit.currentStreak;
}
