import { Injectable } from '@angular/core';
import { Group } from "../models/group";
import { resolveIn } from "../util/resolveIn";

interface RequestOptions {
  resource: string;
  method: "GET" | "POST" | "PUT" | "PATCH" | "DELETE";
  body?: object;
  params?: {
    [key: string]: string | number;
  };
}

const demoGroups: Group[] = [
  {
    id: 0,
    name: "WallStreetBets",
    tags: ["YOLO", "FUCK ME"],
    description: "yoooooooo diamond hands 💎👐 diamond hands hold hold hold woooooo",
    memberCount: 500
  },
  {
    id: 1,
    name: "Tech",
    tags: ["TECH", "STABLE"],
    description: "We're a group of investors interested in buying shares of technology firms large and small. Join us!",
    memberCount: 26
  }
];

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private baseUrl = 'https://api.wehedge.app';

  constructor() {}

  private async request<T>(options: RequestOptions): Promise<T> {
    const headers = (["GET", "DELETE"].includes(options.method)) ? {} : {
      'Content-Type': "application/json"
    };

    const url = new URL(options.resource, this.baseUrl);

    url.search = options.params ? Object.keys(options.params).map(
      key => `${encodeURIComponent(key)}=${encodeURIComponent(options.params[key])}`
    ).join("&") : "";

    try {
      const response = await fetch(url.toString(), {
        body: options.body ? JSON.stringify(options.body) : undefined,
        headers,
        method: options.method
      });

      return await response.json() as T;
    } catch (err) {
      throw new Error("There was an error :(");
    }
  }

  async getGroups(): Promise<Group[]> {
    return await resolveIn<Group[]>(demoGroups, 1000);
  }

  async getGroupById(id: number) {
    return await resolveIn(demoGroups.find(g => g.id === id), 1000);
  }

  async addGroupMember(memberId: number, groupId: number, contribution: number): Promise<void> {
    return await resolveIn(null, 1000);
  }
}
