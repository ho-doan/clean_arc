import { Module } from '@nestjs/common';
import { UserScopeService } from './user_scope.service';
import { UserScopeController } from './user_scope.controller';

@Module({
  controllers: [UserScopeController],
  providers: [UserScopeService],
})
export class UserScopeModule {}
