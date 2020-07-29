class Song
  attr_accessor :name, :artist_name
  @@all = []
<<<<<<< HEAD
  
  def self.create 
    # initializes a song and saves it to the @@all class variable 
    # either literally or through the class method
    s = self.new 
    s.save 
    s
  end 
 
  def self.create_by_name(string_name_of_the_song)
    # takes in the string name of a song and returns a 
    # song instance with that name set as its name property 
    s = self.new 
    s.name = string_name_of_the_song
    s.save 
    s
    # and the song being saved into the @@all class variable.
  end
 
  def self.new_by_name(string_name_of_the_song)
    # takes in the string name of a song and returns a 
    # song instance with that name set as its name property. 
    
    # should return an instance of Song and not a simple string or anything else.
    s = self.new 
    s.name = string_name_of_the_song
    s
    # there's nothing in the instructions about saving to the @@all class variable
  end 
  
  def self.find_by_name(string_name_of_the_song) 
    # accepts the string name of a song and returns 
    # the matching instance of the song with that name.
    self.all.detect {|i| i.name == string_name_of_the_song}
  end
  
  def self.find_or_create_by_name(find_this_song)
    # This method will accept a string name for a song and 
    # either return a matching song instance with that name 
    # or create a new song with the name and return the song instance.
    did_i_find_it = self.all.detect {|x| x.name == find_this_song}
    if did_i_find_it == nil
      s = self.new 
      s.name = find_this_song
      s.save 
      s
    else
      did_i_find_it
    end
  end 

  def self.alphabetical
    self.all.sort_by { |x| x.name}
  end 
  
  def self.new_from_filename(mp3_formatted_file)
    # Build a class constructor that accepts a filename in the 
    # format of " - .mp3", for example "Taylor Swift - Blank Space.mp3".
    
    # Given Song.new_from_filename("Taylor Swift - Blank Space.mp3"), 
    # the constructor should return a new Song instance with the song 
    # name set to Blank Space and the artist_name set to Taylor Swift.
    c = self.new 
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c
  end 
=======

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    #@@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find{|x| x.name == name}
  end
>>>>>>> 2a5b2d7a80f462ab1875fad7aa8db38a0a449fa4
  
  def self.find_or_create_by_name(name)
      #if self.find_by_name(name) == nil 
        #self.create_by_name(name)
      #else
        #self.find_by_name(name)
      #end
      self.find_by_name(name) || self.create_by_name(name)
      #the above statement is saying do this(if it is true) or that (if the first thing is not true and the second thing is true)
  end
  
<<<<<<< HEAD
  
  
  
  
  
  
  def self.create_from_filename(mp3_formatted_file)
    # Build a class constructor that accepts a filename in the 
    # format of " - .mp3", for example "Taylor Swift - Blank Space.mp3".
    
    # Given Song.new_from_filename("Taylor Swift - Blank Space.mp3"), 
    # the constructor should return a new Song instance with the song 
    # name set to Blank Space and the artist_name set to Taylor Swift.
    c = self.new 
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c.save
    c
  end 
 
  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
 
end

zaza = Song.create
zaza.name = "Sugar Zaza"
zaza.artist_name = "Shoshi"

loon = Song.create
loon.name = "Moon Landing"
loon.artist_name = "Major Tom"

Song.all

song = Song.create
song.name = "Haunted House"
Song.all.include?(song)

song2 = Song.new_by_name("The Middle")
#=> #<Song @name="The Middle">
song2.name #=> "The Middle"
song2

song3 = Song.create_by_name("Banjo-Song")
#=> #<Song:0x007fd2a2989ff0 @name="Banjo-Song">
song3
#=> #<Song:0x007fd2a2989ff0 @name="Banjo-Song">
song3.artist_name = "Redneck Dude"
Song.all.include?(song3)
#=> true

Song.find_by_name("Banjo-Song")

# song4 = Song.find_or_create_by_name("Sugar Zaza")
song5 = Song.find_or_create_by_name("Banjo-Song")
Song.all

song_6 = Song.find_or_create_by_name("Blank Space")
song_7 = Song.find_or_create_by_name("Blank Space")
song_6 == song_7
Song.alphabetical

song8 = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
song8.name #=> "Blank Space"
song8.artist_name #=> "Taylor Swift"

song9 = Song.create_from_filename("Nancy Ajram - Ani Alyek.mp3")
song9.name #=> "Anu Alyek"
song9.artist_name #=> "Nancy Ajram"
=======
  def self.alphabetical()
    #returns all the songs instances in ascending (a-z) alphabetical order.
    @@all.sort_by{|x| x.name}
  end
  
  
  def self.new_from_filename(name)
    song = self.new 
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end
  
  def self.create_from_filename(name)
  #class method should not only parse the filename correctly but should also save the song
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    @@all << song
    song
  end
  
  def self.destroy_all()
    #reset the state of the @@all class variable to an empty array thereby deleting all previous song instances.
    @@all.clear
  end

end



#this is for the create_from_filename method & destroy_all
#song = Song.create_from_filename("Taylor Swift - Blank Space.mp3")
#song = Song.create_from_filename("Test 02 - Test_02.mp3")
#song = Song.create_from_filename("Test 03 - Test_03.mp3")
#puts Song.all.inspect
#Song.destroy_all
#puts Song.all.inspect

#song.name #=> "Blank Space"
#song.artist_name #=> "Taylor Swift"


#this is for new_from_filename method
#song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
#song.name #=> "Blank Space"
#song.artist_name #=> "Taylor Swift"


#this is for the alphabetical method
#song = Song.create_by_name("Cranberry")
#song = Song.create_by_name("Apples")
#song = Song.create_by_name("Berry")
#Song.alphabetical


#this is for the find_or_create_by_name method
song_1 = Song.find_or_create_by_name("Blank Space")
song_2 = Song.find_or_create_by_name("Blank Space")
 
# song_1 and song_2 are conceptually the same song and should return the same song instance because of `.find_or_create_by_name.`
 
#song_1 == song_2 #=> true



#for find_by_name method
#the_middle = Song.create_by_name("The Middle")
#=> #<Song @name="The Middle">
#Song.find_by_name("The Middle")
#<Song @name="The Middle">

#for create_by_name method
#song = Song.create_by_name("The Middle")
#=> #<Song:0x007fd2a2989ff0 @name="The Middle">
#song
#=> #<Song:0x007fd2a2989ff0 @name="The Middle">
#Song.all.include?(song)
#=> true

#for create method
#song01 = Song.create
#song02 = Song.create
#song03 = Song.create
#Song.all.include?(song03) #=> true

#for new_by_name method
#song = Song.new_by_name("The Middle")
#=> #<Song @name="The Middle">
#song.name #=> "The Middle"


>>>>>>> 2a5b2d7a80f462ab1875fad7aa8db38a0a449fa4
