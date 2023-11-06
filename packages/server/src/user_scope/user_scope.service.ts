import { Injectable } from '@nestjs/common';
import { CreateUserScopeDto } from './dto/create-user_scope.dto';
import { UserScope } from './entities/user_scope.entity';

const userScopes: UserScope[] = [];

@Injectable()
export class UserScopeService {
  create(dto: CreateUserScopeDto) {
    const userScope = new UserScope();
    userScope.id = dto.id;
    userScope.name = dto.name;
    userScope.point = dto.point;
    const index = userScopes.findIndex((e) => {
      e.id === userScope.id;
    });
    if (index === -1) userScopes.push(userScope);
    else userScopes[index] = userScope;
    return userScope;
  }

  findAll() {
    if (userScopes.length == 0) {
      const userScope = new UserScope();
      userScope.id = 'demo';
      userScope.name = 'Hodoan';
      userScope.point = '100';
      userScopes.push(userScope);
    }

    return userScopes;
  }
}
