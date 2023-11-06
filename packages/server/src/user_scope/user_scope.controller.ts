import { Controller, Get, Post, Body } from '@nestjs/common';
import { UserScopeService } from './user_scope.service';
import { CreateUserScopeDto } from './dto/create-user_scope.dto';

@Controller('user-scope')
export class UserScopeController {
  constructor(private readonly userScopeService: UserScopeService) {}

  @Post()
  create(@Body() createUserScopeDto: CreateUserScopeDto) {
    return this.userScopeService.create(createUserScopeDto);
  }

  @Get()
  findAll() {
    return this.userScopeService.findAll();
  }
}
