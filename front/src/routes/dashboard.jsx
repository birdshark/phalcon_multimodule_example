import DashboardPage from "views/Dashboard/Dashboard.jsx";
import UserProfile from "views/UserProfile/UserProfile.jsx";
import TableList from "views/TableList/TableList.jsx";
import Typography from "views/Typography/Typography.jsx";
import Icons from "views/Icons/Icons.jsx";
import Maps from "views/Maps/Maps.jsx";
import NotificationsPage from "views/Notifications/Notifications.jsx";

import {
  Dashboard,
  Person,
  ContentPaste,
  LibraryBooks,
  BubbleChart,
  LocationOn,
  Notifications
} from "@material-ui/icons";

const dashboardRoutes = [
  {
    path: "/dashboard",
    sidebarName: "控制台",
    navbarName: "Material Dashboard",
    icon: Dashboard,
    component: DashboardPage
  },
  {
    path: "/user",
    sidebarName: "用户",
    navbarName: "Profile",
    icon: Person,
    component: UserProfile
  },
  {
    path: "/table",
    sidebarName: "表格",
    navbarName: "Table List",
    icon: ContentPaste,
    component: TableList
  },
  {
    path: "/typography",
    sidebarName: "文本",
    navbarName: "Typography",
    icon: LibraryBooks,
    component: Typography
  },
  {
    path: "/icons",
    sidebarName: "图标",
    navbarName: "Icons",
    icon: BubbleChart,
    component: Icons
  },
  {
    path: "/maps",
    sidebarName: "地图",
    navbarName: "Map",
    icon: LocationOn,
    component: Maps
  },
  {
    path: "/notifications",
    sidebarName: "提示",
    navbarName: "Notifications",
    icon: Notifications,
    component: NotificationsPage
  },
  { redirect: true, path: "/", to: "/dashboard", navbarName: "Redirect" }
];

export default dashboardRoutes;
