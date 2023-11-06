import { Test, TestingModule } from '@nestjs/testing';
import { UserScopeService } from './user_scope.service';

describe('UserScopeService', () => {
  let service: UserScopeService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [UserScopeService],
    }).compile();

    service = module.get<UserScopeService>(UserScopeService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
