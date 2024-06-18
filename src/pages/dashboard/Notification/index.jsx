import React from "react";

import Alerts from "./Alerts";
import AlertsWithIcon from "./AlertsWithIcon";

export function Notifications() {
  return (
    <div className="mx-auto my-20 flex max-w-screen-lg flex-col gap-8">
      <Alerts />
      <AlertsWithIcon />
    </div>
  );
}

export default Notifications;
