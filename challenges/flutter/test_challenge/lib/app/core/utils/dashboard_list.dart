import 'package:flutter/material.dart';
import 'package:test_challenge/app/modules/dashboard/domain/entities/dashboard.dart';

List<Dashboard> dashboardList = [
  Dashboard(
    name: "Dashboard",
    route: null,
    iconData: Icons.dashboard,
  ),
  Dashboard(
    name: "Profile",
    route: "/dashboard/profile",
    iconData: Icons.person,
  ),
];
