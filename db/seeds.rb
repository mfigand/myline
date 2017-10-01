# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([
    {name: 'Manuel', email: 'manuel@gmail.com', password: '12345678', avatar_file_name: "story _1.jpeg", avatar_content_type: "image/jpeg", avatar_file_size: 170414,avatar_updated_at: (DateTime.now - 12.month).to_s},
    {name: 'Irene', email: 'irene@gmail.com', password: '12345678', avatar_file_name: "story _1.jpeg", avatar_content_type: "image/jpeg", avatar_file_size: 170414,avatar_updated_at: (DateTime.now - 12.month).to_s},
    {name: 'Abuelo', email: 'abuelo@gmail.com', password: '12345678', avatar_file_name: "story _1.jpeg", avatar_content_type: "image/jpeg", avatar_file_size: 170414,avatar_updated_at: (DateTime.now - 12.month).to_s},
    {name: 'Abuela', email: 'abuela@gmail.com', password: '12345678', avatar_file_name: "story _1.jpeg", avatar_content_type: "image/jpeg", avatar_file_size: 170414,avatar_updated_at: (DateTime.now - 12.month).to_s},
    {name: 'Tío', email: 'tio@gmail.com', password: '12345678', avatar_file_name: "story _1.jpeg", avatar_content_type: "image/jpeg", avatar_file_size: 170414,avatar_updated_at: (DateTime.now - 12.month).to_s},
    ])

stories = Story.create([
    {
        name: 'Story 1',
        date: DateTime.now - 12.month,
        image: '/team/img-1.jpg',
        tag: ['first'],
        teller_id: 2,
        user_id: 1,
        avatar_file_name: "story _1.jpeg", avatar_content_type: "image/jpeg", avatar_file_size: 170414,avatar_updated_at: (DateTime.now - 12.month).to_s
    },
    {
        name: 'Story 2',
        date: DateTime.now - 10.month,
        image: '/team/img-1.jpg',
        tag: ['activity', 'custom'],
        teller_id: 2,
        user_id: 1,
        avatar_file_name: "story _2.jpeg", avatar_content_type: "image/jpeg", avatar_file_size: 170414,avatar_updated_at: (DateTime.now - 10.month).to_s
    },
    {
        name: 'Story 3',
        date: DateTime.now - 8.month,
        image: '/team/img-1.jpg',
        tag: ['custom', 'trip'],
        teller_id: 2,
        user_id: 1,
        avatar_file_name: "story _3.jpeg", avatar_content_type: "image/jpeg", avatar_file_size: 170414,avatar_updated_at: (DateTime.now - 8.month).to_s
    },
    {
        name: 'Story 4',
        date: DateTime.now - 5.month,
        image: '/team/img-1.jpg',
        tag: ['first', 'activity'],
        teller_id: 2,
        user_id: 1,
        avatar_file_name: "story _4.jpeg", avatar_content_type: "image/jpeg", avatar_file_size: 170414,avatar_updated_at: (DateTime.now - 5.month).to_s
    },
    {
        name: 'Story 5',
        date: DateTime.now - 2.month,
        image: '/team/img-1.jpg',
        tag: ['trip', 'custom'],
        teller_id: 2,
        user_id: 1,
        avatar_file_name: "story _5.jpeg", avatar_content_type: "image/jpeg", avatar_file_size: 170414,avatar_updated_at: (DateTime.now - 2.month).to_s
    },
    {
        name: 'Story 6',
        date: DateTime.now,
        image: '/team/img-1.jpg',
        tag: ['activity'],
        teller_id: 2,
        user_id: 1,
        avatar_file_name: "story _6.jpeg", avatar_content_type: "image/jpeg", avatar_file_size: 170414,avatar_updated_at: (DateTime.now).to_s
    },
    {
        name: 'Story 7',
        date: DateTime.now + 3.month,
        image: '/team/img-1.jpg',
        tag: ['trip'],
        teller_id: 2,
        user_id: 1,
        avatar_file_name: "story _7.jpeg", avatar_content_type: "image/jpeg", avatar_file_size: 170414,avatar_updated_at: (DateTime.now + 3.month).to_s
    },
    {
        name: 'Story 8',
        date: DateTime.now + 5.month,
        image: '/team/img-1.jpg',
        tag: ['activity','first'],
        teller_id: 2,
        user_id: 1,
        avatar_file_name: "story _8.jpeg", avatar_content_type: "image/jpeg", avatar_file_size: 170414,avatar_updated_at: (DateTime.now + 5.month).to_s
    },
    {
        name: 'Story 9',
        date: DateTime.now + 7.month,
        image: '/team/img-1.jpg',
        tag: ['activity'],
        teller_id: 2,
        user_id: 1,
        avatar_file_name: "story _9.jpeg", avatar_content_type: "image/jpeg", avatar_file_size: 170414,avatar_updated_at: (DateTime.now + 7.month).to_s
    },
    {
        name: 'Story 10',
        date: DateTime.now + 10.month,
        image: '/team/img-1.jpg',
        tag: ['custom'],
        teller_id: 2,
        user_id: 1,
        avatar_file_name: "story _10.jpeg", avatar_content_type: "image/jpeg", avatar_file_size: 170414,avatar_updated_at: (DateTime.now + 10.month).to_s
    }
    ])

contexts = Context.create([{
    coverPicture: "",
    aboutDescription: "Hola Lucía, tus padres hemos creado este espacio para ti, en donde la gente que te quiere podrá guardar cosas y enviarte mensajes que pensamos te gustarán ver cuando seas mayor.\n\n\n\nCreemos que esta pequeña cápsula de tiempo te ayudará a entender de dónde vienes, el por qué la locura de tus padres y lo más importante que has estado rodeada de cariño desde el día que naciste.\n\n\n\nEsperamos te guste.\n\n",
    aboutPicture: "",
    aboutVideo: 'https://www.youtube.com/watch?v=ubdWitOk6zQ',
    parallaxPicture: "",
    user_id: 1
    }])

# tellers = Teller.create([{ name: 'Irene', title: 'Mamá', avatar: '/team/img-1.jpg', user_id: 1},
#     {
#     name: 'Irene',
#     title: 'Mamá',
#     avatar: '/team/img-1.jpg',
#     user_id: 1
#     },
#     {
#     name: 'Irene',
#     title: 'Mamá',
#     avatar: '/team/img-1.jpg',
#     user_id: 1
#     },
#     {
#     name: 'Irene',
#     title: 'Mamá',
#     avatar: '/team/img-1.jpg',
#     user_id: 1
#     },
#     {
#     name: 'Irene',
#     title: 'Mamá',
#     avatar: '/team/img-1.jpg',
#     user_id: 1
#     },
#     {
#     name: 'Irene',
#     title: 'Mamá',
#     avatar: '/team/img-1.jpg',
#     user_id: 1
#     },
#     {
#     name: 'Irene',
#     title: 'Mamá',
#     avatar: '/team/img-1.jpg',
#     user_id: 1
#     },
#     {
#     name: 'Irene',
#     title: 'Mamá',
#     avatar: '/team/img-1.jpg',
#     user_id: 1
#     },
#     {
#     name: 'Irene',
#     title: 'Mamá',
#     avatar: '/team/img-1.jpg',
#     user_id: 1
#     },
#     {
#     name: 'Irene',
#     title: 'Mamá',
#     avatar: '/team/img-1.jpg',
#     user_id: 1
#     },
#     {
#     name: 'Irene',
#     title: 'Mamá',
#     avatar: '/team/img-1.jpg',
#     user_id: 1
#     }
#     ])

# manuelTravelers = Travellers.create([
#     {
#     userId: 2,
#     name: 'Irene',
#     title: 'Mamá',
#     }
#     ])
