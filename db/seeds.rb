# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first
#
members = Member.create!([
                          {
                            name: 'Dyllan',
                            surname: 'Cullingworth',
                            email: 'mmdyllan@gmail.com',
                            birthday: 26.years.ago,
                            games_played: 0,
                            current_rank: Member.count + 1
                          },
                          {
                            name: 'Chandre',
                            surname: 'Strydom',
                            email: 'cstrydom@gmail.com',
                            birthday: 22.years.ago,
                            games_played: 0,
                            current_rank: Member.count + 1
                          },
                          {
                            name: 'John',
                            surname: 'Michealson',
                            email: 'jmealson@gmail.com',
                            birthday: 36.years.ago,
                            games_played: 0,
                            current_rank: Member.count + 1
                          },
                          {
                            name: 'Billy',
                            surname: 'Cat',
                            email: 'meow@gmail.com',
                            birthday: 2.years.ago,
                            games_played: 0,
                            current_rank: Member.count + 1
                          },
                          {
                            name: 'Rebecca',
                            surname: 'Anderson',
                            email: 'andrebecson@gmail.com',
                            birthday: 18.years.ago,
                            games_played: 0,
                            current_rank: Member.count + 1
                          },
                          {
                            name: 'Michelle',
                            surname: 'Obama',
                            email: 'obamacare@gmail.com',
                            birthday: 29.years.ago,
                            games_played: 0,
                            current_rank: Member.count + 1
                          },
                          {
                            name: 'Larry',
                            surname: 'Thompson',
                            email: 'larry@gmail.com',
                            birthday: 26.years.ago,
                            games_played: 0,
                            current_rank: Member.count + 1
                          },
                          {
                            name: 'Mark',
                            surname: 'Otto',
                            email: 'ottomark@gmail.com',
                            birthday: 23.years.ago,
                            games_played: 0,
                            current_rank: Member.count + 1
                          },
                          {
                            name: 'Danielle',
                            surname: 'Green',
                            email: 'greenfamily@gmail.com',
                            birthday: 35.years.ago,
                            games_played: 0,
                            current_rank: Member.count + 1
                          },
                          {
                            name: 'Nolan',
                            surname: 'Carter',
                            email: 'narlan@gmail.com',
                            birthday: 6.years.ago,
                            games_played: 0,
                            current_rank: Member.count + 1
                          }
                        ])