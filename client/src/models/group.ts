export class Group {
  constructor(
    public id: number,
    public name: string,
    public description: string,
    public tags: string[],
    public memberCount: number
  ) {}
}
