import { TestBed } from '@angular/core/testing';

import { RootGuard } from './root.guard';

describe('RootGuardGuard', () => {
  let guard: RootGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(RootGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
