require 'faker'

#teacher 	= Role.create!(title: 'teacher')
#student 	= Role.create!(title: 'student')
#principal = Role.create!(title: 'principal')
#parent 		= Role.create!(title: 'parent')

klass1 = Klass.create!(name: 'Math', status: 0, created_at: Time.now, updated_at: Time.now)
klass2 = Klass.create!(name: 'Science', status: 1, created_at: Time.now, updated_at: Time.now)
klass3 = Klass.create!(name: 'English', status: 0, created_at: Time.now, updated_at: Time.now)
klass4 = Klass.create!(name: 'History', status: 0, created_at: Time.now, updated_at: Time.now)

school1 = School.create!(name: 'Wittier', klasses: [klass1, klass2])
school2 = School.create!(name: 'Hunking', klasses: [klass3, klass4])

user_cred1 = Credential.create!(email: "jenn@donais.com",
																password: 'testtest',
																confirmed_at: Time.now)
user_cred2 = Credential.create!(email: "nate@jenkins.com",
																password:  'testtest',
																confirmed_at: Time.now)
user_cred3 = Credential.create!(email: "toni@donais.com",
																password:  'testtest',
																confirmed_at: Time.now)
user_cred4 = Credential.create!(email: "chris@donais.com",
																password:  'testtest',
																confirmed_at: Time.now)
user_cred5 = Credential.create!(email: "melissa@donais.com",
																password:  'testtest',
																confirmed_at: Time.now)
user_cred6 = Credential.create!(email: "mark@donais.com",
																password:  'testtest',
																confirmed_at: Time.now)

user1 = User.create!(
	first_name: "Jennifer",
	last_name: "Donais",
  address: "1 Main St.",
	phone_number: "555-555-5555",
	credential: user_cred1
)
user2 = User.create!(
	first_name: "Nate",
	last_name: "Jenkins",
  address: "1 Main St.",
  phone_number: "555-555-5555",
	credential: user_cred2
)
user3 = User.create!(
	first_name: "Toni",
	last_name: "Donais",
  address: "1 Main St.",
  phone_number: "555-555-5555",
	credential: user_cred3
)
user4 = User.create!(
	first_name: "Christopher",
	last_name: "Donais",
  address: "1 Main St.",
  phone_number: "555-555-5555",
	credential: user_cred4
)
user5 = User.create!(
	first_name: "Melissa",
	last_name: "Donais",
  address: "1 Main St.",
  phone_number: "555-555-5555",
	credential: user_cred5
)
user6 = User.create!(
	first_name: "Mark",
	last_name: "Donais",
  address: "1 Main St.",
  phone_number: "555-555-5555",
	credential: user_cred6
)

Registration.create!([
	{
		user: 					user1,
		registerable: 	klass1,
		role: 					Registration.roles[:teacher],
		authorization: 	Registration.authorizations[:write]
	},
	{
		user: 					user2,
		registerable: 	klass2,
		role: 					Registration.roles[:teacher],
		authorization: 	Registration.authorizations[:write]
	},
	{
		user: 					user4,
		registerable: 	klass1,
		role: 					Registration.roles[:student],
		authorization: 	Registration.authorizations[:read]
	},
	{
		user: 					user4,
		registerable: 	klass2,
		role: 					Registration.roles[:student],
		authorization: 	Registration.authorizations[:read]
	},
	{
		user: 					user5,
		registerable: 	klass2,
		role: 					Registration.roles[:student],
		authorization: 	Registration.authorizations[:read]
	},
	{
		user: 					user5,
		registerable: 	klass3,
		role: 					Registration.roles[:student],
		authorization: 	Registration.authorizations[:read]
	},
	{
		user: 					user1,
		registerable: 	school1,
		role: 					Registration.roles[:teacher],
		authorization: 	Registration.authorizations[:content]
	},
	{
		user: 					user2,
		registerable: 	school1,
		role: 					Registration.roles[:teacher],
		authorization: 	Registration.authorizations[:content]
	},
	{
		user: 					user3,
		registerable: 	school1,
		role: 					Registration.roles[:principal],
		authorization: 	Registration.authorizations[:write]
	},
	{
		user: 					user4,
		registerable: 	school1,
		role: 					Registration.roles[:student],
		authorization: 	Registration.authorizations[:read]
	},
	{
		user: 					user5,
		registerable: 	school1,
		role: 					Registration.roles[:student],
		authorization: 	Registration.authorizations[:read]
	},
	{
		user: 					user5,
		registerable: 	school2,
		role: 					Registration.roles[:student],
		authorization: 	Registration.authorizations[:read]
	}
])

p "Finished seeding!"
