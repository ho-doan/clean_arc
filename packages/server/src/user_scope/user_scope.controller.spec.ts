import { Test, TestingModule } from '@nestjs/testing';
import { UserScopeController } from './user_scope.controller';
import { UserScopeService } from './user_scope.service';

describe('UserScopeController', () => {
  let controller: UserScopeController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [UserScopeController],
      providers: [UserScopeService],
    }).compile();

    controller = module.get<UserScopeController>(UserScopeController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
