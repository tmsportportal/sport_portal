import React from "react";
import {
  Typography,
  Alert,
  Card,
  CardHeader,
  CardBody,
} from "@material-tailwind/react";

const Alerts = () => {
  const [showAlerts, setShowAlerts] = React.useState({
    blue: true,
    green: true,
    orange: true,
    red: true,
  });
  const alerts = ["gray", "green", "orange", "red"];

  return (
    <Card>
      <CardHeader
        color="transparent"
        floated={false}
        shadow={false}
        className="m-0 p-4"
      >
        <Typography variant="h5" color="blue-gray">
          Alerts
        </Typography>
      </CardHeader>
      <CardBody className="flex flex-col gap-4 p-4">
        {alerts.map((color) => (
          <Alert
            key={color}
            open={showAlerts[color]}
            color={color}
            onClose={() =>
              setShowAlerts((current) => ({ ...current, [color]: false }))
            }
          >
            A simple {color} alert with an <a href="#">example link</a>. Give it
            a click if you like.
          </Alert>
        ))}
      </CardBody>
    </Card>
  );
};

export default Alerts;
