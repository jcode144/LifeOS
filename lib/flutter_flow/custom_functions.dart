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
