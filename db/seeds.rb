# -*- encoding : utf-8 -*-
group = Group.first
if !group
	group = Group.create(name: 'Administrator')
end

user = User.first
if !user
	user = User.create(name: 'Administrator', email: 'admin@email.com.br', password: '123456', password_confirmation: '123456', group_id: group.id, role: 'administrator')
end

page = Page.first
if !page
	page = Page.create(title: 'Primeira Página', summary: '', description: 'Descrição', nickname: '', link: '', target: '', order: 0, status: 'A', user_id: user.id)
end

subpage = Subpage.first
if !subpage
	subpage = Subpage.create(title: 'Primeira Subpágina', summary: '', description: 'Descrição', nickname: '', link: '', target: '', order: 0, status: 'A', user_id: user.id, page_id: page.id)
end	
