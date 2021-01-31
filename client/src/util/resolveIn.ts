export function resolveIn<T>(value: T, ms: number): Promise<T> {
  return new Promise(r => setTimeout(() => r(value), ms));
}
