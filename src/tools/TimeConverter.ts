import { monthsRu, monthsTm } from "./constants";

export const DateTimeToPassedTime = (lang: string, datetime?: Date) => {
  const now = new Date().getTime();
  const updated = new Date(datetime || "").getTime();
  const postedAt = now - updated;
  const uploaded = Math.round(postedAt / 1000 / 60 / 60 / 24)
    ? `${Math.round(postedAt / 1000 / 60 / 60 / 24)} ${
        lang === "Tm" ? "gün öň" : "дня(день) назад"
      }`
    : Math.round(postedAt / 1000 / 60 / 60)
    ? `${Math.round(postedAt / 1000 / 60 / 60)} ${
        lang === "Tm" ? "sagat öň" : "час(а) назад"
      }`
    : Math.round(postedAt / 1000 / 60)
    ? `${Math.round(postedAt / 1000 / 60)} ${
        lang === "Tm" ? "minut öň" : "минут(ы) назад"
      }`
    : `${lang === "Tm" ? "1 minut öň" : "1 минуту назад"}`;

  return uploaded;
};

export const DateTimeFormation = (lang: string, date: Date): string => {
  const day = new Date(date).getDate();
  const month = new Date(date).getMonth();
  const year = new Date(date).getFullYear();

  return (
    day + " " + (lang === "Tm" ? monthsTm[month] : monthsRu[month]) + " " + year
  );
};
