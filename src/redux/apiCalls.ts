import axios from "axios";
import { IGetNewsQuery } from "./interfaces/home";

export const urlBack = process.env.REACT_APP_ADDRESS_API || "";

// GET REQUESTS
export async function fetchMain() {
  try {
    const res = await fetch(urlBack);

    return (await res.json()).data;
  } catch (error) {
    throw error;
  }
}

export async function fetchWeather() {
  try {
    const res = await axios.get(process.env.REACT_APP_WEATHER_API || "");

    return res.data;
  } catch (error) {
    throw error;
  }
}

export async function fetchLocalNews(query: IGetNewsQuery) {
  try {
    const res = await axios.get(urlBack + "main-page", {
      params: { ...query },
    });

    return res.data.data;
  } catch (error) {
    throw error;
  }
}

export async function fetchGlobalNews(query: IGetNewsQuery) {
  try {
    const res = await axios.get(urlBack + "main-page", {
      params: { ...query },
    });

    return res.data.data;
  } catch (error) {
    throw error;
  }
}

export async function fetchChampionships() {
  try {
    const res = await axios.get(urlBack + "main-page/championships");

    return res.data.data;
  } catch (error) {
    throw error;
  }
}

export async function fetchVideoNews(query: IGetNewsQuery) {
  try {
    const res = await axios.get(urlBack + "main-page", {
      params: { ...query },
    });

    return res.data.data;
  } catch (error) {
    throw error;
  }
}

export async function fetchFederationSports() {
  try {
    const res = await fetch(urlBack + "federation-page/sports");

    return (await res.json()).data;
  } catch (error) {
    throw error;
  }
}

export async function fetchFederationTrainers() {
  try {
    const res = await fetch(urlBack + "federation-page/trainers");

    return (await res.json()).data;
  } catch (error) {
    throw error;
  }
}

export async function fetchFederationAthletes() {
  try {
    const res = await fetch(urlBack + "federation-page/athletes");

    return (await res.json()).data;
  } catch (error) {
    throw error;
  }
}

export async function fetchGymsClubsFilters(lang: string) {
  try {
    const res = await fetch(
      urlBack + `gyms-and-clubs-page/filters?lang=${lang}`
    );

    return (await res.json()).data;
  } catch (error) {
    throw error;
  }
}

export async function fetchHCDepartments(lang: string) {
  try {
    const res = await axios.get(urlBack + "hcdepartment-page/health_care", {
      params: { lang },
    });

    return res.data.data;
  } catch (error) {
    throw error;
  }
}

export async function fetchCompetitions() {
  try {
    const res = await fetch(urlBack + "competition-page");

    return (await res.json()).data;
  } catch (error) {
    throw error;
  }
}

export async function fetchCompetitionFilters(lang: string) {
  try {
    const res = await axios.get(urlBack + "competition-page/filters", {
      params: { lang },
    });

    return res.data.data;
  } catch (error) {
    throw error;
  }
}

// PATCH REQUESTS
export async function increaseNewsView(id: string, categoryId: string) {
  try {
    const res = await axios.patch(urlBack + "news-details/" + id, null, {
      params: { categoryId },
    });

    return res.data;
  } catch (error) {
    throw error;
  }
}

// POST REQUESTS
export async function doLogin(data: object) {
  try {
    const res = await axios.post(urlBack + "auth/signin", data);

    return res.data.data;
  } catch (error) {
    throw error;
  }
}
export async function doSearch(params: object) {
  try {
    const res = await axios.post(urlBack + "search", null, { params });

    return res.data.data;
  } catch (error) {
    throw error;
  }
}
export async function filterGymsClubs(params: object) {
  try {
    const res = await axios.post(urlBack + "gyms-and-clubs-page/filter", null, {
      params,
    });

    return res.data.data;
  } catch (error) {
    throw error;
  }
}
export async function filterCompetitions(params: any) {
  try {
    const res = await axios.post(urlBack + "competition-page/filter", null, {
      params,
    });

    return res.data.data;
  } catch (error) {
    throw error;
  }
}
