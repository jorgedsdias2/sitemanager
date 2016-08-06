# -*- encoding : utf-8 -*-
if User.count == 0
	group = Group.create(name: 'Administrator')
	User.create(name: 'Administrator', email: 'admin@email.com.br', password: '123456', password_confirmation: '123456', group_id: group.id, role: 'administrator')
end
