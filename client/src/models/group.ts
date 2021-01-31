import { Tag } from "./tag";

export class Group {
  constructor(
    public id: number,
    public name: string,
    public description: string,
    public tags: Tag[],
    public memberCount: number
  ) {}
}
