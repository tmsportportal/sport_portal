import {
  HomeIcon,
  UserCircleIcon,
  TableCellsIcon,
  InformationCircleIcon,
  ServerStackIcon,
  NewspaperIcon,
  VideoCameraIcon,
} from "@heroicons/react/24/solid";
import { Home, Profile, Tables, Notifications } from "@/pages/dashboard";
import News from "./pages/news";
import Videos from "./pages/news/Videos";
import {
  HOME,
  NEWS,
  NOTIFICATIONS,
  PROFILE,
  SIGNIN,
  TABLES,
  VIDEOS,
} from "./types/paths";
import { SignIn } from "./pages/auth";

const icon = {
  className: "w-5 h-5 text-inherit",
};

export const routes = [
  {
    layout: "dashboard",
    pages: [
      {
        icon: <HomeIcon {...icon} />,
        name: "dashboard",
        path: HOME,
        element: <Home />,
      },
      {
        icon: <UserCircleIcon {...icon} />,
        name: "profile",
        path: PROFILE,
        element: <Profile />,
      },
      {
        icon: <TableCellsIcon {...icon} />,
        name: "tables",
        path: TABLES,
        element: <Tables />,
      },
      {
        icon: <InformationCircleIcon {...icon} />,
        name: "notifications",
        path: NOTIFICATIONS,
        element: <Notifications />,
      },
    ],
  },
  // {
  //   title: "auth pages",
  //   layout: "auth",
  //   pages: [
  //     {
  //       icon: <ServerStackIcon {...icon} />,
  //       name: "sign in",
  //       path: SIGNIN,
  //       element: <SignIn />,
  //     },
  //     // {
  //     //   icon: <RectangleStackIcon {...icon} />,
  //     //   name: "sign up",
  //     //   path: SIGNIN,
  //     //   element: <SignUp />,
  //     // },
  //   ],
  // },
  {
    title: "News pages",
    layout: "news",
    pages: [
      {
        icon: <NewspaperIcon {...icon} />,
        name: "Local & Global",
        path: NEWS,
        element: <News />,
      },
      {
        icon: <VideoCameraIcon {...icon} />,
        name: "Videos",
        path: VIDEOS,
        element: <Videos />,
      },
    ],
  },
];

export default routes;
