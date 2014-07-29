a = Tag.create(tag_name: "fudgepackers")
Tag.create(tag_name: "tiredness")
Tag.create(tag_name: "bored")



jerbear = User.create(fullname: "Jeremy Wong", email: "jermspeaks@gmail.com", password: 'very_secure_password', password_confirmation: 'very_secure_password')

Post.create(title: 'The crazy got me', body: "Marek is tired. He won\'t pay attention to our converation.", user: jerbear)
