import React from "react";
import { Link } from "react-router-dom";
import { Button, IconButton } from "@material-tailwind/react";
import { UserCircleIcon } from "@heroicons/react/24/solid";

const Account = () => {
  return (
    <Link to="/auth/sign-in">
      <Button
        variant="text"
        color="blue-gray"
        className="hidden items-center gap-1 px-4 xl:flex normal-case"
      >
        <UserCircleIcon className="h-5 w-5 text-blue-gray-500" />
        Sign In
      </Button>
      <IconButton variant="text" color="blue-gray" className="grid xl:hidden">
        <UserCircleIcon className="h-5 w-5 text-blue-gray-500" />
      </IconButton>
    </Link>
  );
};

export default Account;
