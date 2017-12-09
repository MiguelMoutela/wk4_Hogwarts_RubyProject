require('pry')
require_relative('../models/student.rb')
require_relative('../models/house.rb')

#Houses

house_1 = House.new({
  'name' => 'Gryffindor',
  'image_url' => 'https://vignette.wikia.nocookie.net/harrypotter/images/9/96/Gryffindor_crest_by_tuliipiie-d491bqc.jpg/revision/latest?cb=20130508231701'
})

house_1.save

house_2 = House.new({
  'name' => 'Hufflepuff',
  'image_url' => 'https://vignette.wikia.nocookie.net/harrypotter/images/e/e4/Hufflepuff.jpg/revision/latest?cb=20110817075555'
})

house_2.save

house_3 = House.new({
  'name' => 'Ravenclaw',
  'image_url' => 'https://www.hp-lexicon.org/wp-content/uploads/2015/08/shield_rav-200x0-c-default.jpg'
})

house_3.save

house_4 = House.new({
  'name' => 'Slytherin',
  'image_url' => 'https://vignette1.wikia.nocookie.net/harryalbuspotter/images/4/45/Slytherin_by_melisarodriguez-d47ly0k.png/revision/latest?cb=20140621170234'
})

house_4.save


#Students

student_1 = Student.new({
    'first_name' => 'Harry',
    'last_name' => 'Potter',
    'house_id' => 4,
    'age' => 6
})

student_1.save

student_2 = Student.new({
    'first_name' => 'Hermione',
    'last_name' => 'Granger',
    'house_id' => 1,
    'age' => 6
})

student_2.save

student_3 = Student.new({
    'first_name' => 'Ron',
    'last_name' => 'Weasley',
    'house_id' => 1,
    'age' => 6
})

student_3.save

binding.pry
nil
