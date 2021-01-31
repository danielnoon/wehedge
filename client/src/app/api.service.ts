import { Injectable } from '@angular/core';
import { Group } from "../models/group";
import { resolveIn } from "../util/resolveIn";
import { Tag } from "../models/tag";

interface RequestOptions {
  resource: string;
  method: "GET" | "POST" | "PUT" | "PATCH" | "DELETE";
  body?: object;
  params?: {
    [key: string]: string | number;
  };
}

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

  async getGroups(filters?: {
    tags?: number[],
    query?: string
  }): Promise<Group[]> {
    const { tags, query } = filters ?? {};
    if (tags || query) {
      console.log(filters);
    }
    return await this.request<Group[]>({
      resource: '/groups',
      method: "GET",
    });
  }

  async getGroupById(id: number) {
    return await this.request<Group>({
      method: "GET",
      resource: '/groups/' + id
    });
  }

  async addGroupMember(memberId: number, groupId: number, contribution: number): Promise<void> {
    return await resolveIn(null, 1000);
  }

  async getAllTags() {
    return await this.request<Tag[]>({
      method: "GET",
      resource: '/tags/index'
    });
  }

  async createGroup(params: {
    name: string,
    tags: number[],
    description: string,
    private: boolean
  }) {
    const {name, tags, description} = params;
    return await this.request<{id: number}>({
      resource: '/groups',
      method: "POST",
      body: {
        name,
        tags,
        description
      }
    });
  }

  async register(params: {
    username: string;
    password: string;
    firstName: string;
    lastName: string;
  }) {
    // tslint:disable-next-line:variable-name
    const { username, password, firstName: first_name, lastName: last_name } = params;
    return await this.request<{ id: number, token: string }>({
      resource: '/users/new',
      method: "POST",
      body: {
        username,
        password,
        first_name,
        last_name
      }
    });
  }

  async login(params: {
    username: string;
    password: string;
  }) {
    // tslint:disable-next-line:variable-name
    const { username, password } = params;
    return await this.request<{ id: number, token: string }>({
      resource: '/users/login',
      method: "POST",
      body: {
        username,
        password,
      }
    });
  }
}
